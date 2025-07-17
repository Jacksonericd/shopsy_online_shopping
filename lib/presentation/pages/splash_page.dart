import 'package:flutter/material.dart';
import 'package:shopsy/core/constants/route_constants.dart';
import 'package:shopsy/core/service_locator.dart';
import 'package:shopsy/domain/services/navigation_service.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  Widget get splashLogo => Image.asset('assets/images/shopsy.png');
  
  @override
  Widget build(BuildContext context) {
    navigateAfterDelay();

    return Scaffold(
      body: Center(child: splashLogo),
    );
  }

  void navigateAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () async {

      sl<NavigationService>().pushReplacementNamed(
        RouteConstants.productsView.name,
      );
    });
  }
}