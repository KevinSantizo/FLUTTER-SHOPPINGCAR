import 'package:car_shoping/src/auth/login.dart';
import 'package:car_shoping/src/auth/register.dart';
import 'package:flutter/material.dart';


class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  bool toggle = true;
  void toggleViews() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (toggle) {
      return Login(toggleViews: toggleViews);
    } else {
      return Register(toogleViews: toggleViews);
    }
  }
}