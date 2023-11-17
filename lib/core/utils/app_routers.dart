import 'package:book_app/features/home/presentation/views/home_view.dart';
import 'package:book_app/features/splash/presention/views/splash_view.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';
abstract class AppRouters {
  static final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>const SplashView(),
    ),
     GoRoute(
      path: '/homeView',
      builder: (context, state) =>const HomeView(),
    ),
  ],
);
}