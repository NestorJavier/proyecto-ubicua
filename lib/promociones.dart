import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromocionesScreen extends StatefulWidget {
  PromocionesScreen({Key key}) : super(key: key);

  @override
  _PromocionesScreenState createState() => _PromocionesScreenState();
}

class _PromocionesScreenState extends State<PromocionesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            color: Color(0xFFF6B26B),
            child: Text(
              "¡Promociones del mes de MAYO!",
              style: TextStyle(
                  fontFamily: 'RobotoMono',
                  color: Colors.white,
                  fontSize: 20.0),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            child: Image.asset(
              'img/promo1.jpeg',
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            color: Color(0xFFF6B26B),
            child: Text(
              "¡Promociones disponibles del 5 de junio al 20 de junio!",
              style: TextStyle(
                  fontFamily: 'RobotoMono',
                  color: Colors.white,
                  fontSize: 20.0),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            child: Image.asset(
              'img/promo3.jpeg',
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            color: Color(0xFFF6B26B),
            child: Text(
              "¡Promociones disponibles del 20 de junio al 30 de junio!",
              style: TextStyle(
                  fontFamily: 'RobotoMono',
                  color: Colors.white,
                  fontSize: 20.0),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            child: Image.asset(
              'img/promo2.jpeg',
            ),
          ),
        ],
      ),
    );
  }
}
