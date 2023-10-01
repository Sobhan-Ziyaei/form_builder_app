import 'package:flutter/material.dart';
import 'package:form_builder_app/ui/screens/form_content_screen.dart';
import 'package:form_builder_app/ui/screens/form_screen.dart';
import 'package:form_builder_app/ui/screens/home_screen.dart';
import 'package:form_builder_app/ui/screens/modify_screen.dart';
import 'package:form_builder_app/ui/screens/register_form_screen.dart';
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
      case RegisterFormScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => RegisterFormScreen(),
        );
      case FormScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => FormScreen(),
        );
      case FormContentScreen.screenId:
        var argument = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => FormContentScreen(selectForm: argument),
        );
      case ModifyScreen.screenId:
        var argument = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => ModifyScreen(selectForm: argument),
        );
      default:
        return null;
    }
  }
}
