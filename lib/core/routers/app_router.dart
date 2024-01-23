import 'package:go_router/go_router.dart';
import 'package:project_test/features/on_borading/presentation/views/onboradingView.dart';

abstract class AppRouter {
  static const kHomeView = '/homeview';
  static const konBoradingView = '/onBoradingView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, State) => const onBoradingView(),
      ),
    ],
  );
}

  // GoRoute(
  //   path: "/Auth",
  //   builder: (context, State) => Auth(),
  // ),
  // GoRoute(
  //   path: "/registepage",
  //   builder: (context, State) => registepage(),
  // ),
  // GoRoute(
  //   path: "/LoginPage",
  //   builder: (context, State) => LoginPage(),
  // ),
  // GoRoute(
  //   path: "/homeScreen",
  //   builder: (context, State) => homeScreen(),
  // ),
