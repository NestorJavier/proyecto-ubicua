import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ModPerfil.dart';
import 'TermCond.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Color(0xFFF6B26B),
                      child: ClipOval(
                        child: new SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: Image.network(
                            "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Michelle López González',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0)),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('correo@gmail.com',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 18.0)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              height: 20,
              color: Colors.grey[200],
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text("Ayuda", style: TextStyle(color:  Colors.black38, fontSize: 20)),
            ),
            SizedBox(height: 8.0),
            Divider(color: Colors.black45),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: GestureDetector(
                onTap: () { print("info sobre la app"); },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.info, size: 30, color: Color(0xFFF6B26B)),
                    SizedBox(width: 10),
                    Text("Sobre nosotros", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TermCond()));
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.description, size: 30, color: Color(0xFFF6B26B)),
                    SizedBox(width: 10),
                    Text("Términos y condiciones", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ModPerf()));
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.edit, size: 30, color: Color(0xFFF6B26B)),
                    SizedBox(width: 10),
                    Text("Editar perfil", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child:  Row(
                children: <Widget>[
                  Icon(Icons.supervised_user_circle, size: 30, color: Color(0xFFF6B26B)),
                  SizedBox(width: 10),
                  Text("Contáctanos", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),)
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 90.0),
              child:  Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset('img/facebook.png', width: 28),
                  ),
                  SizedBox(width: 25),
                  Image.asset('img/instagram.png', width: 28),
                  SizedBox(width: 25),
                  Image.asset('img/twitter.png', width: 28),
                ],
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
      );
  }
}
/*
Divider(color: Colors.black45),
GestureDetector(
              onTap: () { print('cerrar sesión'); },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Cerrar Sesión',
                    style: TextStyle(color: Color(0xFFF6B26B),fontWeight: FontWeight.w500, fontSize: 20)),
                ],
              )
            )
* */