import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_test/features/auth/presentation/view_model/auth_cubit/cubit/auth_cubit.dart';
import 'package:project_test/features/auth/presentation/views/forget_password.dart';
import 'package:project_test/features/auth/presentation/views/login_View.dart';
import 'package:project_test/features/auth/presentation/views/register_View.dart';
import 'package:project_test/features/home/presentation/views/home_view.dart';
import 'package:project_test/features/home/presentation/widgets/nav_bar.dart';
import 'package:project_test/features/on_borading/presentation/views/logo_view.dart';
import 'package:project_test/features/on_borading/presentation/views/onboradingView.dart';

abstract class AppRouter {
  static const kHomeView = '/homeview';
  static const konBoradingView = '/onBoradingView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, State) => logoView(),
      ),
      GoRoute(
        path: "/onBoarding",
        builder: (context, State) => onBoardingView(),
      ),
      GoRoute(
        path: "/register",
        builder: (context, State) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const registerView(),
        ),
      ),
      GoRoute(
        path: "/login",
        builder: (context, State) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const loginnView(),
        ),
      ),
      GoRoute(
        path: "/forgetpassword",
        builder: (context, State) => BlocProvider(
          create: (context) => AuthCubit(),
          child: forgetPasswordView(),
        ),
      ),
      GoRoute(
        path: "/homeNavBar",
        builder: (context, State) =>  NavBar(),
      ),
      GoRoute(
        path: "/home",
        builder: (context, State) => const homeView(),
      ),
    ],
  );
}
