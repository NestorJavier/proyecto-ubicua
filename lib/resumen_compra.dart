import 'package:flutter/material.dart';

class ResumenCompraScreen extends StatelessWidget{
  TextStyle getTextStyle() {
    return new TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0);
  }
  TextStyle getTextStyleSub() {
    return new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, decoration: TextDecoration.underline);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resumen de compra'),
        backgroundColor: Color(0xff9FC5E8),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 40.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Productos:', style: getTextStyle()),
                        Text('\$400', style: getTextStyle())
                      ],
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(bottom: 20.0, left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Costo de envíos:', style: getTextStyle()),
                        Padding(
                          padding: EdgeInsets.only(right: 25.0),
                          child: Text('\$0', style: getTextStyle()),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(bottom: 20.0, left: 5.0),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Descuentos:', style: getTextStyle()),
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text('-\$0', style: getTextStyle()),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.black38,
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Subtotal:', style: getTextStyle()),
                        Text('\$400', style: getTextStyle())
                      ],
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(bottom: 20.0, left: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Impuestos:', style: getTextStyle()),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text('\$40', style: getTextStyle()),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(bottom: 20.0, left: 15.0),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Total a pagar:', style: getTextStyleSub()),
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text('\$440', style: getTextStyle()),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 150),
            ButtonTheme(
              minWidth: 150.0,
              height: 50.0,
              child: FlatButton(
                child: Text(
                  'Pagar',
                  style: TextStyle(fontSize: 18.0),
                ),
                color: Color(0xff9FC5E8),
                onPressed: () { },
              ),
            ),
          ],
        ),
      ),
    );
  }
}