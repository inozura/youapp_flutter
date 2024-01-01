import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:youapp_test/core/app_route.dart';
import 'package:youapp_test/core/resources/resources.dart';
import 'package:youapp_test/core/widgets/text_f_bg.dart';
import 'package:youapp_test/core/widgets/widgets.dart';
import 'package:youapp_test/features/auth/domain/usecase/post_login.dart';
import 'package:youapp_test/features/auth/pages/pages.dart';
import 'package:youapp_test/utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// Controller
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();

  /// Focus Node
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();

  /// Global key
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (_, state) {
          state.whenOrNull(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();

              TextInput.finishAutofillContext();
            },
            failure: (message) {
              context.dismiss();
              message.toToastError(context);
            },
          );
        },
        child: Stack(children: [
          Container(
            width: Dimens.widthScreen,
            height: Dimens.heightScreen,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    center: Alignment.topRight,
                    radius: 3,
                    colors: [
                  Color.fromARGB(255, 1, 63, 72),
                  Color(0XFF0D1D23),
                  Color(0XF09141A),
                ])),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(Dimens.space24),
                child: AutofillGroup(
                  child: Form(
                    key: _keyForm,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Login',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: Dimens.titleLarge,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SpacerV(),
                        TextFwBackground(
                          autofillHints: const [AutofillHints.email],
                          key: const Key("email"),
                          curFocusNode: _fnEmail,
                          nextFocusNode: _fnPassword,
                          textInputAction: TextInputAction.next,
                          controller: _conEmail,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icon(
                            Icons.alternate_email,
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                          hintText: "eve.holt@reqres.in",
                          hint: 'Email',
                          validator: (String? value) => value != null
                              ? (!value.isValidEmail()
                                  ? 'Email is not valid'
                                  : null)
                              : null,
                        ),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (_, state) {
                            return TextFwBackground(
                              autofillHints: const [AutofillHints.password],
                              key: const Key("password"),
                              curFocusNode: _fnPassword,
                              textInputAction: TextInputAction.done,
                              controller: _conPassword,
                              keyboardType: TextInputType.text,
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color,
                              ),
                              obscureText:
                                  context.read<AuthCubit>().isPasswordHide ??
                                      false,
                              hintText: '••••••••••••',
                              maxLine: 1,
                              hint: 'Password',
                              suffixIcon: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () => context
                                    .read<AuthCubit>()
                                    .showHidePassword(),
                                icon: Icon(
                                  (context.read<AuthCubit>().isPasswordHide ??
                                          false)
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.color,
                                ),
                              ),
                              validator: (String? value) => value != null
                                  ? (value.length < 6
                                      ? 'Password is not valid'
                                      : null)
                                  : null,
                            );
                          },
                        ),
                        SpacerV(value: Dimens.space8),
                        Button(
                          title: 'Login',
                          onPressed: () {
                            if (_keyForm.currentState?.validate() ?? false) {
                              context.read<AuthCubit>().login(
                                    LoginParams(
                                      email: _conEmail.text,
                                      password: _conPassword.text,
                                    ),
                                  );
                            }
                          },
                        ),
                        SpacerV(value: Dimens.space16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'No Account?',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(fontSize: 14),
                            ),
                            ButtonText(
                              fontSize: 14,
                              horizontalMargin: 0,
                              title: 'Register Here',
                              onPressed: () {
                                /// Direct to register page
                                context.pushNamed(Routes.register.name);
                              },
                              textStyle: TextStyle(
                                color: Theme.of(context)
                                    .extension<LzyctColors>()!
                                    .yellow,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
