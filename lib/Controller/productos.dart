// como no tenemos BD creamos los campos de la tabla
//declaramos la estructura de los datos
// ignore_for_file: non_constant_identifier_names

class Platos {
  final int id;
  final String nombre;
  final double precio;
  final String imagen;
  final bool promocion;
  final bool top;
  final String descripcion;
  final double delivery;
  final int restaurant_id;

  const Platos({ required this.id , required this.nombre, this.precio = 0, required this.imagen, this.promocion = false, this.top = false,required this.descripcion,
      this.restaurant_id = 1, required this.delivery});
}

// creamos algunos registros para mostrar
final platos=[
  const Platos(id: 1, nombre: "Carnes 1", precio: 10.5, imagen: "/platos/carne1.jpg", promocion: false, top: true, descripcion: "Plato principal de carne", delivery: 2.5),
  const Platos(id: 2, nombre: "Carne con papas al vapor y ensalada", precio: 10.5, imagen: "/platos/carne2.jpg", promocion: false, top: true, descripcion: "Plato principal de carne",delivery: 2.5),
  const Platos(id: 3, nombre: "Carnes 3", precio: 10.5, imagen: "/platos/carne3.jpg", promocion: false, top: true, descripcion: "Plato principal de carne",delivery: 0.0),
  const Platos(id: 4, nombre: "Carnes 4", precio: 10.5, imagen: "/platos/carne4.jpg", promocion: true, top: true, descripcion: "Plato principal de carne", delivery: 0.0),
  const Platos(id: 5, nombre: "pasta 1", precio: 10.5, imagen: "/platos/pasta1.jpg", promocion: true, top: false, descripcion: "Plato principal de Pasta", delivery: 0.0),
  const Platos(id: 6, nombre: "pasta 2", precio: 10.5, imagen: "/platos/pasta2.jpg", promocion: true, top: true, descripcion: "Plato principal de Pasta", delivery: 0.0),
  const Platos(id: 7, nombre: "pasta 3", precio: 10.5, imagen: "/platos/pasta3.jpg", promocion: true, top: false, descripcion: "Plato principal de Pasta", delivery: 0.0),
  const Platos(id: 8, nombre: "pasta 4", precio: 10.5, imagen: "/platos/pasta4.jpg", promocion: true, top: true, descripcion: "Plato principal de Pasta", delivery: 0.0),
  const Platos(id: 9, nombre: "Pescado 1", precio: 10.5, imagen: "/platos/pescado1.jpg", promocion: true, top: true, descripcion: "Plato principal de Pescado", delivery: 0.0),
  const Platos(id: 10, nombre: "Pescado 2", precio: 10.5, imagen: "/platos/pescado2.jpg", promocion: true, top: false, descripcion: "Plato principal de Pescado", delivery: 0.0),
  const Platos(id: 11, nombre: "Pescado 3", precio: 10.5, imagen: "/platos/pescado3.jpg", promocion: false, top: false, descripcion: "Plato principal de Pescado", delivery: 0.0),
  const Platos(id: 12, nombre: "Pescado 4", precio: 10.5, imagen: "/platos/pescado4.jpg", promocion: true, top: true, descripcion: "Plato principal de Pescado", delivery: 0.0),
  const Platos(id: 13, nombre: "Agua", precio: 2.5, imagen: "/bebidas/bebida-agua.jpg", promocion: false, top: false, descripcion: "Agua sin gas", delivery: 0.0),
  const Platos(id: 14, nombre: "Sprit", precio: 2.5, imagen: "/bebidas/bebida-chinoto.jpg", promocion: false, top: false, descripcion: "Gaseosa", delivery: 0.0),
  const Platos(id: 15, nombre: "Coca Cola", precio: 2.5, imagen: "/bebidas/bebida-cocacola.jpg", promocion: false, top: true, descripcion: "Gaseosa", delivery: 0.0),
  const Platos(id: 16, nombre: "Frescolita", precio: 2.5, imagen: "/bebidas/bebida-frescolita.jpg", promocion: false, top: false, descripcion: "Gaseosa", delivery: 0.0),
  const Platos(id: 17, nombre: "Helado 1", precio: 1.5, imagen: "postres/helado1.jpg", promocion: true, top: false, descripcion: "Helado", delivery: 0.0),
  const Platos(id: 18, nombre: "Helado 2", precio: 1.5, imagen: "postres/helado2.jpg", promocion: false, top: false, descripcion: "Helado", delivery: 0.0),
  const Platos(id: 19, nombre: "Postre 1", precio: 1.5, imagen: "postres/postre1.jpg", promocion: false, top: false, descripcion: "Postre", delivery: 0.0),
  const Platos(id: 20, nombre: "Postre 2", precio: 1.5, imagen: "postres/postre2.jpg", promocion: false, top: false, descripcion: "Postre", delivery: 0.0)
];

