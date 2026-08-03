import 'package:app/config/routes.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/login.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.login,
  routes: [
    GoRoute(path: Routes.login, builder: (context, state) => LoginPage()),
    GoRoute(path: Routes.home, builder: (context, state) => const HomePage()),
  ],
);
