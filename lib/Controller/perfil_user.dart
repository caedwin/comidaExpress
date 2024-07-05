import 'package:flutter/material.dart';
import 'package:restaurant/Controller/usuarios.dart';

class PerfilUser extends ChangeNotifier{
  Map<String, Usuario> _usuarios = {};

  Map<String, Usuario> get usuarios {
    return {..._usuarios};
  }

  int get usuarioCount {
    return _usuarios.length;
  }

  void agregarUsuario(String usuarioId, String nombre, String email, String username, String slug ,String password, bool activo, String telefono,
      String direccion, String cp, String pais, String ciudad, String provincia, String localidad, String imagen){
    if(_usuarios.containsKey(usuarioId)) {
      _usuarios.update(
        usuarioId,
          (existingPerfilUser) => Usuario(
            id: existingPerfilUser.id,
            nombre: existingPerfilUser.nombre,
            email: existingPerfilUser.email,
            username: existingPerfilUser.username,
            slug: existingPerfilUser.slug,
            password: existingPerfilUser.password,
            activo: existingPerfilUser.activo,
            telefono: existingPerfilUser.telefono,
            direccion: existingPerfilUser.direccion,
            cp: existingPerfilUser.cp,
            pais: existingPerfilUser.pais,
            ciudad: existingPerfilUser.ciudad,
            provincia: existingPerfilUser.provincia,
            localidad: existingPerfilUser.localidad,
            imagen: existingPerfilUser.imagen,
          ),
      );
    }else{
      _usuarios.putIfAbsent(
        usuarioId,()=> Usuario(
          id: usuarioId,
          nombre: nombre,
          slug: slug,
          email: email,
          username: username,
          password: password,
          activo: activo,
          telefono: telefono,
          direccion: direccion,
          cp: cp,
          pais: pais,
          ciudad: ciudad,
          provincia: provincia,
          localidad: localidad,
          imagen: imagen,
        )
      );
    }
    notifyListeners();
  }

  void removerUsuario(String usarioId) {
    _usuarios.remove(usarioId);
    notifyListeners();
  }

}
