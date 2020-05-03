import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Comentarios.dart';
import 'package:flutter_app/ModPerfil.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            child: Text('Nombre', style: TextStyle(fontSize: 20, color: Colors.black),),
          ),
          new Container(
            child: ListTile(
              title: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                      child: Text('Sofia', style: TextStyle(fontSize: 40, color: Colors.black),),
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
                ],
              ),
            ),
          ),
          new Container(
            child: Text('Perfil', style: TextStyle(fontSize: 20, color: Colors.black),),
            color: Colors.white12,
          ),
          new Container(
            height: 80.0,
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Color(0xff9FC5E8),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                )
            ),
          ),
          new Container(
            height: 20.0,
            color: Colors.white12,
          ),
          new Container(
            child: Text('Detalles', style: TextStyle(fontSize: 20, color: Colors.black),),
            color: Colors.white12,
          ),
          new Container(
            height: 80.0,
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Color(0xff9FC5E8),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                )
            ),
          ),
          new Container(
            height: 30.0,
            color: Colors.white12,
          ),
          new Container(
            child: ListTile(
              title: new Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => new Comentarios()));},
                      textColor: Colors.black,elevation: 0.2,child: new Text("Comentarios"),),
                  ),
                  Expanded(
                    child: new Container(
                      height: 20.0,
                      color: Colors.white12,
                    ),
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
          ),
          new Container(
            height: 20.0,
            color: Colors.white12,
          ),
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
                    child: MaterialButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => new ModPerf()));},
                      color: Color(0xff9FC5E8),textColor: Colors.white,elevation: 0.2,child: new Text("Modificar"),),
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
        ],
      ),
      );
  }
}