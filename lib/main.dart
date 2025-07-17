import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsy/core/service_locator.dart';
import 'package:shopsy/domain/services/preference_service.dart';
import 'core/config/app_routes.dart';
import 'domain/services/navigation_service.dart';
import 'presentation/providers/cart_provider.dart';
import 'core/service_locator.dart' as di;

void main() {
  di.init();

  runApp(const ShopsyApp());
}

class ShopsyApp extends StatefulWidget {
  const ShopsyApp({super.key});

  @override
  State<ShopsyApp> createState() => _ShopsyAppState();
}

class _ShopsyAppState extends State<ShopsyApp> {
  void _goRouterConfig() {
    AppRouter.initialize();

    sl<NavigationService>().attachRouter(AppRouter.appGoRouter!);
  }

  @override
  void initState() {
    _goRouterConfig();
    sl<PreferenceService>().initializePreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.appGoRouter;

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: router?.routerDelegate,
        routeInformationProvider: router?.routeInformationProvider,
        routeInformationParser: router?.routeInformationParser,
        backButtonDispatcher: router?.backButtonDispatcher,
        title: 'Shopsy',
        theme: ThemeData(primarySwatch: Colors.blue),
        themeMode: ThemeMode.system,
        // darkTheme: CustomThemeData.darkTheme,
        // theme: CustomThemeData.lightTheme,
      )
    );
  }
}
