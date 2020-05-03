import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

class NuevoProducto extends StatelessWidget {
  // Future<File> imageFile;

  // pickImageFromGallery(ImageSource source) {
  //   setState(() {
  //     imageFile = ImagePicker.pickImage(source: source);
  //   });
  // }

  // Widget showImage() {
  //   return FutureBuilder<File>(
  //     future: imageFile,
  //     builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done &&
  //           snapshot.data != null) {
  //         return Image.file(
  //           snapshot.data,
  //           width: 300,
  //           height: 300,
  //         );
  //       } else if (snapshot.error != null) {
  //         return const Text(
  //           'Error Picking Image',
  //           textAlign: TextAlign.center,
  //         );
  //       } else {
  //         return const Text(
  //           'No Image Selected',
  //           textAlign: TextAlign.center,
  //         );
  //       }
  //     },
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9FC5E8),
        title: Text("Nuevo Producto"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Nombre',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Colors.orange,
            ),
          ),
          Container(
            padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.all(10.0),
            width: 340,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Text(
            'Descripción',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Colors.orange,
            ),
          ),
          Container(
            padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.all(10.0),
            width: 340,
            height: 160,
            child: TextField(
              maxLines: 6,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // showImage(),
          // RaisedButton(
          //   child: Text("Select Image from Gallery"),
          //   onPressed: () {
          //     pickImageFromGallery(ImageSource.gallery);
          //   },
          // ),
        ],
      ),
    );
  }
}
