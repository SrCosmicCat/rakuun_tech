import 'dart:convert';

class Product {
  String? imagen;
  String nombre;
  double precio;
  String? descripcion;
  String? codigo;
  String? id;

  Product(
      {
      this.imagen,
      required this.nombre,
      required this.precio,
      this.codigo,
      this.descripcion,
      this.id,});

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        imagen: json["imagen"],
        nombre: json["nombre"],
        precio: json["precio"]?.toDouble(),
        codigo: json["codigo"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toMap() => {
        "imagen": imagen,
        "nombre": nombre,
        "precio": precio,
        "codigo": codigo,
        "descripcion": descripcion
      };

  Product copy() => Product(
      imagen: this.imagen,
      nombre: this.nombre,
      precio: this.precio,
      codigo: this.codigo,
      descripcion: this.descripcion,
      id: this.id);
}
