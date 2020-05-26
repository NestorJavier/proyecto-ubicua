import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import 'DBHelper.dart';

class ModPerf extends StatefulWidget {
  @override
  _ModPerfState createState() => _ModPerfState();
}

class _ModPerfState extends State<ModPerf> {
  var email = TextEditingController();
  var nombre = TextEditingController();
  var apellidos = TextEditingController();
  var celular = TextEditingController();
  var dbHelper = DBHelper();
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    dbHelper.getPersonUID().then((res) {
      loadProfile(id: res);
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9FC5E8),
        title: Text("Modificar Perfil"),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(height: 20.0),
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
                          child: Text('Nombre',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18.0)),
                        ),
                        Container(
                          padding: EdgeInsets.all(0.0),
                          margin: EdgeInsets.all(5.0),
                          width: 200,
                          height: 30,
                          child: TextField(
                            controller: nombre,
                            enabled: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
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
                          child: Text('Apellidos',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18.0)),
                        ),
                        Container(
                          padding: EdgeInsets.all(0.0),
                          margin: EdgeInsets.all(5.0),
                          width: 200,
                          height: 30,
                          child: TextField(
                            controller: apellidos,
                            enabled: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
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
                          child: Text('Correo electrónico',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18.0)),
                        ),
                        Container(
                          padding: EdgeInsets.all(0.0),
                          margin: EdgeInsets.all(5.0),
                          width: 250,
                          height: 30,
                          child: TextField(
                            controller: email,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
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
                          child: Text('Celular',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18.0)),
                        ),
                        Container(
                          padding: EdgeInsets.all(0.0),
                          margin: EdgeInsets.all(5.0),
                          width: 200,
                          height: 30,
                          child: TextField(
                            controller: celular,
                            enabled: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
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
                          child: Text('Métodos de pago',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18.0)),
                        ),
                        RadioButtonGroup(
                          // margin:  EdgeInsets.only(left: 12.0),
                          labels: <String>[
                            "Efectivo",
                            "PayPal"
                          ],
                          picked: "Efectivo",
                          activeColor: Color(0xff9FC5E8),
                          itemBuilder: (Radio rb, Text txt, int i){
                            return Row(
                              children: <Widget>[
                                rb, txt,
                              ],
                            );
                          },
                        ),
                        MaterialButton(
                            onPressed: () {
                              dbHelper.getPersonUID().then((res) {
                                saveProfile(id: res);
                              });
                              Navigator.pop(context);
                            },
                            color: Color(0xFFF6B26B),
                            textColor: Colors.white,
                            elevation: 0.2,
                            child: new Text("Guardar")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void loadProfile({String id}) {
    databaseReference.collection('Perfiles').where('IdUsuario', isEqualTo: id)
        .snapshots().listen(
            (data) {
          nombre.text = '${data.documents[0]['Nombre']}';
          apellidos.text = '${data.documents[0]['Apellidos']}';
          email.text = '${data.documents[0]['Email']}';
          celular.text = '${data.documents[0]['Celular']}';
        }
    );
  }

  void saveProfile({String id}) async
  {
    print("ID: " + id);
    String key;

    databaseReference.collection('Perfiles').where('IdUsuario', isEqualTo: id)
        .snapshots().listen(
            (data) {
          key = data.documents[0].documentID.toString();
          databaseReference.collection('Perfiles').document(key).updateData(
              {
                'Nombre': nombre.text,
                'Apellidos': apellidos.text,
                'Celular': celular.text
              }
          );
        }
    );
  }
}


/*
new ListView(
        children: <Widget>[
            new Container(
              child: ListTile(
                title: new Row(
                  children: <Widget>[
                  Expanded(
                    child: new Container(
                      color: Colors.white12,
                    ),
                  ),
                  Expanded(
                    child: new Container(
                      child: new UserAccountsDrawerHeader(
                        currentAccountPicture: GestureDetector(
                          child: new CircleAvatar(backgroundColor: Colors.black,child: IconButton(icon: Icon(Icons.person_add, color: Colors.white,size: 30,), onPressed: null)
                        ),
                      ),
                        decoration: new BoxDecoration(
                        color: Colors.white12,
                        ),
                      ),
                    )
                  ),
                    Expanded(
                      child: new Container(
                        color: Colors.white12,
                      ),
                    ),
                ],
              ),
            ),
            ),
          SizedBox(height: 10),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("userName", style: TextStyle(fontSize: 18)),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 160,
                height: 30,
                decoration: BoxDecoration(
                    color: Color(0xff9FC5E8),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    )
                ),
                child: TextField(
                  decoration: InputDecoration(
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Nombre", style: TextStyle(fontSize: 18)),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 160,
                height: 30,
                decoration: BoxDecoration(
                    color: Color(0xff9FC5E8),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    )
                ),
                child: TextField(
                  decoration: InputDecoration(
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Apellidos", style: TextStyle(fontSize: 18)),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 160,
                height: 30,
                decoration: BoxDecoration(
                    color: Color(0xff9FC5E8),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    )
                ),
                child: TextField(
                  decoration: InputDecoration(
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Dirección", style: TextStyle(fontSize: 18)),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 160,
                height: 30,
                decoration: BoxDecoration(
                    color: Color(0xff9FC5E8),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    )
                ),
                child: TextField(
                  decoration: InputDecoration(
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Método de Pago", style: TextStyle(fontSize: 18)),
            ],
          ),
          SizedBox(height: 5),
          new Container(
            child: ListTile(
              title: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                      color: Colors.white12,
                    ),
                  ),
                  Expanded(
                    child: new Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Checkbox(value: false, onChanged: (bool) {}),
                        ),
                        Text("Efectivo", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Container(
                      color: Colors.white12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Container(
            child: ListTile(
              title: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                      color: Colors.white12,
                    ),
                  ),
                  Expanded(
                    child: new Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Checkbox(value: false, onChanged: (bool) {}),
                        ),
                        Text("Tarj. Crédito", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Container(
                      color: Colors.white12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Número de Tarjeta", style: TextStyle(fontSize: 18)),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 160,
                height: 30,
                decoration: BoxDecoration(
                    color: Color(0xff9FC5E8),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    )
                ),
                child: TextField(
                  decoration: InputDecoration(
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          new Container(
            child: ListTile(
              title: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                      height: 20.0,
                      color: Colors.white12,
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => new Perfil()));},
                      color: Colors.amber,textColor: Colors.white,elevation: 0.2,child: new Text("Modificar"),),
                  ),
                  Expanded(
                    child: new Container(
                      height: 20.0,
                      color: Colors.white12,
                    ),
                  )
                ],
              ),
            ),
          )
        ]
      )
* */
