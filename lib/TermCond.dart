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
          height: 670.0,
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
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("Términos y Condiciones", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                    "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                    "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
                    "nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in "
                    "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
                    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia "
                    "deserunt mollit anim id est laborum.", style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text("Massa tincidunt nunc pulvinar sapien et ligula ullamcorper."
                    " Enim sed faucibus turpis in eu mi bibendum. Et ultrices neque ornare "
                    "aenean euismod elementum nisi quis eleifend. Ultrices sagittis orci a "
                    "scelerisque purus semper eget duis at. Iaculis nunc sed augue lacus. "
                    "Sed sed risus pretium quam vulputate dignissim suspendisse in. "
                    "Egestas egestas fringilla phasellus faucibus scelerisque eleifend donec pretium. "
                    "Pretium aenean pharetra magna ac placerat vestibulum lectus mauris ultrices. "
                    "Faucibus purus in massa tempor nec feugiat nisl. Urna cursus eget nunc scelerisque "
                    "viverra mauris in. Scelerisque felis imperdiet proin fermentum leo vel orci. Praesent "
                    "tristique magna sit amet. Nunc aliquet bibendum enim facilisis gravida. Convallis"
                    " aenean et tortor at risus viverra adipiscing at. Pharetra sit amet aliquam id diam. "
                    "Pretium nibh ipsum consequat nisl vel. Imperdiet proin fermentum leo vel orci porta "
                    "non pulvinar neque.", style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,),
              )
            ],
          ),

      ),
      ],
      ),
    );
  }
}
