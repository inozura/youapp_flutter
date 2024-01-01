import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:youapp_test/core/resources/dimens.dart';
import 'package:youapp_test/core/resources/resources.dart';
import 'package:youapp_test/core/widgets/text_f_bg.dart';
import 'package:youapp_test/core/widgets/widgets.dart';
import 'package:youapp_test/features/auth/domain/usecase/post_register.dart';
import 'package:youapp_test/features/auth/pages/pages.dart';
import 'package:youapp_test/utils/utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  /// Controller
  final _conEmail = TextEditingController();
  final _conUsername = TextEditingController();
  final _conPassword = TextEditingController();
  final _conPasswordRepeat = TextEditingController();

  /// Focus Node
  final _fnEmail = FocusNode();
  final _fnUsername = FocusNode();
  final _fnPassword = FocusNode();
  final _fnPasswordRepeat = FocusNode();

  /// Global key form
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (_, state) {
          state.whenOrNull(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();
              'Success register'.toToastSuccess(context);

              /// back to login page after register success
              context.pop();
            },
            failure: (message) {
              context.dismiss();
              message.toToastError(context);
            },
          );
        },
        child: Stack(
          children: [
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
                  child: Form(
                    key: _keyForm,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Register',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: Dimens.titleLarge,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SpacerV(),
                        TextFwBackground(
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
                          hintText: 'Email',
                          hint: 'Email',
                          validator: (String? value) => value != null
                              ? (!value.isValidEmail()
                                  ? 'Email is not valid'
                                  : null)
                              : null,
                        ),
                        TextFwBackground(
                          key: const Key("username"),
                          curFocusNode: _fnUsername,
                          nextFocusNode: _fnPassword,
                          textInputAction: TextInputAction.next,
                          controller: _conUsername,
                          keyboardType: TextInputType.name,
                          prefixIcon: Icon(
                            Icons.alternate_email,
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                          hintText: 'Username',
                          hint: 'Username',
                          validator: (String? value) => value != null
                              ? (value.length < 4
                                  ? 'Password must be at least 4 characters'
                                  : null)
                              : null,
                        ),
                        BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (_, state) {
                            return Column(
                              children: [
                                TextFwBackground(
                                  key: const Key("password"),
                                  curFocusNode: _fnPassword,
                                  nextFocusNode: _fnPasswordRepeat,
                                  textInputAction: TextInputAction.next,
                                  controller: _conPassword,
                                  keyboardType: TextInputType.text,
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
                                  ),
                                  obscureText: context
                                          .read<RegisterCubit>()
                                          .isPasswordHide ??
                                      false,
                                  hintText: '••••••••••••',
                                  maxLine: 1,
                                  hint: 'Password',
                                  suffixIcon: IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () => context
                                        .read<RegisterCubit>()
                                        .showHidePassword(),
                                    icon: Icon(
                                      (context
                                                  .read<RegisterCubit>()
                                                  .isPasswordHide ??
                                              false)
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  validator: (String? value) => value != null
                                      ? (value.length < 6
                                          ? 'Password must be at least 6 characters'
                                          : null)
                                      : null,
                                  semantic: "password",
                                ),
                                TextFwBackground(
                                  key: const Key("repeat_password"),
                                  curFocusNode: _fnPasswordRepeat,
                                  textInputAction: TextInputAction.done,
                                  controller: _conPasswordRepeat,
                                  keyboardType: TextInputType.text,
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
                                  ),
                                  obscureText: context
                                          .read<RegisterCubit>()
                                          .isPasswordRepeatHide ??
                                      false,
                                  hintText: '••••••••••••',
                                  maxLine: 1,
                                  hint: 'Password',
                                  suffixIcon: IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () => context
                                        .read<RegisterCubit>()
                                        .showHidePasswordRepeat(),
                                    icon: Icon(
                                      (context
                                                  .read<RegisterCubit>()
                                                  .isPasswordRepeatHide ??
                                              false)
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  validator: (String? value) => value != null
                                      ? (value != _conPassword.text
                                          ? 'Password doesn\'t match'
                                          : null)
                                      : null,
                                  semantic: "repeat_password",
                                ),
                              ],
                            );
                          },
                        ),
                        SpacerV(value: Dimens.space24),
                        Button(
                          key: const Key("btn_register"),
                          title: 'Register',
                          onPressed: () {
                            /// Validate form first
                            if (_keyForm.currentState?.validate() ?? false) {
                              context.read<RegisterCubit>().register(
                                    RegisterParams(
                                      email: _conEmail.text,
                                      username: _conUsername.text,
                                      password: _conPassword.text,
                                    ),
                                  );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
