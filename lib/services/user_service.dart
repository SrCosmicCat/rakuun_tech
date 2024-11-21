import 'package:flutter/material.dart';
import 'package:rakuun_tech/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

class UsuarioService extends ChangeNotifier {
 final String _baseUrl = "rakuun-tech-7cc89-default-rtdb.firebaseio.com";
 
  bool isLoading = true;
  bool isSaving = false;

  List<Usuario> usuarios = [];

  UsuarioService() {
    this.obtenerUsuarios();
  }

   Future obtenerUsuarios() async {
    final url = Uri.https(_baseUrl, 'productos.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productosMap = json.decode(resp.body);
    productosMap.forEach((key, value) {
      final tempProducto = Usuario.fromMap(value);
      tempProducto.id = key;
      this.usuarios.add(tempProducto);
    });

    isLoading = false;
    notifyListeners();

    return this.usuarios;
  }

  Future<void> registrarUsuario(Usuario usuario) async {
    isSaving = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'usuarios.json');
    final resp = await http.post(url, body: usuario.toJson());

    final decodedData = json.decode(resp.body);
    usuario.id = decodedData['name'];
    this.usuarios.add(usuario); 

    this.usuarios.add(usuario);

    isSaving = false;
    notifyListeners();
  }
}
