import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:youapp_test/dependencies_injection.dart';
import 'package:youapp_test/features/auth/pages/pages.dart';
import 'package:youapp_test/features/general/splashscreen/splash_screen_page.dart';
import 'package:youapp_test/features/main/cubit/main_cubit.dart';
import 'package:youapp_test/features/main/main_page.dart';
import 'package:youapp_test/features/profile/pages/cubit/post_profile_cubit.dart';
import 'package:youapp_test/features/profile/pages/cubit/profile_cubit.dart';
import 'package:youapp_test/features/profile/pages/cubit/profile_image_cubit.dart';
import 'package:youapp_test/features/profile/pages/dashboard_page.dart';
import 'package:youapp_test/utils/utils.dart';

enum Routes {
  root("/"),
  splashScreen("/splashscreen"),

  /// Home Page
  dashboard("/dashboard"),

  // Auth Page
  login("/auth/login"),
  register("/auth/register"),
  ;

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashScreen.path,
        name: Routes.splashScreen.name,
        builder: (_, __) => SplashScreenPage(),
      ),
      GoRoute(
        path: Routes.root.path,
        name: Routes.root.name,
        redirect: (_, __) => Routes.dashboard.path,
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: Routes.register.path,
        name: Routes.register.name,
        builder: (_, __) => BlocProvider(
          create: (_) => sl<RegisterCubit>(),
          child: const RegisterPage(),
        ),
      ),
      ShellRoute(
        builder: (_, __, child) => BlocProvider(
          create: (context) => sl<MainCubit>(),
          child: MainPage(child: child),
        ),
        routes: [
          GoRoute(
              path: Routes.dashboard.path,
              name: Routes.dashboard.name,
              builder: (_, __) => MultiBlocProvider(providers: [
                    BlocProvider(
                      create: (_) => sl<ProfileCubit>()..fetchProfile,
                      child: const DashboardPage(),
                    ),
                    BlocProvider(
                      create: (_) => sl<ProfileImageCubit>()..fetchProfileImage,
                    ),
                    BlocProvider(
                      create: (_) => sl<PostProfileCubit>()..postProfileImage,
                    ),
                  ], child: const DashboardPage())),
        ],
      ),
    ],
    initialLocation: Routes.splashScreen.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: GoRouterRefreshStream(context.read<AuthCubit>().stream),
    redirect: (_, GoRouterState state) {
      final bool isLoginPage = state.matchedLocation == Routes.login.path ||
          state.matchedLocation == Routes.register.path;

      ///  Check if not login
      ///  if current page is login page we don't need to direct user
      ///  but if not we must direct user to login page
      if (!((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
          false)) {
        return isLoginPage ? null : Routes.login.path;
      }

      /// Check if already login and in login page
      /// we should direct user to main page

      if (isLoginPage &&
          ((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
              false)) {
        return Routes.root.path;
      }

      /// No direct
      return null;
    },
  );
}
