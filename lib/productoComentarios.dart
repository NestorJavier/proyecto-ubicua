import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class ComentariosScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    var imageProduct = "img/chamarra.jpg";
    var commentsList = [
      {
        "userName": "Rafa",
        "profilePicture": "img/rafa.jpg",
        "comment": "Ut enim ad minim veniam, quis nostrud exercitation",
      },
      {
        "userName": "Karen",
        "profilePicture": "img/karen.jpg",
        "comment": "Ut enim ad minim veniam, quis nostrud exercitation",
      },
      {
        "userName": "Barron",
        "profilePicture": "img/barron.jpg",
        "comment": "Ut enim ad minim veniam, quis nostrud exercitation",
      },
      {
        "userName": "Roberto",
        "profilePicture": "img/roberto.jpg",
        "comment": "Ut enim ad minim veniam, quis nostrud exercitation",
      },
      {
        "userName": "Néstor",
        "profilePicture": "img/nestor.jpg",
        "comment": "Ut enim ad minim veniam, quis nostrud exercitation",
      },
      {
        "userName": "Ricardo Granja",
        "profilePicture": "img/granja.jpg",
        "comment": "Ut enim ad minim veniam, quis nostrud exercitation",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9FC5E8),
        title: Text("Comentarios"),
      ),
      body: ListView.builder(
        itemCount: (commentsList.length + 1),
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return ListTile(
              title: Producto(imageProduct),
            );
          } else {
            index--;
            return ListTile(
              title: Comment(
                  commentsList[index]['userName'],
                  commentsList[index]['profilePicture'],
                  commentsList[index]['comment']),
            );
          }
        },
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final userName;
  final profilePicture;
  final comment;

  Comment(this.userName, this.profilePicture, this.comment);

  TextStyle commentStyle() {
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
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Color(0xFFF6B26B),
            width: 3,
          ),
        ),
        padding: EdgeInsets.all(0.0),
        margin: EdgeInsets.all(8.0),
        child: SizedBox(
            height: 100,
            child: Row(
              children: <Widget>[
                CircularProfileAvatar(
                  '',
                  child: Image.asset(profilePicture),
                  errorWidget: (context, url, error) => Container(
                    child: Icon(Icons.error),
                  ),
                  placeHolder: (context, url) => Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  borderWidth: 3,
                  borderColor: Color(0xff9FC5E8),
                  elevation: 0,
                  onTap: () {},
                  cacheImage: true,
                  showInitialTextAbovePicture: false,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Text(userName, style: nombreStyle()),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0, left: 8.0),
                        child: Text(comment, style: commentStyle()),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}

class Producto extends StatelessWidget {
  final productImage;

  Producto(this.productImage);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFF6B26B), width: 3),
        ),
        padding: EdgeInsets.all(0.0),
        margin: EdgeInsets.all(8.0),
        child: SizedBox(
          height: 200,
          child: Container(
            color: Color.fromRGBO(159, 197, 232, 0.5),
            child: Image.asset(productImage),
          ),
        ));
  }
}
