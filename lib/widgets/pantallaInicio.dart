// ignore_for_file: file_names
// ignore: duplicate_ignore
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:restaurant/widgets/pantallaMenu.dart';

class Pantallainicio extends StatefulWidget {
  const Pantallainicio({super.key});

  @override
  State<Pantallainicio> createState() => _PantallainicioState();
}

class _PantallainicioState extends State<Pantallainicio> {
  @override
// pantalla de Inicio
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent, // coloreamos la pagina
      body: Stack(
        children: <Widget>[
            Positioned( // creamos la franja naranja lateral
              child: Align( // alineamos la franja
                alignment: FractionalOffset.bottomRight,
                child: Container(
                  padding: const EdgeInsets.only( right: 2, left: 20, top: 30,bottom: 10), // le damos altura y ancho
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(150) // le damos curva a la franja
                    )
                  ) ,
                  child: const RotatedBox( // rotamos el texto
                    quarterTurns: 3,
                    child: Padding( // formato del texto
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Los mejores platos", style: TextStyle(
                        color: Colors.tealAccent,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        letterSpacing: 4
                      ),),
      
                    ),
                  ),
                ),
              )
            ),
            Center( // cuadramos el logo de la empresa
                child: Image.asset("/imagenes/logoComidaExpress.png",
                width: MediaQuery.of(context).size.width,
                  height: 300,
                ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 3),
            ),
          Align( // alineamos el boton
            alignment: const Alignment(0, 0.3),
            child: ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                      builder: (BuildContext) => const PantallaMenu() // al pulsar lo llevamos a la pagina
                  )
                );
              },
              child: const Text("Entrar"), // texto del boton
            ),
          ),
        ],
      ),
    );
  }
}


