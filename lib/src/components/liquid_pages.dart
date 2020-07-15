import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final styleText = TextStyle(color: Colors.black, fontSize: 25.0);

final liquidPages = [
  Container(
      width: double.infinity,
      color: Color(0xFF80ffdb),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Encuentra tu auto \nen cualquier departamento',
              style: styleText,
            ),
            SvgPicture.asset(
              'assets/car1.svg',
              height: 200.0,
            ),
          ],
        ),
      )),
  Container(
      color: Color(0xFFdeaaff),
      child: Center(
        child: Text(
          'Hello',
          style: styleText,
        ),
      )),
  Container(
      color: Color(0xFFff6b6b),
      child: Center(
        child: Text(
          'Hello',
          style: styleText,
        ),
      )),
];
