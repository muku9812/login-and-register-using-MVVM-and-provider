import 'package:flutter/material.dart';
import 'package:mvvm/utilities/routes/routes_name.dart';
import 'package:mvvm/views/homeScreen.dart';
import 'package:mvvm/views/loginScreen.dart';
import 'package:mvvm/views/signUpView.dart';
import 'package:mvvm/views/splashView.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.register:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined."),
            ),
          );
        });
    }
  }
}
