import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rakuun_tech/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductoService extends ChangeNotifier {
  final String _baseUrl = "rakuun-tech-7cc89-default-rtdb.firebaseio.com";
  final List<Product> productos = [];

  bool isLoading = true;
  bool isSaving = false;

  Product? productoSeleccionado;
  File? newImagenProducto;

  ProductoService() {
    this.obtenerProductos();
  }

  Future obtenerProductos() async {
    final url = Uri.https(_baseUrl, 'productos.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productosMap = json.decode(resp.body);
    productosMap.forEach((key, value) {
      final tempProducto = Product.fromMap(value);
      tempProducto.id = key;
      this.productos.add(tempProducto);
    });

    isLoading = false;
    notifyListeners();

    return this.productos;
  }

  Future<String> updateProducto(Product producto) async {
    final url = Uri.https(_baseUrl, 'productos/${producto.id}.json');
    final resp = await http.put(url, body: producto.toJson());

    final decodedData = resp.body;

    final index = this.productos.indexWhere((element) => element.id == producto.id);
    this.productos[index] = producto;

    return producto.id!;
  }

  //
  Future saveOrCreateProducto(Product producto) async {
    isSaving = true;
    notifyListeners();

    if (producto.id == null) {
      await this.addProducto(producto);
    } else {
      await this.updateProducto(producto);
    }
    isSaving = false;
    notifyListeners();
  }

  
  Future<String> addProducto(Product producto) async {
    final url = Uri.https(_baseUrl, 'productos.json');
    final resp = await http.post(url, body: producto.toJson());

    final decodedData = json.decode(resp.body);
    producto.id = decodedData['name'];
    this.productos.add(producto);

    return producto.id!;
  }

  void updateImagenProducto (String path) {
    this.productoSeleccionado!.imagen = path;
    this.newImagenProducto = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> subirImagen() async {
    if(this.newImagenProducto == null) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse('https://api.cloudinary.com/v1_1/df4asig2v/image/upload?upload_preset=productos/');

    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', newImagenProducto!.path);
    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);  

    if(resp.statusCode!=200 && resp.statusCode!=201){
      return null;
    }
    this.newImagenProducto =null;
    final decodedData =json.decode(resp.body);
    return decodedData['secure_url'];
  }

}
