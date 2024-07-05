
// creamos la clase de los registros
class Item {
  String id;
  String nombre;
  double precio;
  String unidad;
  String imagen;
  int cantidad;
  double delivery;

  // Constructor principal con parámetros nombrados
  Item({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.unidad,
    required this.imagen,
    required this.cantidad,
    required this.delivery,
  });

  // Constructor para mapear datos dinámicos
  Item.fromMap(Map<String, dynamic> dato)
      : id = dato["id"],
        nombre = dato["nombre"],
        precio = dato["precio"],
        unidad = dato["unidad"],
        imagen = dato["imagen"],
        cantidad = dato["cantidad"],
        delivery = dato["delivery"];

  // Método para convertir el objeto a un Map
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nombre": nombre,
      "precio": precio,
      "unidad": unidad,
      "imagen": imagen,
      "cantidad": cantidad,
      "delivery": delivery,
    };
  }

  // Método para convertir el objeto a JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nombre": nombre,
      "precio": precio,
      "unidad": unidad,
      "imagen": imagen,
      "cantidad": cantidad,
      "delivery": delivery,
    };
  }
}