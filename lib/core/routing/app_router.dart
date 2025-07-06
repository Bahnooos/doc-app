import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/features/login/login_screen.dart';
import 'package:doctor_app/features/onbording/onbording_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String initialRoute = '/';

   Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments ;
    switch (settings.name) {
      case Routes.onbordingScreen:
        return MaterialPageRoute(builder: (_) => const OnbordingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) =>  Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}
