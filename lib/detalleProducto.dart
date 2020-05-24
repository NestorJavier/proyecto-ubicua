import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailProductScreen extends StatelessWidget {
  final DocumentSnapshot product;

  DetailProductScreen({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9FC5E8),
        title: Text("Detalles del producto"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile( title: ImageProduct( product.data.containsKey('imageURL')? product.data['imageURL'] : '')),
            ListTile(title: showProduct(context))
          ],
        ),
      )
    );
  }

  TextStyle nombreStyle() {
    return new TextStyle(
        fontSize: 14.0, height: 1.3, fontWeight: FontWeight.bold);
  }
  TextStyle subtitleStyle() {
    return new TextStyle(
        fontSize: 14.0, height: 1.3, fontWeight: FontWeight.w700, color: Colors.black);
  }
  TextStyle dataStyle() {
    return new TextStyle(fontSize: 14.0, height: 1.3);
  }

  Widget showProduct(BuildContext context){
    return Container(
        height: MediaQuery.of(context).size.height/3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Color(0xFFF6B26B),
            width: 3,
          ),
        ),
        padding: EdgeInsets.all(0.0),
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15.0, top: 15.0),
              child: Text(product.data['title'], style: TextStyle(
                  fontSize: 22.0, height: 1.3, fontWeight: FontWeight.bold)
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0, left: 8.0, right: 8.0),
              child: Text(product.data['description'], style: dataStyle(), textAlign: TextAlign.justify,),
            ),
            Container(
                margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Row(
                  children: <Widget>[
                    Text('Genero - ', style: subtitleStyle(), textAlign: TextAlign.justify,),
                    Text(product.data['genero'], style: dataStyle(), textAlign: TextAlign.justify,),
                  ],
                )
            ),
            Container(
                margin: const EdgeInsets.only(top: 5.0, left: 8.0, right: 8.0),
                child: Row(
                  children: <Widget>[
                    Text('Color - ', style: subtitleStyle(), textAlign: TextAlign.justify,),
                    Text(product.data['color'], style: dataStyle(), textAlign: TextAlign.justify,),
                  ],
                )
            ),
            Container(
                margin: const EdgeInsets.only(top: 5.0, left: 8.0, right: 8.0),
                child: Row(
                  children: <Widget>[
                    Text('Talla - ', style: subtitleStyle(), textAlign: TextAlign.justify,),
                    Text(product.data['talla'], style: dataStyle(), textAlign: TextAlign.justify,),
                  ],
                )
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0, left: 8.0, right: 8.0),
              child: buttomIntercambioCompra(product.data['intercambio'])
            )
          ],
        )
    );
  }

  Widget buttomIntercambioCompra(bool intercambio){
    if(intercambio){
      return Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: ButtonTheme(
            minWidth: 50.0,
            height: 35.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color(0xff9FC5E8))
            ),
            child: FlatButton(
              child: Text('Contactar a vendedor', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0, color: Colors.black)),
              color: Color(0xff9FC5E8),
              onPressed: () { },
            ),
          ),
        ),
      );
    }
    else{
      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: <Widget>[
                Text('Precio - ', style: subtitleStyle(), textAlign: TextAlign.justify,),
                Text('\$'+product.data['precio']+'MXN', style: dataStyle(), textAlign: TextAlign.justify,),
              ],
            ),
          ),
          ButtonTheme(
            minWidth: 50.0,
            height: 35.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color(0xff9FC5E8))
            ),
            child: FlatButton(
              child: Text('Agregar a carrito', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0, color: Colors.black)),
              color: Color(0xff9FC5E8),
              onPressed: () { },
            ),
          )
        ],
      );
    }
  }
}

class ImageProduct extends StatelessWidget {
  final productImage;

  ImageProduct(this.productImage);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/2,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFF6B26B), width: 3),
        ),
        padding: EdgeInsets.all(0.0),
        margin: EdgeInsets.all(8.0),
        child: SizedBox(
          height: 280,
          child: Container(
            color: Color.fromRGBO(159, 197, 232, 0.5),
            child: productImage != '' ? Image.network(productImage) : Center(child: Text('No exite una imagen de este producto')),
          ),
        ));
  }
}
