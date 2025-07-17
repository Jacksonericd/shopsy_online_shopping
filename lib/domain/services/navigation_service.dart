import 'package:go_router/go_router.dart';

abstract class NavigationService {
  void attachRouter(GoRouter router);

  void goToRoute(
      String routeName, {
        Object? arguments,
      });

  Future<void> navigateTo(
      String routeName, {
        Object? arguments,
      });

  Future<void> pushReplacementNamed(
      String routeName, {
        Object? arguments,
      });

  void pop();
}
