import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Perfil.dart';

class ModPerf extends StatefulWidget {
  @override
  _ModPerfState createState() => _ModPerfState();
}

class _ModPerfState extends State<ModPerf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9FC5E8),
        title: Text("Modificar Perfil"),
      ),
      body: new ListView(
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
      ),
    );
  }
}
