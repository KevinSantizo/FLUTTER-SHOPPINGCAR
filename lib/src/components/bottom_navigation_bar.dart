import 'package:car_shoping/src/pages/farm.dart';
import 'package:car_shoping/src/pages/home.dart';
import 'package:car_shoping/src/pages/profile.dart';
import 'package:car_shoping/src/pages/search.dart';
import 'package:car_shoping/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  @override
  _BottomNavigationBarComponentState createState() => _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState extends State<BottomNavigationBarComponent> {

  int _currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    Farm(),
    Search(),
    Profile()
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0XFF353535),
        iconSize: 30.0,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: myTheme.accentColor,
        elevation: 10.0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Feather.home),
            title: Text('Inicio')
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.flag_checkered),
            title: Text('Predios')
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.search),
            title: Text('Buscar')
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.user),
            title: Text('Perfil')
          ),
        ],
      ),
    );
  }
}