import 'package:flutter/material.dart';
import 'Screens/intro_carousel_screen.dart';
import 'Screens/list_view_screen.dart';
import 'Screens/welcome_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/signup_screen.dart';
import 'Screens/corona_cases_screen.dart';
import 'Screens/map_view_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/about_us_screen.dart';

void main() {
  runApp(CSquare());
}

class CSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: AboutUsScreen(),
    // );

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Product Regular'),
      initialRoute: IntroScreen.id,
      routes: {
        IntroScreen.id: (context) => IntroScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        CoronaCases.id: (context) => CoronaCases(),
        ListViewScreen.id: (context) => ListViewScreen(),
        MapViewScreen.id: (context) => MapViewScreen(),
        AboutUsScreen.id: (context) => AboutUsScreen(),
      },
    );
  }
}
