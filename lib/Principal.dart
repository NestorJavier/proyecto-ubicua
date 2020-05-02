import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrincipalScreen extends StatelessWidget{
  TextStyle getTextStyle() {
    return new TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0, color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    var productList = [
      {
        "name": "Camisa",
        "picture": "img/Camisa.png",
        "description": "Ut enim ad minim veniam, quis nostrud exercitation",
      },
      {
        "name": "falda",
        "picture": "img/falda.jpg",
        "description": "Ut enim ad minim veniam, quis nostrud exercitation",
      },
      {
        "name": "Pantalon",
        "picture": "img/Pantalon.png",
        "description": "Ut enim ad minim veniam, quis nostrud exercitation",
      },
      {
        "name": "Playera",
        "picture": "img/playera.jpg",
        "description": "Ut enim ad minim veniam, quis nostrud exercitation",
      },
      {
        "name": "Playera polo",
        "picture": "img/polo.jpg",
        "description": "Ut enim ad minim veniam, quis nostrud exercitation",
      },
      {
        "name": "Sudadera",
        "picture": "img/sudadera.jpeg",
        "description": "Ut enim ad minim veniam, quis nostrud exercitation",
      },
    ];

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 100.0,
                  height: 30.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0xFFF6B26B))
                  ),
                  child: FlatButton(
                    child: Text('Categoría', style: getTextStyle()),
                    color: Color(0xFFF6B26B),
                    onPressed: () { },
                  ),
                ),
                ButtonTheme(
                  minWidth: 100.0,
                  height: 30.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: Color(0xFFF6B26B))
                  ),
                  child: FlatButton(
                    child: Text('Filtro',style: getTextStyle()),
                    color: Color(0xFFF6B26B),
                    onPressed: () { },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 610,
            padding: EdgeInsets.all(10.0),
            child: GridView.builder(
              itemCount: productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    crossAxisSpacing: 10.0, mainAxisSpacing: 20.0),
              itemBuilder: (BuildContext context, int index){
                return SingleProduct(
                  productList[index]['name'],
                  productList[index]['picture'],
                  productList[index]['description']
                );
              }
            )
          )
        ],
      ),
    );
  }
}

class SingleProduct extends StatelessWidget{
  final name;
  final picture;
  final description;

  SingleProduct(this.name, this.picture, this.description);

  TextStyle getTextStyle() {
    return new TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0, color: Colors.black);
  }
  TextStyle title(){
    return new TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: Colors.black);
  }
  TextStyle descrip(){
    return new TextStyle(fontWeight: FontWeight.w300, fontSize: 12.0, color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFF6B26B)),
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Image.asset(picture, height: 80, width: 85),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.0),
            child: Text(name, style: title()),
          ),
          Text(description, style: descrip(), textAlign: TextAlign.center),
          ButtonTheme(
            minWidth: 50.0,
            height: 25.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color(0xff9FC5E8))
            ),
            child: FlatButton(
              child: Text('Ver más', style: getTextStyle()),
              color: Color(0xff9FC5E8),
              onPressed: () { },
            ),
          ),
        ],
      ),
    );
  }
}