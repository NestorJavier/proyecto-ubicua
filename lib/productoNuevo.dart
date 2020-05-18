import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class AgregaFoto extends StatefulWidget {
  @override
  AgregaFotoClass createState() => new AgregaFotoClass();
}

class NuevoProducto extends StatefulWidget {
  @override
  NuevoProductoClass createState() => new NuevoProductoClass();
}

enum Genero { femenino, masculino }

class NuevoProductoClass extends State<NuevoProducto> {
  final txtecNombre = TextEditingController();
  final txtecDescripcion = TextEditingController();
  final txtecTalla = TextEditingController();
  final txtecColor = TextEditingController();
  final txtecPrecio = TextEditingController();
  final databaseReference = Firestore.instance;

  @override
  void dispose() {
    txtecNombre.dispose();
    txtecDescripcion.dispose();
    txtecTalla.dispose();
    txtecColor.dispose();
    txtecPrecio.dispose();
    super.dispose();
  }

  String sCategoria = 'calzado';
  Genero _genero = Genero.femenino;
  bool intercambio = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9FC5E8),
        title: Text("Nuevo Producto"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
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
                controller: txtecNombre,
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
                controller: txtecDescripcion,
                maxLines: 6,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            AgregaFoto(),
            Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  title: const Text(
                    'Femenino',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                  leading: Radio(
                    activeColor: Colors.orange,
                    value: Genero.femenino,
                    groupValue: _genero,
                    onChanged: (Genero value) {
                      setState(() {
                        _genero = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  title: const Text(
                    'Masculino',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                  leading: Radio(
                    activeColor: Colors.orange,
                    value: Genero.masculino,
                    groupValue: _genero,
                    onChanged: (Genero value) {
                      setState(() {
                        _genero = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(0.0),
              margin: EdgeInsets.only(right: 200.0),
              width: 100,
              height: 50,
              child: DropdownButton<String>(
                value: sCategoria,
                icon: Icon(
                  Icons.arrow_downward,
                  color: Color.fromRGBO(159, 197, 232, 1.0),
                ),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.orange),
                underline: Container(
                  height: 2,
                  color: Color.fromRGBO(159, 197, 232, 1.0),
                ),
                onChanged: (String newValue) {
                  setState(() {
                    sCategoria = newValue;
                  });
                },
                items: <String>['calzado', 'ropa', 'niños']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  '    Talla',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(10.0),
                  width: 90,
                  height: 30,
                  child: TextField(
                    controller: txtecTalla,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  '    Color',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(10.0),
                  width: 90,
                  height: 30,
                  child: TextField(
                    controller: txtecColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  title: const Text(
                    'Intercambio',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                  leading: Radio(
                    activeColor: Colors.orange,
                    value: true,
                    groupValue: intercambio,
                    onChanged: (bool value) {
                      setState(() {
                        intercambio = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  title: const Text(
                    'Venta',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                  leading: Radio(
                    activeColor: Colors.orange,
                    value: false,
                    groupValue: intercambio,
                    onChanged: (bool value) {
                      setState(() {
                        intercambio = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  '    Precio',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(10.0),
                  width: 90,
                  height: 30,
                  child: TextField(
                    controller: txtecPrecio,
                    enabled: !intercambio,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            ButtonTheme(
              minWidth: 150.0,
              height: 50.0,
              child: FlatButton(
                child: Text(
                  'Guardar',
                  style: TextStyle(fontSize: 18.0),
                ),
                color: Color(0xff9FC5E8),
                onPressed: () {
                  createRecord(txtecNombre.text, txtecDescripcion.text, genero(_genero), sCategoria, intercambio,
                      precio(intercambio), txtecTalla.text, txtecColor.text);
                  txtecNombre.text = "";
                  txtecDescripcion.text = "";
                  txtecPrecio.text = "";
                  txtecTalla.text = "";
                  txtecColor.text = "";
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      )),
    );
  }

  void createRecord(
      var sNombre,
      var sDescripcion,
      var sGenero,
      var sCategoria,
      bool bIntercambio,
      var sPrecio,
      var sTalla,
      var sColor
    ) async {
    DocumentReference ref =
        await databaseReference.collection("productos").add({
      'title': sNombre,
      'description': sDescripcion,
      'genero': sGenero,
      'categoria': sCategoria,
      'intercambio': bIntercambio,
      'precio': sPrecio,
      'talla': sTalla,
      'color': sColor,
    });
  }

  genero(result) {
    switch (result) {
      case Genero.femenino:
        return "femenino";
      break;
      case Genero.masculino:
        return "masculino";
      break;
    }
  }

  precio(bool intercambio) {
    if(intercambio){
      return "";
    }else{
      return txtecPrecio.text;
    }
  }

}

class AgregaFotoClass extends State {
  Future<File> imageFile;

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            width: 300,
            height: 300,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error al cargar la imagen',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'Imagen no seleccionada',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.orange,
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
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
                  pickImageFromGallery(ImageSource.gallery);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              "Agrega una foto",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: Colors.orange,
              ),
            ),
          ])),
      showImage(),
    ]);
  }
}
