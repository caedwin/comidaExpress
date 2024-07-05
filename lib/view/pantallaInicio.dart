import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restaurant/view/pantallaMenu.dart';

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
      body: Container(
          child: Stack(
            children: <Widget>[
                Positioned( // creamos la franja naranja lateral
                  child: Align( // alineamos la franja
                    alignment: FractionalOffset.bottomRight,
                    child: Container(
                      padding: EdgeInsets.only( right: 2, left: 20, top: 30,bottom: 10), // le damos altura y ancho
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(150) // le damos curva a la franja
                        )
                      ) ,
                      child: RotatedBox( // rotamos el texto
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
                Padding(
                    padding: EdgeInsets.only(top: 3),
                ),
              Align( // alineamos el boton
                alignment: Alignment(0, 0.3),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (BuildContext) => PantallaMenu() // al pulsar lo llevamos a la pagina
                      )
                    );
                  },
                  child: Text("Entrar"), // texto del boton
                ),
              ),
            ],
          ),
        ),
    );
  }
}


