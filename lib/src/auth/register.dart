import 'package:car_shoping/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';



class Register extends StatefulWidget {

  final Function toogleViews;
  Register({ this.toogleViews });
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  bool obscureText = true;      
  void chageIconState() {
    setState(() {
      obscureText = !obscureText;
    });
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
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.chevron_left),
                  Text('Iniciar sesión', textScaleFactor: 1.3,),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('Crea tu cuenta', textScaleFactor: 1.7),
                  SizedBox(height: 30.0,),
                  SvgPicture.asset('assets/car.svg', height: 120.0,),
                  SizedBox(height: 50.0,),
                  _nameAndLastName(),
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


 Widget _nameForm() {
   return TextFormField(
     keyboardType: TextInputType.emailAddress,
     decoration: InputDecoration(
      hintText: 'Nombres',
      prefixIcon: Icon(Feather.user)
     ),
   );
 }

 Widget _lastNameForm() {
   return TextFormField(
     keyboardType: TextInputType.emailAddress,
     decoration: InputDecoration(
      hintText: 'Apellidos',
      prefixIcon: Icon(Feather.user)
     ),
   );
 }

 Widget _emailForm() {
   return TextFormField(
     keyboardType: TextInputType.emailAddress,
     decoration: InputDecoration(
      hintText: 'Email',
      prefixIcon: Icon(Feather.mail)
     ),
   );
 }
Widget _phoneForm() {
  return TextFormField(
     obscureText: obscureText,
     keyboardType: TextInputType.emailAddress,
     decoration: InputDecoration(
      hintText: 'Teléfono',
      prefixIcon: Icon(Feather.phone)
      ),
    );
  }

 Widget _passwordForm() {
  return TextFormField(
    obscureText: obscureText,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: 'Contraseña',
      prefixIcon: obscureText ? _lockIcon() : _unlockIcon(),
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