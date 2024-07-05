import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Controller/carrito.dart';
import 'package:restaurant/Controller/perfil_user.dart';
import 'package:restaurant/view/pantallaMenu.dart';
//import 'view/pantallaInicio.dart';

// nos traemos la libreria de la funcion provider
// para ello entramos en la web y buscamos https://pub.dev/packages/provider/install
// actualizamos el reporsitoria pubspec.yaml

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Carrito()),
      ChangeNotifierProvider(create: (context) => PerfilUser()),
    ],
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Pantalla principal de la aplicacion
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APP | Comida Express', // titulos de la pestaña del navegador
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      // home: Pantallainicio() // pantalla inicio
      home: PantallaMenu(),
    );
  }
}

