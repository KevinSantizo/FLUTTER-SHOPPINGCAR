import 'dart:convert';

import 'package:car_shoping/src/models/address_model.dart';
import 'package:car_shoping/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';



class Register extends StatefulWidget {
  final Function toogleViews;
  Register({ this.toogleViews });
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  bool obscureText = true; 
  String dropdownValue;
  String dropdownValue2;     
  void chageIconState() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  List statesList = List();
  List provincesList = List();
  List tempList = List();
  String _state;
  String _province;

  Future<String> loadStatesProvincesFromFile() async {
    return await rootBundle.loadString('json/states.json');
  }

  Future<String> _populateDropdown() async {
    String getPlaces = await loadStatesProvincesFromFile();
    final jsonResponse = json.decode(getPlaces);

    Localization places = new Localization.fromJson(jsonResponse);

    setState(() {
      statesList = places.states;
      provincesList = places.provinces;
    });
  }

  @override
  void initState() {
    super.initState();
    this._populateDropdown();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
        child: BottomAppBar(
          elevation: 3.0,
          child: InkWell(
            onTap: (){
              widget.toogleViews();
            },
            child: Container(
              height: 75.0,
              alignment: Alignment.center,
              width: double.infinity,
              child: Text('Iniciar sesión', textScaleFactor: 1.3, style: TextStyle(color: myTheme.accentColor, decoration: TextDecoration.underline),),
            ),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Crea tu cuenta', textScaleFactor: 1.7),
                // SizedBox(height: 30.0,),
                // SvgPicture.asset('assets/car.svg', height: 120.0,),
                SizedBox(height: 50.0,),
                _nameAndLastName(),
                SizedBox(height: 30.0,),
                _department(),
                SizedBox(height: 30.0,),
                // _municipality(),
                _emailForm(),
                SizedBox(height: 30.0,),
                _phoneForm(),
                SizedBox(height: 30.0,),
                _passwordForm(),
                SizedBox(height: 50.0,),
                _buttonSubmit()
              ],
            ),
          ),
        ),
      )
    );
  }


  Widget _nameAndLastName() {
   return Container(
     child: Row(
       children: <Widget>[
         Expanded(child: _nameForm()),
         VerticalDivider(),
         Expanded(child: _lastNameForm()),
       ],
     ),
   );
 }
  
  Widget _department(){
    return Container(
      child: Column(
        children: <Widget>[
          new DropdownButton(
            isExpanded: true,
            icon: const Icon(Feather.chevron_down),
            items: statesList.map((item) {
              return new DropdownMenuItem(
                child: new Text(item.name),
                value: item.id.toString(),
              );
            }).toList(),
            onChanged: (newVal) {
              setState(() {
                _province = null;
                _state = newVal;
                tempList = provincesList
                    .where((x) =>
                        x.stateId.toString() == (_state.toString()))
                    .toList();
              });
            },        
            value: _state,
            hint: Text('Departamento'),
          ),
          SizedBox(height: 30.0,),
          new DropdownButton(
            isExpanded: true,
            icon: const Icon(Feather.chevron_down),
            items: tempList.map((item) {
              return new DropdownMenuItem(
                child: new Text(item.name),
                value: item.id.toString(),
              );
            }).toList(),
            onChanged: (newVal) {
              setState(() {
                _province = newVal;
              });
            },
            value: _province,
            hint: Text('Municipio'),
          ),
        ],
      ),
    );
  }

  Widget _nameForm() {
   return TextFormField(
     keyboardType: TextInputType.emailAddress,
     decoration: InputDecoration(
      hintText: 'Nombres',
      // prefixIcon: Icon(Feather.user)
     ),
   );
 }

  Widget _lastNameForm() {
   return TextFormField(
     keyboardType: TextInputType.emailAddress,
     decoration: InputDecoration(
      hintText: 'Apellidos',
      // prefixIcon: Icon(Feather.user)
     ),
   );
 }

  Widget _emailForm() {
   return TextFormField(
     keyboardType: TextInputType.emailAddress,
     decoration: InputDecoration(
      hintText: 'Email',
      // prefixIcon: Icon(Feather.mail)
     ),
   );
 }
  Widget _phoneForm() {
  return TextFormField(
     obscureText: obscureText,
     keyboardType: TextInputType.emailAddress,
     decoration: InputDecoration(
      hintText: 'Teléfono',
      // prefixIcon: Icon(Feather.phone)
      ),
    );
  }

  Widget _passwordForm() {
  return TextFormField(
    obscureText: obscureText,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: 'Contraseña',
      // prefixIcon: obscureText ? _lockIcon() : _unlockIcon(),
      suffixIcon: IconButton(
        icon: obscureText ? _visibilityOn() : _visibilityOff(),
        onPressed: chageIconState,
        )
      ),
    );
  }

  Widget _buttonSubmit() {
    return Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        padding: EdgeInsets.all(15.0),
        color: myTheme.accentColor,
        onPressed: (){},
        child: Text('Crear cuenta', textScaleFactor: 1.3,),
      ),
    );
  }
        
  Widget _lockIcon()       =>   Icon(Feather.lock);
  Widget _unlockIcon()     =>   Icon(Feather.unlock);
  Widget _visibilityOn()   =>   Icon(Feather.eye);
  Widget _visibilityOff()  =>  Icon(Feather.eye_off);

}