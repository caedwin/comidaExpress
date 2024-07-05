import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Controller/carrito.dart';
import 'package:restaurant/Controller/productos.dart';
import 'package:restaurant/view/pantallaCarrito.dart';
import 'package:restaurant/view/pantallaInicio.dart';
import 'package:restaurant/view/pantallaPerfilUsuario.dart';


class PantallaMenu extends StatefulWidget {
  @override
  State<PantallaMenu> createState() => _PantallaMenuState();
}

//Encabezado de la página
class _PantallaMenuState extends State<PantallaMenu> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final platosEnPromocion = platos.where((plato) => plato.promocion).toList();
    final platosTops = platos.where((platos) => platos.top).toList();
    // Pestanhas de nevegacion
   return Consumer<Carrito>(builder: (context, carrito, child) {
     return DefaultTabController(
       length: 3,
       child: Scaffold(
         key: _globalKey,
         backgroundColor: Colors.amberAccent,
         // pintamos el body de la pagina
         appBar: AppBar( // creamos las pestañas de navegacion
           title: Text("Comida Express", style: TextStyle(
               fontWeight: FontWeight.bold, color: Colors.blue)),
           // Titulo de la empresa
           elevation: 0,
           bottom: TabBar(
             indicatorColor: Colors.deepOrange,
             // marcamos el nombre de la pestaña
             indicatorSize: TabBarIndicatorSize.label,
             // ajustamos el marcador al largo de la palabra
             tabs: <Widget>[// Nombre de las PESTAÑAS
               new Tab(
                 child: Padding( // creamos el nombre en la pestaña
                   padding: EdgeInsets.only(left: 5, right: 5),
                   child: Text("Menú",style: TextStyle(fontSize: 12),),
                 ),
               ),
               new Tab(
                 child: Padding(
                   padding: EdgeInsets.only(left: 5, right: 5),
                   child: Text("Promociones",style: TextStyle(fontSize: 12),),
                 ),
               ),
               new Tab(
                 child: Padding(
                   padding: EdgeInsets.only(left: 5, right: 5),
                   child: Text("Recomendado",style: TextStyle(fontSize: 12),),
                 ),
               )
             ],
           ),
           actions: <Widget>[ // Creamos el boton del carrto
             new Stack(
               children: <Widget>[
                 IconButton( // boton carrito
                     icon: Icon(Icons.shopping_cart), // icono
                     padding: EdgeInsets.only(right: 18, top: 10),
                     onPressed: () {
                       carrito.itemCount !=0 ? Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>PantallaCarrito())):
                       ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                               content: Text("Tu carrito está vacío 🥺!!", textAlign: TextAlign.center,)
                           )
                       );
                     }
                 ),
                 new Positioned( //Posicion del globito y el color
                   top: 8,
                   right: 8,
                   child: Container( //
                     padding: EdgeInsets.all(2),
                     decoration: new BoxDecoration(
                         color: Colors.red,
                         borderRadius: BorderRadius.circular(4)),
                     constraints: BoxConstraints(
                         minWidth: 14,
                         minHeight: 14
                     ),
                     child: Text(
                       carrito.itemCount.toString(), // creamos el contador
                       textAlign: TextAlign.center,
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 9
                       ),),
                   ),
                 )
               ],
             )
           ],
         ),
         drawer: menuLateral(),
         body: TabBarView(
           children: <Widget>[
             // Creamos las tarjetas en cada apartado de las pestañas
               Container( // Pestaña MENU
                 padding: EdgeInsets.all(15),
                 child: GridView.builder( // creamos la tarjeta con el metodo Grid
                   itemCount: platos.length,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2, // cantidad de columnas
                     childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.1), // manejamos el tamaño de la tarjeta
                     crossAxisSpacing: 10, // separacion horizontal
                     mainAxisSpacing: 10,  // separacion vertical
                   ),
                   itemBuilder: (context, index) {
                     return Container( // Renderizamos las tarjetas
                       padding: EdgeInsets.all(5),
                       decoration: BoxDecoration( // le damos estilo a las tarjetas
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(6), // redondeamos bordes
                         boxShadow: [
                           BoxShadow( // le damos sombra a la tarjeta
                             color: Color(0x33000000),
                             blurRadius: 30,
                             offset: Offset(10, 10),
                           ),
                         ],
                       ),
                       child: Column( // mostramos los registros en el contenido de las tarjetas
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Expanded(
                             child: Image.asset(
                               "/imagenes/" + platos[index].imagen,
                               fit: BoxFit.cover,
                               scale: 1,
                             ),
                           ),
                           SizedBox(height: 8),
                           if(platos[index].top)
                             Row(
                               children: <Widget>[
                                 Icon(
                                   Icons.whatshot_rounded, // Cambia el ícono aquí
                                   color: Colors.deepOrangeAccent, // Cambia el color del ícono
                                   size: 16, // Tamaño del ícono
                                 )
                               ],
                             ),
                           SizedBox(width: 5), // Espacio entre el ícono y el texto
                           Text(
                             platos[index].nombre,
                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,),
                           ),
                           if(platos[index].promocion)
                             Align(
                               alignment: Alignment(0.9,0),
                               child: Text("Promoción",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 9),
                               ),
                             ),
                           Padding(
                             padding: EdgeInsets.only(top: 5),
                             child: Text("€ " + platos[index].precio.toString(), style: TextStyle(fontSize: 12),),
                           ),
                           Padding(
                               padding: EdgeInsets.only(top: 5, bottom: 10),
                                child: Text(platos[index].delivery != 0 ? "Delivery: €${platos[index].delivery}" : "Envío Gratis", style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold,color: Colors.red),),
                           ),

                           Center(
                             child: ElevatedButton( // Acción a realizar cuando se presiona el botón
                             onPressed: () {
                               setState(() {
                                 carrito.agregarItem(
                                     platos[index].id.toString(),
                                     platos[index].nombre,
                                     platos[index].precio,
                                     "1",
                                     platos[index].imagen,
                                     1,
                                     platos[index].delivery,
                                 );
                               });
                             },
                             child: Row(
                                mainAxisSize: MainAxisSize.min, // Ajusta el tamaño de la fila al contenido
                                children: [
                                    Icon(
                                    Icons.shopping_cart, // El icono que quieres mostrar
                                    color: Colors.red,
                                    size: 14,
                                    ),// Color del icono
                                    SizedBox(width: 8), // Espacio entre el icono y el texto
                                    Text("Agregar", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 10),)
                                ],
                             ),
                           )
                           ),
                        ],
                       )
                     );
                   },
                 ),
               ),
               Container( // INICIO Prestaña PROMOCIONES
                 padding: EdgeInsets.all(15),
                 child: GridView.builder( // creamos la tarjeta con el metodo Grid
                   itemCount: platosEnPromocion.length,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2, // cantidad de columnas
                     childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.1), // manejamos el tamaño de la tarjeta
                     crossAxisSpacing: 10, // separacion horizontal
                     mainAxisSpacing: 10,  // separacion vertical
                   ),
                   itemBuilder: (context, index) {
                     final platos = platosEnPromocion[index];
                     return Container( // Renderizamos las tarjetas
                       padding: EdgeInsets.all(5),
                       decoration: BoxDecoration( // le damos estilo a las tarjetas
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(6), // redondeamos bordes
                         boxShadow: [
                           BoxShadow( // le damos sombra a la tarjeta
                             color: Color(0x33000000),
                             blurRadius: 30,
                             offset: Offset(10, 10),
                           ),
                         ],
                       ),
                       child: Column( // mostramos los registros en el contenido de las tarjetas
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Expanded(
                             child: Image.asset(
                               "/imagenes/" + platos.imagen,
                               fit: BoxFit.cover,
                               scale: 1,
                             ),
                           ),
                           SizedBox(height: 8),
                           if(platos.top)
                             Row(
                               children: <Widget>[
                                 Icon(
                                   Icons.whatshot_rounded, // Cambia el ícono aquí
                                   color: Colors.deepOrangeAccent, // Cambia el color del ícono
                                   size: 16, // Tamaño del ícono
                                 )
                               ],
                             ),
                           SizedBox(width: 5),
                           Text(
                             platos.nombre,
                             style: TextStyle(fontWeight: FontWeight.bold),
                           ),
                           if(platos.promocion)
                             Align(
                               alignment: Alignment(0.9,0),
                               child:
                               Text("Promoción",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 9),
                               ),
                             ),
                           Padding(
                             padding: EdgeInsets.only(top: 5),
                             child: Text("€ " + platos.precio.toString()),
                           ),
                           Padding(
                             padding: EdgeInsets.only(top: 5, bottom: 10),
                             child: Text(platos.delivery != 0 ? "Delivery: €${platos.delivery}" : "Envío Gratis", style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold,color: Colors.red),),
                           ),
                           Center(
                               child: ElevatedButton( // Acción a realizar cuando se presiona el botón
                                 onPressed: () {
                                   setState(() {
                                     carrito.agregarItem(
                                         platos.id.toString(),
                                         platos.nombre,
                                         platos.precio,
                                         "1",
                                         platos.imagen,
                                         1,
                                       platos.delivery
                                     );
                                   });
                                 },
                                 child: Row(
                                   mainAxisSize: MainAxisSize.min, // Ajusta el tamaño de la fila al contenido
                                   children: [
                                     Icon(
                                       Icons.shopping_cart, // El icono que quieres mostrar
                                       color: Colors.red,
                                       size: 14,
                                     ),// Color del icono
                                     SizedBox(width: 8), // Espacio entre el icono y el texto
                                     Text("Agregar", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 10),)
                                   ],
                                 ),
                               )
                           )
                         ],
                       ),
                     );
                   },
                 ),
               ),
               Container( // INICIO PLATOS TOPS
                 padding: EdgeInsets.all(15),
                 child: GridView.builder( // creamos la tarjeta con el metodo Grid
                   itemCount: platosTops.length,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2, // cantidad de columnas
                     childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.1), // manejamos el tamaño de la tarjeta
                     crossAxisSpacing: 10, // separacion horizontal
                     mainAxisSpacing: 10,  // separacion vertical
                   ),
                   itemBuilder: (context, index) {
                     final platos = platosTops[index];
                     return Container( // Renderizamos las tarjetas
                       padding: EdgeInsets.all(5),
                       decoration: BoxDecoration( // le damos estilo a las tarjetas
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(6), // redondeamos bordes
                         boxShadow: [
                           BoxShadow( // le damos sombra a la tarjeta
                             color: Color(0x33000000),
                             blurRadius: 30,
                             offset: Offset(10, 10),
                           ),
                         ],
                       ),
                       child: Column( // mostramos los registros en el contenido de las tarjetas
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Expanded(
                             child: Image.asset(
                               "/imagenes/" + platos.imagen,
                               fit: BoxFit.cover,
                               scale: 1,
                             ),
                           ),
                           SizedBox(height: 8),
                           if(platos.top)
                             Row(
                               children: <Widget>[
                                 Icon(
                                   Icons.whatshot_rounded, // Cambia el ícono aquí
                                   color: Colors.deepOrangeAccent, // Cambia el color del ícono
                                   size: 16, // Tamaño del ícono
                                 )
                               ],
                             ),
                           SizedBox(width: 5),
                           Text(
                             platos.nombre,
                             style: TextStyle(fontWeight: FontWeight.bold),
                           ),
                           if(platos.top)
                             Align(
                               alignment: Alignment(0.9,0),
                               child:
                               Text("Lo más vendido",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 9),
                               ),
                             ),
                           Padding(
                             padding: EdgeInsets.only(top: 5),
                             child: Text("€ " + platos.precio.toString()),
                           ),
                           Padding(
                             padding: EdgeInsets.only(top: 5, bottom: 10),
                             child: Text(platos.delivery != 0 ? "Delivery: €${platos.delivery}" : "Envío Gratis", style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold,color: Colors.red),),
                           ),
                           Center(
                               child: ElevatedButton( // Acción a realizar cuando se presiona el botón
                                 onPressed: () {
                                   setState(() {
                                     carrito.agregarItem(
                                         platos.id.toString(),
                                         platos.nombre,
                                         platos.precio,
                                         "1",
                                         platos.imagen,
                                         1,
                                         platos.delivery
                                     );
                                   });
                                 },
                                 child: Row(
                                   mainAxisSize: MainAxisSize.min, // Ajusta el tamaño de la fila al contenido
                                   children: [
                                     Icon(
                                       Icons.shopping_cart, // El icono que quieres mostrar
                                       color: Colors.red,
                                       size: 14,
                                     ),// Color del icono
                                     SizedBox(width: 8), // Espacio entre el icono y el texto
                                     Text("Agregar", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 10),)
                                   ],
                                 ),
                               )
                           )
                         ],
                       ),
                     );
                   },
                 ),
               ),
             ],
           ),
         )
     );
   });
  }
}
// Componentes del Menu Lateral desplegable
class menuLateral extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amberAccent , // le damos color al menu desplegable
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader( // simulamos que un usuario esta registrado
            accountName: Text("Edwin Camacho"),
            accountEmail: Text("edwin.a.camacho@gmail.com"),
            decoration: BoxDecoration(
              color: Colors.black
            ),
          ),
          InkWell(
            child: new ListTile( // generamos el menu principal
              title: Text("Mi perfil"),
              leading: Icon(Icons.account_circle_outlined),
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext) => Pantallaperfilusuario() // redigimos la pagina al hacer clic
                    )
                );
              },
            ),
          ),
          InkWell(
            child: new ListTile( // generamos el menu principal
              title: Text("Categorías"),
              leading: Icon(Icons.category),
              onTap: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext) => PantallaMenu() // redigimos la pagina al hacer clic
                  )
                );
              },
            ),
          ),
          InkWell(
            child: new ListTile(
              title: Text("Restaurant"),
              leading: Icon(Icons.home),
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext) => PantallaMenu()
                    )
                );
              },
            ),
          ),
          InkWell(
            child: new ListTile(
              title: Text("Carrito"),
              leading: Icon(Icons.add_shopping_cart),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>PantallaCarrito()));
              },
            ),
          ),
          InkWell(
            child: new ListTile(
              title: Text("Salir"),
              leading: Icon(Icons.exit_to_app),
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext) => Pantallainicio()
                    )
                );
              },
            ),
          )
        ],
      ),
    );
  }
}