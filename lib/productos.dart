import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'productoNuevo.dart';
import 'productoModifica.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'DBHelper.dart';

/*
 * Colores 
 * rgb(159,197,232)                   Azul
 * Color.fromRGBO(159,197,232, 0.5),  Azul con una transparencia del 50%
 * 
 * 
 *  
 */

class ProductosScreen extends StatefulWidget {
  @override
  ProductosScreenClass createState() => new ProductosScreenClass();
}

class ProductosScreenClass extends State<ProductosScreen> {
  TextStyle getTextStyle() {
    return new TextStyle(
        fontWeight: FontWeight.w400, fontSize: 16.0, color: Colors.black);
  }

  var dbHelper = DBHelper();
  final databaseReference = Firestore.instance;
  String personUID = '';

  @override
  Widget build(BuildContext context) {
    var error =
        "https://firebasestorage.googleapis.com/v0/b/ubicua-469e6.appspot.com/o/error%2F505.jpg?alt=media&token=864ad65b-a4b6-4616-b607-b76e3b51231a";
    var image = "";
    var data;
    dbHelper.getPersonUID().then((res) {
      setState(() {
        personUID = res;
      });
    });

    return StreamBuilder(
      stream: databaseReference
          .collection('productos')
          .where('personaUID', isEqualTo: personUID)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data == null) {
          return Center(
              child: CircularProgressIndicator(
                  backgroundColor: Color(0xff9FC5E8), strokeWidth: 4));
        } else {
          return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: (snapshot.data.documents.length + 1),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return ListTile(
                      title: AgregaProducto(),
                    );
                  } else {
                    index--;
                    data = snapshot.data.documents[index].data;
                    data["index"] = index;
                    data["documentId"] =
                        snapshot.data.documents[index].documentID;
                    if (data["imageURL"].toString() == "null") {
                      data["imageURL"] = error;
                    }
                    return ListTile(
                      title: SingleProduct(data),
                    );
                  }
                },
              ));
        }
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  final product;
  final databaseReference = Firestore.instance;

  SingleProduct(this.product);
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
                  child: Image.network(product["imageURL"],
                      fit: BoxFit.fill, width: 120, height: 120),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Text(product["title"], style: nombreStyle()),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Text(product["description"],
                            style: descricionStyle()),
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
                                    builder: (context) =>
                                        ModificaProducto(product: product)));
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            //["documentId"]
                            try {
                              databaseReference
                                  .collection('productos')
                                  .document(product["documentId"])
                                  .delete();
                            } catch (e) {
                              print(e.toString());
                            }
                          }),
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
