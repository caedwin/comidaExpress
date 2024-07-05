import 'package:flutter/material.dart';
// creamos la clase de los registros

class Usuario extends ChangeNotifier{
  final String id;
  final String nombre;
  final String email;
  final String username;
  final String slug;
  final String password;
  final bool activo;
  final String telefono;
  final String direccion;
  final String cp;
  final String pais;
  final String ciudad;
  final String provincia;
  final String localidad;
  final String imagen;

  // Constructor principal con parámetros nombrados
  Usuario({
    required this.id,
    required this.nombre,
    required this.email,
    required this.username,
    required this.slug,
    required this.password,
    required this.activo,
    required this.telefono,
    required this.direccion,
    required this.cp,
    required this.pais,
    required this.ciudad,
    required this.provincia,
    required this.localidad,
    required this.imagen,

  });

  // Constructor para mapear datos dinámicos
  Usuario.fromMap(Map<String, dynamic> dato)
  : id = dato["id"],
    nombre = dato["nombre"],
    email = dato["email"],
    slug = dato["slug"],
    username  = dato["username"],
    password = dato["password"],
    activo = dato["activo"],
    telefono = dato["telefono"],
    direccion = dato["direccion"],
    cp = dato["cp"],
    pais = dato["pais"],
    ciudad = dato["ciudad"],
    provincia = dato["provincia"],
    localidad = dato["localidad"],
    imagen= dato["imagen"];

  // Método para convertir el objeto a un Map
  Map<String,dynamic>toMap(){
    return {
      "id": id,
      "nombre": nombre,
      "email": email,
      "slug": slug,
      "username": username,
      "password": password,
      "activo": activo,
      "telefono": telefono,
      "direccion": direccion,
      "cp": cp,
      "pais": pais,
      "ciudad": ciudad,
      "provincia": provincia,
      "localidad": localidad,
      "imagen": imagen,
    };
  }
  // Método para convertir el objeto a un JSON
  Map<String,dynamic>toJson(){
    return {
      "id": id,
      "nombre": nombre,
      "email": email,
      "slug": slug,
      "username": username,
      "password": password,
      "activo": activo,
      "telefono": telefono,
      "direccion": direccion,
      "cp": cp,
      "pais": pais,
      "ciudad": ciudad,
      "provincia": provincia,
      "localidad": localidad,
      "imagen": imagen,
    };
  }

  final usuario = [
    new Usuario(id: "1", nombre: 'edwin camacho', email: 'edwin.a.camacho@gmail.com', username: 'ecamacho', slug: 'edwincamacho', password: '1234', activo: true, telefono: '11223546879', direccion: 'Av.E', cp: '1010', pais: 'Venezuela', ciudad: 'Caracas', provincia: 'El paraiso', localidad: 'El pinal', imagen: ''),
  ];

}

