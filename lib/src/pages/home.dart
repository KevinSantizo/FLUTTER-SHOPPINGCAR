import 'package:car_shoping/src/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CarModel> _carModel = [

    CarModel('Hatchback', 2020, 'Toyota', 'https://www.toyota.com.gt/hubfs/1yh/c1.jpg'),
    CarModel('Suv',       2020, 'Toyota', 'https://www.toyota.com.gt/hubfs/marron-oscuro.jpg'),
    CarModel('Pickup',    2020, 'Toyota', 'https://www.toyota.com.gt/hubfs/hilux_nuevo_frente/colores/hilux-color-blanco.png'),
    CarModel('Comercial', 2020, 'Toyota', 'https://www.toyota.com.gt/hubfs/Auto06/hiace1.png'),
    CarModel('Híbrido',   2020, 'Toyota', 'https://i.toyota.com.gt/landing/c-hr-2020/img/galeria/ext5.jpg?c=25052020'),
    CarModel('Sedán',     2020, 'Toyota', 'https://www.toyota.com.gt/hubfs/Corolla/color1.jpg'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('Hola!', textScaleFactor: 1.6,),
                        SvgPicture.asset('assets/avatar.svg', height: 50.0,)
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  Container(margin: EdgeInsets.symmetric(horizontal: 20.0), child: Text('Encuentra tu auto ideal', textScaleFactor: 1.6,)),
                  SizedBox(height: 40.0,),
                  Material(
                    elevation: 10.0,
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      height: 250.0,
                      child: Swiper(
                        viewportFraction: 0.9,
                        itemCount: _carModel.length,
                        itemBuilder: (BuildContext context, int index){
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(_carModel[index].image, fit: BoxFit.cover, height: 200.0, width: double.infinity,)
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                  width: double.infinity,
                                  height: 200.0,
                                ),
                                Container(alignment: Alignment.center, child: Text(_carModel[index].name, textScaleFactor: 3.0,)),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}