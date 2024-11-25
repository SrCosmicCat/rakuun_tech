import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/arduino-light.dart';
import 'package:provider/provider.dart';
import 'package:rakuun_tech/providers/cart_provider.dart';
import 'package:rakuun_tech/widgets/bartitle_widget.dart';

class ProductPage extends StatefulWidget {
  final Map productoData;
  const ProductPage({super.key, required this.productoData});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Map producto = widget.productoData;
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const BarTitleWidget(),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                producto['nombre'],
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              // CUADRO DE PRODUCTO
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      color: Colors.blueGrey.shade100,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Padding(
                    padding: const EdgeInsets.all(10),

                    // * IMAGEN DEL PRODUCTO
                    child: producto['imagen'] == null
                    // Si no hay imagen
                        ? const Image(
                            image: AssetImage('assets/images/no-images.png'),
                            fit: BoxFit.cover,
                          )
                    // Si hay imagen
                        : FadeInImage(
                            placeholder:
                                const AssetImage('assets/images/loading.gif'),
                            image: NetworkImage(producto['imagen'])),),
              ),
              const SizedBox(
                height: 20,
              ),
              // CuADRO DE DESCRIPCION
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descripción:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Diodo LED 5mm Bicolor 2 patas'),
                    Text('- Tensión: 3V'),
                    Text('- Color: rojo y azul'),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // PRECIO Y CODIGO DE EJEMPLO
              Text(
                "Precio: " + producto['precio'].toString() + " \$",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: HighlightView(
                          '''void setup() {
    pinMode(LED_PIN, OUTPUT);
}
        
void loop() {
    digitalWrite(LED_PIN, HIGH);
    delay(1000);
    digitalWrite(LED_PIN, LOW);
    delay(1000);
}''',
                          language: 'cpp',
                          theme: arduinoLightTheme,
                          padding: const EdgeInsets.all(5),
                          textStyle: const TextStyle(
                            fontFamily: 'Courier New',
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text('Ver código de ejemplo'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: _decrementQuantity,
                  ),
                  Text(
                    '$_quantity',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _incrementQuantity,
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () {
                  producto['cantidad'] = _quantity;
                  provider.addItem(producto);
                  final snackBar = SnackBar(
                    duration: Duration(seconds: 2),
                    backgroundColor: Theme.of(context).primaryColor,
                    showCloseIcon: true,
                    content: const Text('Agregados al carrito con éxito'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Añadir al carrito'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
