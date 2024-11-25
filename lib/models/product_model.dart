import 'dart:convert';

class Product {
  String? imagen;
  String nombre;
  double precio;
  int cantidad;
  String? descripcion;
  String? id;

  Product(
      {
      this.imagen,
      required this.nombre,
      required this.precio,
      required this.cantidad,
      this.descripcion,
      this.id,});

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        imagen: json["imagen"],
        nombre: json["nombre"],
        cantidad: json["cantidad"],
        precio: json["precio"]?.toDouble(),
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toMap() => {
        "imagen": imagen,
        "nombre": nombre,
        "cantidad": cantidad,
        "precio": precio,
        "descripcion": descripcion
      };

  Product copy() => Product(
      imagen: this.imagen,
      nombre: this.nombre,
      cantidad: this.cantidad,
      precio: this.precio,
      descripcion: this.descripcion,
      id: this.id);
}
