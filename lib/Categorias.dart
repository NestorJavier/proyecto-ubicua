import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Categorias extends StatelessWidget{
  final databaseReference = Firestore.instance;

  Widget barra() {
    return Row(
      children: <Widget>[
        Container(
          child: Text('Categorias'),
        ),
      ],
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: GestureDetector(
              child: Text('Limpiar', style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,
                  fontSize: 16, fontWeight: FontWeight.bold)),
              onTap: () => Navigator.pop(context, ''),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: getCategories(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting)
                  return Text("Conectando...");
                else{
                  return GridView.builder(
                      itemCount: snapshot.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                          crossAxisSpacing: 10.0, mainAxisSpacing: 30.0),
                      itemBuilder: (BuildContext cont, int index){
                        return  Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              child:Text( snapshot.data[index].data["nombre"] , style: TextStyle(fontWeight: FontWeight.bold)),
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
                                      child: Image.network(snapshot.data[index].data["imageURL"]),
                                    ),
                                  ],
                                ),
                                color: Color(0xFFF6B26B),
                                onPressed: () {
                                  Navigator.pop(cont, snapshot.data[index].data["nombre"]);
                                },
                              ),
                            ),
                          ],
                        );
                      }
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Future getCategories() async{
    QuerySnapshot q= await databaseReference.collection("categorias").getDocuments();
    return q.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff9FC5E8),
          title: barra(),
          leading: Text(""),
        ),
        body: body(context)
    );
  }
}