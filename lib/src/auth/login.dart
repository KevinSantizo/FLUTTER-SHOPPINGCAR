import 'package:car_shoping/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';



class Login extends StatefulWidget {

  final Function toggleViews;
  Login({ this.toggleViews });
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
              widget.toggleViews();
            },
            child: Container(
              alignment: Alignment.center,
              height: 75.0,
              width: double.infinity,
              child: Text('Crear una cuenta', textScaleFactor: 1.3, style: TextStyle(color: myTheme.accentColor, decoration: TextDecoration.underline),),
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
                Text('Inicia sesión', textScaleFactor: 1.7),
                SizedBox(height: 40.0,),
                SvgPicture.asset('assets/car.svg', height: 120.0,),
                SizedBox(height: 60.0,),
                _emailForm(),
                SizedBox(height: 40.0,),
                _passwordForm(),
                SizedBox(height: 60.0,),
                _buttonSubmit()
              ],
            ),
          ),
        ),
      )
    );
  }

 Widget _emailForm() {
   return TextFormField(
     keyboardType: TextInputType.emailAddress,
     decoration: InputDecoration(
      hintText: 'Ingrese su email',
      prefixIcon: Icon(Feather.mail)
     ),
   );
 }

 Widget _passwordForm() {
  return TextFormField(
    obscureText: obscureText,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: 'Ingrese su contraseña',
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
        onPressed: (){
          Navigator.pushReplacementNamed(context, 'bottom-navigation-bar');
        },
        child: Text('Iniciar sesión', textScaleFactor: 1.3,),
    ),
    );
  }
        
 Widget _lockIcon()       =>   Icon(Feather.lock);
 Widget _unlockIcon()     =>   Icon(Feather.unlock);
 Widget _visibilityOn()   =>   Icon(Feather.eye);
 Widget _visibilityOff()  =>  Icon(Feather.eye_off);
}