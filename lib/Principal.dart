import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'detalleProducto.dart';
import 'Categorias.dart';

class PrincipalScreen extends StatefulWidget{
  PrincipalScreen({Key key}) : super(key: key);

  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen>{
  final databaseReference = Firestore.instance;

  String category = '';

  TextStyle getTextStyle() {
    return new TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0, color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Center(
            child: ButtonTheme(
              minWidth: 100.0,
              height: 30.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color(0xFFF6B26B))
              ),
              child:  FlatButton(
                child: Text('Categoría', style: getTextStyle()),
                color: Color(0xFFF6B26B),
                onPressed: () {
                  _awaitReturnCategory(context);
                },
              ),
            ),
          ),
          showProducts()
        ],
      ),
    );
  }

  void _awaitReturnCategory(BuildContext context) async{
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Categorias(),
        ));

    setState(() {
      category = result;
    });
  }

  Widget showProducts(){
    if(category == ''){
      return StreamBuilder(
          stream: databaseReference.collection('productos').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.data == null){
              return
                Center(child: CircularProgressIndicator( backgroundColor:Color(0xff9FC5E8), strokeWidth: 4));
            }
            else{
              return SizedBox(
                height: MediaQuery.of(context).size.height-195,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: GridView.builder(
                      itemCount: snapshot.data.documents.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                        crossAxisSpacing: 10.0, mainAxisSpacing: 15.0),
                      itemBuilder: (context, index){
                        return SingleProduct(snapshot.data.documents[index]);
                      }
                  )
                ),
              );
            }
          }
      );
    }
    else{
      return StreamBuilder(
          stream: databaseReference.collection('productos').where('categoria', isEqualTo: category).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.data == null){
              return Center(child: CircularProgressIndicator( backgroundColor:Color(0xff9FC5E8), strokeWidth: 4));
            }
            if(snapshot.data.documents.length == 0){
              return Center(
                  child: Padding( padding: EdgeInsets.only(top: 20.0),
                      child: Text("No hay productos con esta categoría", style: TextStyle(fontSize: 20)))
              );
            }
            else{
              return SizedBox(
                height: MediaQuery.of(context).size.height-195,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: GridView.builder(
                        itemCount: snapshot.data.documents.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                            crossAxisSpacing: 10.0, mainAxisSpacing: 15.0),
                        itemBuilder: (context, index){
                          return SingleProduct(snapshot.data.documents[index]);
                        }
                    )
                ),
              );
            }
          });
    }
  }
}

class SingleProduct extends StatelessWidget{
  final product;

  SingleProduct(this.product);

  TextStyle title(){
    return new TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: Colors.black);
  }
  TextStyle other(){
    return new TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0, color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFF6B26B)),
          borderRadius: BorderRadius.all(Radius.circular(15.0))
      ),
      child: GestureDetector(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
              child: Image.network(product.data['imageURL'], fit: BoxFit.fill, width: 120, height: 120),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Text(product.data['title'], style: title()),
            ),
            product.data['intercambio'] ? Text('¡Disponible para intercambio!', style: other()) : Text('\$'+product.data['precio']+'MXN', style: other())
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProductScreen(product: product)));
        },
      ),
    );
  }

}