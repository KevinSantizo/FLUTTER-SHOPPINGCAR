import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:url_launcher/url_launcher.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  initState() {
    super.initState();
  }

  void whatsAppOpen() async {
    await FlutterLaunch.launchWathsApp(
      phone: '50247997005', 
      message: 'Hola teto'
    );
  }

  void launchCaller() async {
    String url = "tel://+50247997005";
    if (await canLaunch.call(url)) {
      await launch(url);
    } else {
      throw 'No se pudo realizar la llamada';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              color: Colors.green,
              onPressed: (){
                whatsAppOpen();
              },
              child: Text('Whatsapp'),
            ),
             RaisedButton(
              color: Colors.green,
              onPressed: (){
                launchCaller();
              },
              child: Text('Llamar'),
            ),
          ],
        ),
      ),
    );
  }
}