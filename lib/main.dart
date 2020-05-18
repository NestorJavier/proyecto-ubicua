import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'resumen_compra.dart';
import 'Principal.dart';
import 'productos.dart';
import 'TermCond.dart';
import 'Perfil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './services/auth_firebase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Intercambio',
      home: RootPage(authFirebase: new AuthFirebase()),
    ),
  );
}

class RootPage extends StatefulWidget{
  RootPage({Key key, this.authFirebase}):super(key:key);

  final AuthFirebase authFirebase;
  @override
  RootPageClass createState() => new RootPageClass();
}

enum AuthStatus{
  notSignedIn,
  signedIn,
}

class RootPageClass extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  @override
  void initState() {
    widget.authFirebase.currentUser().then((userId){
      setState(() {
        authStatus = userId != null ? AuthStatus.signedIn : AuthStatus.notSignedIn;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      case AuthStatus.notSignedIn:
        return LoginScreen(auth: widget.authFirebase, onSignIn: ()=>updateAuthStatus(AuthStatus.signedIn),);
      case AuthStatus.signedIn:
       return MainScreen(onSignIn: ()=>updateAuthStatus(AuthStatus.notSignedIn), authFirebase: widget.authFirebase,);
    }
  }

  void updateAuthStatus(AuthStatus auth){
    setState(() {
      authStatus=auth;
    });
  }
}


class LoginScreen extends StatefulWidget {
  LoginScreen ({Key key, this.auth, this.onSignIn}):super(key:key);
  final AuthFirebase auth;
  final VoidCallback onSignIn;
  @override
  LoginScreenClass createState() => new LoginScreenClass();
}


class LoginScreenClass extends State<LoginScreen> {
  
  final databaseReference = Firestore.instance;
  var email = TextEditingController();
  var password = TextEditingController();

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
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0),
                  child: Text('Inicia sesión para comenzar.',
                    style: TextStyle(fontSize: 20),
                  ),
                )
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
                    controller: email,
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
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'contraseña',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
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
                  widget.auth.emailLogin(email: email.text, password: password.text)
                      .then((res){
                        print(res); 
                        if(res is bool){
                          if(res){
                            widget.onSignIn();
                          } else {
                            print('Fallo inicio de sesión');
                          }
                        } else {
                            print('Fallo inicio de sesión ' + res);
                        }
                      });
                },
              ),
            ),
            SizedBox(height: 80),
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

class RegisterScreen extends StatefulWidget {
  final AuthFirebase auth = new AuthFirebase();
  @override
  RegisterScreenClass createState() => new RegisterScreenClass();
}


class RegisterScreenClass extends State<RegisterScreen> {
  var email = TextEditingController();
  var password = TextEditingController();
  var password2 = TextEditingController();

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
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 25.0),
                  child: Text('Crear Cuenta', style: TextStyle(fontSize: 20)),
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
                      labelText: 'Nombre',
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
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo electrónico',
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
                    controller: password,
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
                    controller: password2,
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
                  if(password.text == password.text){
                    widget.auth.emailSignUpWithEmail(email: email.text, password: password.text);
                    Navigator.pop(context);
                  }else{
                    print('La contraseña no coincide');
                  }
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Al crear una cuenta, estás de acuerdo con nuestros\n ', style: TextStyle(color: Colors.black)),
                      TextSpan(text: 'Términos y Condiciones',
                        style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context) => new TermCond())),
                      )
                    ]
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(),
                )
              ],
            ),
            SizedBox(height: 40),
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
  MainScreen ({Key key, this.onSignIn, this.authFirebase});
  final VoidCallback onSignIn;
  final AuthFirebase authFirebase;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    PrincipalScreen(),
    Text(
      'Index 1: Promociones',
    ),
    ProductosScreen(),
    Perfil()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void signOut(){
    widget.authFirebase.signOut();
    widget.onSignIn();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9FC5E8),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'img/Logo.png',
              width: 55,
              color: Colors.white,
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () {
            signOut();
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
                child: Icon(Icons.shopping_basket, color: Colors.white, size: 28,),
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
              icon: Icon(Icons.home, color: Colors.white, size: 28),
              title: Text('Inicio', style: TextStyle(color: Colors.white)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer, color: Colors.white, size: 28),
              title: Text('Promociones', style: TextStyle(color: Colors.white)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store, color: Colors.white, size: 28),
              title: Text('Productos', style: TextStyle(color: Colors.white)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white, size: 28),
              title: Text('Perfil', style: TextStyle(color: Colors.white)),
            ),
          ],
          backgroundColor: Color(0xff9FC5E8),
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
      body: Container(
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
          )
      ),
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
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left:25.0),
                      child: Text(
                        ' Subtotal: \$400',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                height: 50,
              ),
              ButtonTheme(
                minWidth: 200.0,
                height: 50.0,
                child: FlatButton(
                  child: Text(
                    'Proceder al Pago',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  color: Color(0xff9FC5E8),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ResumenCompraScreen()));
                  },
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
                      'img/Camisa.png',
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
              Divider(
                color: Colors.black38,
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset('img/Pantalon.png'),
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
