import 'package:car_shoping/src/models/address_model.dart';
import 'package:car_shoping/src/theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';



class Register extends StatefulWidget {
  final Function toogleViews;
  Register({ this.toogleViews });
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  final _databaseReference = Firestore.instance;
  bool obscureText = true; 
  String dropdownValue;
  String dropdownValue2;     
  void chageIconState() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  List<Department> _departmentList = [

    Department( idDepartment:  1,   nameDepartment:  'Guatemala'      ),
    Department( idDepartment:  2,   nameDepartment:  'El Progreso'    ),
    Department( idDepartment:  3,   nameDepartment:  'Sacatepequez'   ),
    Department( idDepartment:  4,   nameDepartment:  'Chimaltenango'  ),
    Department( idDepartment:  5,   nameDepartment:  'Escuintla'      ),
    Department( idDepartment:  6,   nameDepartment:  'Santa Rosa'     ),
    Department( idDepartment:  7,   nameDepartment:  'Sololá'         ),
    Department( idDepartment:  8,   nameDepartment:  'Totonicapán'    ),
    Department( idDepartment:  9,   nameDepartment:  'Quetzaltenango' ),
    Department( idDepartment:  10,  nameDepartment:  'Suchitepequez'  ),
    Department( idDepartment:  11,  nameDepartment:  'Retalhuleu'     ),
    Department( idDepartment:  12,  nameDepartment:  'San Marcos'     ),
    Department( idDepartment:  13,  nameDepartment:  'Huehuetenango'  ),
    Department( idDepartment:  14,  nameDepartment:  'Quiché'         ),
    Department( idDepartment:  15,  nameDepartment:  'Baja Verapaz'   ),
    Department( idDepartment:  16,  nameDepartment:  'Alta Verapaz'   ),
    Department( idDepartment:  17,  nameDepartment:  'Petén'          ),
    Department( idDepartment:  18,  nameDepartment:  'Izabal'         ),
    Department( idDepartment:  19,  nameDepartment:  'Zacapa'         ),
    Department( idDepartment:  20,  nameDepartment:  'Chiquimula'     ),
    Department( idDepartment:  21,  nameDepartment:  'Jalapa'         ),
    Department( idDepartment:  22,  nameDepartment:  'Jutiapa'        ),

  ];

  List<Town> _townList = [

    Town( idTown: 1, nameTown: 'Mixco'                  ),
    Town( idTown: 1, nameTown: 'Villa Nueva'            ),
    Town( idTown: 1, nameTown: 'Santa Catarina Pinula'  ),
    Town( idTown: 1, nameTown: 'San José Pinula'        ),
    Town( idTown: 1, nameTown: 'Villa Canales'          ),
    Town( idTown: 1, nameTown: 'Fraijanes'              ),

    Town( idTown: 2, nameTown: 'Guastatoya'             ),
    Town( idTown: 2, nameTown: 'Barberena'              ),
    Town( idTown: 2, nameTown: 'San Marcos'             ),


  ];

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
                _municipality(),
                SizedBox(height: 30.0,),
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
      child: DropdownButtonFormField<String>(
        hint: Text('Departamento', textScaleFactor: 1.0),
        value: dropdownValue,
        icon: Icon(Feather.chevron_down),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.grey, fontSize: 16.0),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
            print(dropdownValue);
          });
        },
        items: _departmentList.map<DropdownMenuItem<String>>((value) {
           return DropdownMenuItem<String>(
            value: value.nameDepartment,
            child: Text(value.nameDepartment),
          ); 
        }).toList(),
      ),
    );
  }

  Widget _municipality(){
    return Container(
      child: DropdownButtonFormField<String>(
        hint: Text('Municipio', textScaleFactor: 1.0,),
        value: dropdownValue2,
        icon: Icon(Feather.chevron_down),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.grey, fontSize: 16.0),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue2 = newValue;
            print(dropdownValue2);
          });
        },
        items: _townList.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value:  value.nameTown,
            child: Text(value.nameTown),
          ); 
        }).toList(),
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