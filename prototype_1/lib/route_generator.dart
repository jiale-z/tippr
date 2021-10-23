import 'package:flutter/material.dart';
import 'package:frontend_temp/main.dart';
import 'package:frontend_temp/view/homePage.dart';
import 'package:frontend_temp/view/prefPage.dart';
import 'package:frontend_temp/view/linkPage.dart';
import 'package:frontend_temp/view/preferences_page.dart';
import 'package:frontend_temp/view/bioPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/pref':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => PreferencePage(
                // data: args,
                ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();

      //add a case for Links
      case '/link':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => LinkPage(
              data: args,
            ),
          );
        }
        return _errorRoute();
      //add a case for Server Bios
      case '/bio':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => BioPage(
              data: args,
            ),
          );
        }
        return _errorRoute();

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  //"back arrow" on home page from initial routing will take you to error page oof
  static Route<dynamic> _errorRoute() {
    //return MaterialPageRoute(builder: (_) => HomePage());

    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
