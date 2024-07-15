import 'package:flutter/material.dart';
import 'package:restaurant/Controller/Item.dart';

class Carrito extends ChangeNotifier {
  Map<String, Item> _items = {};
  int _counter = 0;

  Map<String, Item> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  int get counter => _counter;

  double get subTotal {
    var total = 0.0;
    items.forEach((key, item) => total += item.precio * item.cantidad);
    return total;
  }

  double get impuesto {
    const double iva = 0.21;
    return subTotal * iva;
  }

  double get delivery{
    var envio  = 0.0;
    items.forEach((key, item) => envio += item.delivery);
    return envio;
  }

  double get montoTotal {
    return subTotal + impuesto + delivery;
  }

  void agregarItem(String productoId, String nombre, double precio, String unidad, String imagen, int cantidad, double delivery) {
    if (_items.containsKey(productoId)) {
      counter == 1;
      _items.update(
        productoId,
            (existingItem) => Item(
          id: existingItem.id,
          nombre: existingItem.nombre,
          precio: existingItem.precio,
          unidad: existingItem.unidad,
          imagen: existingItem.imagen,
          cantidad: existingItem.cantidad + cantidad,
          delivery: existingItem.delivery,
        ),
      );
    } else {
      _items.putIfAbsent(
        productoId,
            () => Item(
          id: productoId,
          nombre: nombre,
          precio: precio,
          unidad: unidad,
          imagen: imagen,
          cantidad: cantidad,
          delivery: delivery,
        ),
      );
    }
    notifyListeners();
  }

  void removerItem(String productoId) {
    _items.remove(productoId);
    notifyListeners();
  }

  void incrementarCantidadItem(String productoId) {
    if (_items.containsKey(productoId)) {
      _items.update(
        productoId,
            (existingItem) => Item(
          id: existingItem.id,
          nombre: existingItem.nombre,
          precio: existingItem.precio,
          unidad: existingItem.unidad,
          imagen: existingItem.imagen,
          cantidad: existingItem.cantidad + 1,
          delivery: existingItem.delivery,
        ),
      );
      notifyListeners();
    }
  }

  bool disminuirCantidadItem(String productoId) {
    if (_items.containsKey(productoId) && _items[productoId]!.cantidad > 1) {
      _items.update(
        productoId,
            (existingItem) => Item(
          id: existingItem.id,
          nombre: existingItem.nombre,
          precio: existingItem.precio,
          unidad: existingItem.unidad,
          imagen: existingItem.imagen,
          cantidad: existingItem.cantidad - 1,
          delivery: existingItem.delivery,
        ));
      notifyListeners();
      return false;
    } else if (_items.containsKey(productoId)) {
      _items.remove(productoId);
      notifyListeners();
      return true;
    }
    return false; // Si el item no está en el carrito, devuelve false
  }

  void limpiarCarrito() {
    _items = {};
    notifyListeners();
  }

  void increment(){
    _counter++;
    notifyListeners();
  }

}
