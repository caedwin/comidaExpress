// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:restaurant/widgets/iconContainer.dart';

// ignore: camel_case_types
class loginUser extends StatefulWidget {
  const loginUser({super.key});

  @override
  State<loginUser> createState() => _loginUserState();
}

// ignore: camel_case_types
class _loginUserState extends State<loginUser> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Color.fromRGBO(232, 168, 34, 1)),
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 200),
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const IconContainer(
                      url: "/imagenes/logoComidaExpress.png",
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Correo Electrónico')
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Contraseña')
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Ingresar'),
                      ),
                    )
    
                  ],
                ),
              ]
          )
      ),
    );
  }
}
