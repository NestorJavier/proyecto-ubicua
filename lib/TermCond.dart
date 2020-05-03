import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TermCond extends StatefulWidget {
  @override
  _TermCondState createState() => _TermCondState();
}

class _TermCondState extends State<TermCond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9FC5E8),
        title: Text("Términos y Condiciones"),
      ),
      body: new ListView(
    children: <Widget>[
        new Container(
        height: 500.0,
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
      ],
      ),
    );
  }
}
