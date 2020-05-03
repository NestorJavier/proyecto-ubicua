import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Perfil.dart';

class Comentarios extends StatefulWidget {
  @override
  _ComentariosState createState() => _ComentariosState();
}

class _ComentariosState extends State<Comentarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9FC5E8),
        title: Text("Comentarios"),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            child: Text("Contacto", style: TextStyle(fontSize: 50)),
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
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          new Container(
            child: Text("Comentarios", style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 5),
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
                      color: Colors.amber,textColor: Colors.white,elevation: 0.2,child: new Text("Guardar"),),
                  ),Expanded(
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
          )
        ],
      ),
    );
  }
}
