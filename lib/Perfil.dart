import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DBHelper.dart';
import 'ModPerfil.dart';
import 'TermCond.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  var loaded = 0;
  var email = TextEditingController();
  var nombre = TextEditingController();
  var dbHelper = DBHelper();
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    dbHelper.getPersonUID().then((res) {
      loadProfile(id: res);
    });

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
                          child: Text(nombre.text,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0)),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              email.text,
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ModPerf())).then(
                          (value) {
                        dbHelper.getPersonUID().then((res) {
                          loaded = 0;
                          loadProfile(id: res);
                        });
                      }
                  );
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

  void loadProfile({String id}) {
    databaseReference.collection('Perfiles').where('IdUsuario', isEqualTo: id)
        .snapshots().listen(
            (data) {
          if (loaded == 0) {
            setState(() {
              nombre.text = '${data.documents[0]['Nombre']} ${data
                  .documents[0]['Apellidos']}';
              email.text = '${data.documents[0]['Email']}';
              loaded = 1;
            });
          }
        }
    );
  }
}