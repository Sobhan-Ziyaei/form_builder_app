import 'package:flutter/material.dart';
import 'package:form_builder_app/ui/screens/home_screen.dart';
import 'package:form_builder_app/ui/screens/splash_screen.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case HomeScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );

      default:
        return null;
    }
  }
}
