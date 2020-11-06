import 'package:flutter/material.dart';
import 'package:weather_app/constants/routing_contants.dart';
import 'package:weather_app/ui/authentication/login_view.dart';
import 'package:weather_app/ui/authentication/sign_up_view.dart';
import 'package:weather_app/ui/home/home_view.dart';

import 'ui/undefinedRoute.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginViewRoute:
        return MaterialPageRoute(builder: (context) => LoginView());
        break;
      case SignUpViewRoute:
        return MaterialPageRoute(builder: (context) => SignUpView());
        break;
      case HomeViewRoute:
        return MaterialPageRoute(builder: (context) => HomeView());
        break;
      default:
        return MaterialPageRoute(
            builder: (context) => UndefinedRoute(name: settings.name));
    }
  }
}
