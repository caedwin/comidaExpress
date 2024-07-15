// import 'dart:math';
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Controller/carrito.dart';
import 'package:restaurant/Controller/productos.dart';
import 'package:url_launcher/url_launcher.dart';

class PantallaCarrito extends StatefulWidget {
  const PantallaCarrito({super.key});

  @override
  State<PantallaCarrito> createState() => _PantallaCarritoState();
}

class _PantallaCarritoState extends State<PantallaCarrito> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return Scaffold(
        backgroundColor: Colors.amberAccent, // color del tema
        appBar: AppBar(
          title: const Text("PEDIDOS"),
          elevation: 0,
        ),
        body: carrito.itemCount == 0 ? const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart, size: 60,color: Colors.white30,),
              SizedBox(height: 10),
              Text("Tu carrito está vacío", style: TextStyle(fontSize: 20, color: Colors.black26)),

            ],
          ),
        ) :
          SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text( "Resumen de la compra", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              for (var item in carrito.items.values)
                Card( // creamos la tarjeta del pedido
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),//controlamos los margenes de las tarjetas
                  child: Row(
                    mainAxisSize: MainAxisSize.min, //controlamos el desbordamiento del scroll
                    children: <Widget>[ // agregamos
                      Image.asset("/imagenes/${item.imagen}", width: 100),
                      Expanded(
                        child: Container( // contenido de la tarjeta de compra
                          padding: const EdgeInsets.all(8),
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${item.cantidad}x  ${item.nombre}",
                                style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.red),
                              ),
                              Row(// aumentamos y disminuimos la cantidad del producto
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(Radius.circular(30))),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 13,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                         carrito.disminuirCantidadItem(item.id);
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    child: Center(
                                      child: Text(item.cantidad.toString()),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(Radius.circular(30))),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        size: 13,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          carrito.incrementarCantidadItem(item.id);
                                        });
                                      },
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container( // controlamos el monto del producto
                        height: 100,
                        width: 70,
                        decoration: const BoxDecoration(color: Colors.white60),
                        child: Center(
                          child: Text(
                            "€ ${item.precio * item.cantidad}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              const Divider(
                color: Colors.black38,
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Resumen de pago",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Sub-Total:"),
                    Text("€ ${carrito.subTotal.toStringAsFixed(2)}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Impuesto:"),
                    Text("€ ${carrito.impuesto.toStringAsFixed(2)}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Delivery:"),
                    Text(carrito.delivery != 0 ? "€ ${carrito.delivery.toStringAsFixed(2)}" : "Gratis"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total:",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "€ ${carrito.montoTotal.toStringAsFixed(2)}",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton( // controlamos el botón de envío
          onPressed: () async {
            String pedido = "";
            carrito.items.forEach((key, value) { // cargamos el pedido
              pedido += "PRODUCTO: ${value.nombre}\n"
                  "CANTIDAD: ${value.cantidad}\n"
                  "PRECIO TOTAL: ${(((value.precio * value.cantidad) + value.delivery).toStringAsFixed(2))}\n"
                  "-------------------------\n";
            });
            // cargamos el total del pedidp
            pedido += "SUB-TOTAL: ${carrito.subTotal.toStringAsFixed(2)}\n";
            pedido += "IMPUESTO: ${carrito.impuesto.toStringAsFixed(2)}\n";
            pedido += "DELIVERY: ${carrito.delivery.toStringAsFixed(2)}\n";
            pedido += "TOTAL DEL PEDIDO: ${carrito.montoTotal.toStringAsFixed(2)}";
            pedido += "\n******************\n";

            // Codificar el mensaje para la URL
            String celular = "+351931159651";
            String mensaje = Uri.encodeComponent(pedido);
            String url = "https://wa.me/$celular?text=$mensaje";

            // ignore: deprecated_member_use
            if (await canLaunch(url)) {
              // ignore: deprecated_member_use
              await launch(url);
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(// cargamos mensaje al usuario
                  const SnackBar(
                      content: Text("Tu pedido fuen enviado con éxito!!", textAlign: TextAlign.center,)
                  )
              );
            } else { //controlamos si existe un error al enviar el mensaje.
              // ignore: use_build_context_synchronously
              _showErrorDialog(context, "ERROR: No se pudo enviar el pedido, contacte al administrador de la app");
            }
          },
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.send,
            color: Colors.white,
          ),
        ),
      );
    });
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}