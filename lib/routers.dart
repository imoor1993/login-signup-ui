import 'package:amazon_clone_app/features/auth/screens/login_screen_1.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case loginscreen1.routeName:
      return MaterialPageRoute(
          builder: (context) {
            return loginscreen1();
          },
          settings: routeSettings);
    default:
      return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(child: Text('Screen doesnt exists')),
            );
          },
          settings: routeSettings);
  }
}
