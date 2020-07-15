import 'package:car_shoping/src/components/bottom_navigation_bar.dart';
import 'package:car_shoping/src/components/landing.dart';
import 'package:car_shoping/src/components/wrapper.dart';
import 'package:car_shoping/src/pages/home.dart';
import 'package:car_shoping/src/theme/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: Landing(),
      routes: {
        'home': (BuildContext context) => HomePage(),
        'bottom-navigation-bar': (BuildContext context) =>
            BottomNavigationBarComponent()
      },
    );
  }
}
