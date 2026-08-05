import 'package:app/config/routes.dart';
import 'package:app/pages/booking_form.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/login.dart';
import 'package:app/pages/pet_form.dart';
import 'package:app/pages/pet_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.login,
  routes: [
    GoRoute(path: Routes.login, builder: (context, state) => LoginPage()),
    GoRoute(path: Routes.home, builder: (context, state) => const HomePage()),
    GoRoute(
      path: Routes.addPet,
      builder: (context, state) => const PetFormPage(),
    ),
    GoRoute(
      path: Routes.editPet,
      builder: (context, state) =>
          PetFormPage(id: state.pathParameters['id'] as int),
    ),
    GoRoute(
      path: Routes.viewPet,
      builder: (context, state) =>
          PetViewPage(id: state.pathParameters['id'] as int),
    ),
    GoRoute(
      path: Routes.addBooking,
      builder: (context, state) => const BookingFormPage(),
    ),
    GoRoute(
      path: Routes.editBooking,
      builder: (context, state) =>
          BookingFormPage(id: state.pathParameters['id'] as int),
    ),
    GoRoute(
      path: Routes.viewBooking,
      builder: (context, state) =>
          BookingFormPage(id: state.pathParameters['id'] as int),
    ),
  ],
);
