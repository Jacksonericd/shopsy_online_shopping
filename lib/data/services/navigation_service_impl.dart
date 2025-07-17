import 'package:go_router/go_router.dart';
import 'package:shopsy/domain/services/navigation_service.dart';

class NavigationServiceImpl extends NavigationService {
  NavigationServiceImpl({GoRouter? router}) {
    if (router != null) {
      _navigationRouter = router;
    }
  }

  late GoRouter _navigationRouter;

  @override
  void attachRouter(GoRouter router) {
    _navigationRouter = router;
  }

  @override
  void goToRoute(
      String routeName, {
        Object? arguments,
      }) {
    _navigationRouter.go(
      routeName,
      extra: arguments,
    );
  }

  @override
  Future<void> navigateTo(
      String routeName, {
        Object? arguments,
      }) async {
    await _navigationRouter.push(
      routeName,
      extra: arguments,
    );
  }

  @override
  Future<void> pushReplacementNamed(
      String routeName, {
        Object? arguments,
      }) async {
    await _navigationRouter.pushReplacementNamed(
      routeName,
      extra: arguments,
    );
  }

  @override
  void pop() {
    if (_navigationRouter.canPop()) {
      _navigationRouter.pop();
    }
  }
}
