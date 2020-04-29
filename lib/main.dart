import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

void main() {
  runApp(
    MaterialApp(
      title: 'Intercambio',
      home: LoginScreen(),
    ),
  );
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(
                        'img/Logo.png',
                        width: 150,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xff9FC5E8),
              ),
              height: 200,
            ),
            Row(
              children: <Widget>[
                Text(
                  '\n  Inicia sesión para comenzar.\n',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 340,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'correo electrónico',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 340,
                  height: 50,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'contraseña',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Checkbox(value: false, onChanged: (bool) {}),
                Text("Mantener iniciada la sesión",
                    style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 20),
            ButtonTheme(
              minWidth: 340,
              height: 50,
              child: FlatButton(
                color: Color(0xff9FC5E8),
                child: Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("¿No tienes cuenta?", style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 20),
            ButtonTheme(
              minWidth: 340,
              height: 50,
              child: FlatButton(
                color: Color(0xff9FC5E8),
                child: Text(
                  '¡Regístrate!',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(
                        'img/Logo.png',
                        width: 150,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Color(0xff9FC5E8)),
              height: 200,
            ),
            Row(
              children: <Widget>[
                Text(
                  '\n  Crear Cuenta\n',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 340,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'tu nombre',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 340,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'tu correo electrónico',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 340,
                  height: 50,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'contraseña',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 340,
                  height: 50,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'confirmar contraseña',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ButtonTheme(
              minWidth: 340,
              height: 50,
              child: FlatButton(
                color: Color(0xff9FC5E8),
                child: Text(
                  'Crear Cuenta',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                    "   Al crear una cuenta, estás de acuerdo con nuestros"
                    "\n   Términos y Condiciones.",
                    style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("¿Ya tienes cuenta?", style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 20),
            ButtonTheme(
              minWidth: 340,
              height: 50,
              child: FlatButton(
                color: Color(0xff9FC5E8),
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Inicio',
    ),
    Text(
      'Index 1',
    ),
    Text(
      'Index 2: Productos',
    ),
    Text(
      'Index 3: Perfil',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9FC5E8),
        leading: IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationsScreen()));
          },
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                child: Icon(Icons.shopping_basket, color: Colors.black),
              )),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xff9FC5E8),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Inicio'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.label),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              title: Text('Productos'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Perfil'),
            ),
          ],
          backgroundColor: Color(0xff9FC5E8),
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9FC5E8),
        title: Text("Notificaciones"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        '03/02/2020                                       '
                        '         ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        ' El repartidor intentó entregar tu pedido.\n'
                        ' Comunícate con él.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                          ),
                          Icon(Icons.cancel),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        '03/02/2020                                       '
                        '         ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        '¡Un objeto en tu lista de deseos\nestá en oferta!',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                          ),
                          Icon(Icons.cancel),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        '02/02/2020                                       '
                        '         ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        'Tu pedido está en camino.\n'
                        'Recíbelo en la dirección acordada...',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                          ),
                          Icon(Icons.cancel),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 10),
            ],
          ),
        ],
      )),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compra'),
        backgroundColor: Color(0xff9FC5E8),
      ),
      body: SingleChildScrollView(
          child: new Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  ' Subtotal: \$400',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            height: 50,
          ),
          ButtonTheme(
            minWidth: 340.0,
            height: 50.0,
            child: FlatButton(
              child: Text(
                'Proceder al Pago',
                style: TextStyle(fontSize: 20.0),
              ),
              color: Color(0xff9FC5E8),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.black,
          ),
          SizedBox(height: 10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset(
                  'Camisa.png',
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Camisa Lisa Azul Talla M',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'MXN300.00',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            height: 150,
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset('Pantalon.png'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Pantalón de Mezclilla Talla 32',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'MXN100.00',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            height: 150,
          ),
          SizedBox(height: 10),
        ],
      )),
    );
  }
}
