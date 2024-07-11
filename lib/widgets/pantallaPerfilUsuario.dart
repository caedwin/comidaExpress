// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Controller/perfil_user.dart';
import 'package:restaurant/widgets/pantallaMenu.dart';

class Pantallaperfilusuario extends StatefulWidget {
  const Pantallaperfilusuario({super.key});

  @override
  State<Pantallaperfilusuario> createState() => _PantallaperfilusuarioState();
}

class _PantallaperfilusuarioState extends State<Pantallaperfilusuario> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PerfilUser>(builder: (context, usuarios, child) {
      return Scaffold(
          backgroundColor: Colors.amberAccent, // coloreamos la pagina
          appBar: AppBar(
            title: const Text("Perfil Usuario"),
            elevation: 0,
          ),
          drawer: const menuLateral(),
          body: usuarios.usuarioCount == 0 ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.accessibility, size: 60,color: Colors.white30,),
                SizedBox(height: 10),
                Text("No existen usuarios creados", style: TextStyle(fontSize: 20, color: Colors.black26)),
              ],
            ),
          ) : const SingleChildScrollView(),
      );
    }
    );
  }

}
