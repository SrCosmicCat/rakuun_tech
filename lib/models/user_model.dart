import 'dart:convert';

class Usuario {
  String nombre;
  String correo;
  String contrasena;
  String? id;

  Usuario({
    required this.nombre,
    required this.correo,
    required this.contrasena,
    this.id,
  });

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        correo: json["correo"],
        contrasena: json["contrasena"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "correo": correo,
        "contrasena": contrasena,
      };

  Usuario copy() => Usuario(
      nombre: this.nombre,
      correo: this.correo,
      contrasena: this.contrasena,
      id: this.id);
}
