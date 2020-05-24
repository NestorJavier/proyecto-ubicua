import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'productoNuevo.dart';
import 'productoModifica.dart';
/*
 * Colores 
 * rgb(159,197,232)                   Azul
 * Color.fromRGBO(159,197,232, 0.5),  Azul con una transparencia del 50%
 * 
 * 
 *  
 */
class ProductosScreen extends StatelessWidget {
  TextStyle getTextStyle() {
    return new TextStyle(
        fontWeight: FontWeight.w400, fontSize: 16.0, color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    var myProductList = [
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

    return ListView.builder(
      itemCount: (myProductList.length + 1),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return ListTile(
            title: AgregaProducto(),
          );
        } else {
          index--;
          return ListTile(
            title: SingleProduct(
                myProductList[index]['name'],
                myProductList[index]['picture'],
                myProductList[index]['description']),
          );
        }
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  final name;
  final picture;
  final description;

  SingleProduct(this.name, this.picture, this.description);

  TextStyle descricionStyle() {
    return new TextStyle(fontSize: 13.0, height: 1.3);
  }

  TextStyle nombreStyle() {
    return new TextStyle(
        fontSize: 13.0, height: 1.3, fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFF6B26B), width: 3),
        ),
        padding: EdgeInsets.all(0.0),
        margin: EdgeInsets.all(8.0),
        child: SizedBox(
            height: 100,
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  color: Color.fromRGBO(159, 197, 232, 0.5),
                  child: SizedBox(
                    width: 95,
                      child: RaisedButton(
                        child: Image.asset(picture),
                        onPressed: () { },
                    ),
                  ),                
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Text(name, style: nombreStyle()),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Text(description, style: descricionStyle()),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 5),
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 0.0, bottom: 0.0),
                    color: Color.fromRGBO(159, 197, 232, 0.5),
                    child: Column(children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ModificaProducto()));
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                          onPressed: () {}),
                    ])),
              ],
            )));
  }
}

class AgregaProducto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Row(children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFF6B26B), width: 3),
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: Color.fromRGBO(159, 197, 232, 1.0),
                size: 25,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NuevoProducto()));
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            "Agrega un producto nuevo",
            style: TextStyle(
                fontFamily: 'RobotoMono',
                color: Color.fromRGBO(159, 197, 232, 1.0),
                fontSize: 14.0),
          ),
        ]));
  }
}
