import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ModificaProducto extends StatefulWidget {
  @override
  ModificaProductoClass createState() => new ModificaProductoClass();
}

class AgregaFoto extends StatefulWidget {
  @override
  AgregaFotoClass createState() => new AgregaFotoClass();
}

class ModificaProductoClass extends State {
  //final String nombre;

  // En el constructor, se requiere el objeto nombre
  //NuevoProductoClass({Key key, @required this.nombre}) : super(key: key);
  bool isCheckedInter = false;
  bool isCheckedVenta = false;

  void toggleCheckboxVenta(bool value) {
    if (isCheckedVenta == false) {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isCheckedVenta = true;
      });
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedVenta = false;
      });
    }
  }

  void toggleCheckboxIntercambio(bool value) {
    if (isCheckedInter == false) {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isCheckedInter = true;
      });
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedInter = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9FC5E8),
        title: Text("Modifica Producto"),
      ),
      body: SingleChildScrollView(
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
            AgregaFoto(),
            Row(
              children: <Widget>[
                Checkbox(
                  value: isCheckedInter,
                  onChanged: (value) {
                    toggleCheckboxIntercambio(value);
                  },
                  activeColor: Colors.orange,
                  checkColor: Colors.white,
                  tristate: false,
                ),
                Text(
                  'Intercambio',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: isCheckedVenta,
                  onChanged: (value) {
                    toggleCheckboxVenta(value);
                  },
                  activeColor: Colors.orange,
                  checkColor: Colors.white,
                  tristate: false,
                ),
                Text(
                  'Venta',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
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
                  width: 50,
                  height: 30,
                  child: TextField(
                    enabled: isCheckedVenta,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
