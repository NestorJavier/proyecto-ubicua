import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Perfil.dart';

class Categorias extends StatelessWidget{
  Widget barra() {
    return Row(
      children: <Widget>[
        Container(
          child: Text('Categorias'),
        ),
      ],
    );
  }

  Widget body()
  {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child:Text('Dama', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          ButtonTheme(
                            minWidth: 160.0,
                            height: 160.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Color(0xFFF6B26B))
                            ),
                            child: FlatButton(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 120,
                                    height: 120,
                                    child:Image.asset('img/mujer.png'),
                                  ),
                                ],
                              ),
                              color: Color(0xFFF6B26B),
                              onPressed: () { },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child:Text('Calzado', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          ButtonTheme(
                            minWidth: 160.0,
                            height: 160.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Color(0xFFF6B26B))
                            ),
                            child: FlatButton(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 120,
                                    height: 120,
                                    child:Image.asset('img/calzado.png'),
                                  ),
                                ],
                              ),
                              color: Color(0xFFF6B26B),
                              onPressed: () { },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child:Text('Ropa', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          ButtonTheme(
                            minWidth: 160.0,
                            height: 160.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Color(0xFFF6B26B))
                            ),
                            child: FlatButton(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 120,
                                    height: 120,
                                    child:Image.asset('img/ropa.png'),
                                  ),
                                ],
                              ),
                              color: Color(0xFFF6B26B),
                              onPressed: () { },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child:Text('Caballero', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Column(
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: 160.0,
                            height: 160.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Color(0xFFF6B26B))
                            ),
                            child: FlatButton(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 120,
                                    height: 120,
                                    child:Image.asset('img/hombre.png'),
                                  ),
                                ],
                              ),
                              color: Color(0xFFF6B26B),
                              onPressed: () { },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child:Text('Niños', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          ButtonTheme(
                            minWidth: 160.0,
                            height: 160.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Color(0xFFF6B26B))
                            ),
                            child: FlatButton(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 120,
                                    height: 120,
                                    child:Image.asset('img/kids.png'),
                                  ),
                                ],
                              ),
                              color: Color(0xFFF6B26B),
                              onPressed: () { },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child:Text('Promociones', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          ButtonTheme(
                            minWidth: 160.0,
                            height: 160.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Color(0xFFF6B26B))
                            ),
                            child: FlatButton(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 120,
                                    height: 120,
                                    child:Image.asset('img/promos.png'),
                                  ),
                                ],
                              ),
                              color: Color(0xFFF6B26B),
                              onPressed: () { },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget BodyFinal()
  {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Caballero', style: TextStyle(fontWeight: FontWeight.bold)),
                    ButtonTheme(
                      minWidth: 160.0,
                      height: 160.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color(0xFFF6B26B))
                      ),
                      child: FlatButton(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 120,
                              height: 120,
                              child:Image.asset('img/hombre.png'),
                            ),
                          ],
                        ),
                        color: Color(0xFFF6B26B),
                        onPressed: () { },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Caballero', style: TextStyle(fontWeight: FontWeight.bold)),
                    ButtonTheme(
                      minWidth: 160.0,
                      height: 160.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color(0xFFF6B26B))
                      ),
                      child: FlatButton(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 120,
                              height: 120,
                              child:Image.asset('img/hombre.png'),
                            ),
                          ],
                        ),
                        color: Color(0xFFF6B26B),
                        onPressed: () { },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9FC5E8),
        title: barra(),
      ),
      body: Container(
        decoration: BoxDecoration(color:Colors.white),
        child: ListView(
          children: <Widget>[
                body(),
          ],
        ),
      ),
    );
  }
}