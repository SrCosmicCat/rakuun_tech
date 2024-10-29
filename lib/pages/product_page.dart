import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:rakuun_tech/widgets/bartitle_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const BarTitleWidget(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text('Producto name'),
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
                    child: Image.asset('assets/images/componentes.jpeg'),
                  ),
                ),

                // CuADRO DE DESCRIPCION
                Column(
                  children: [
                    Text('Descripción:',
                        style: Theme.of(context).textTheme.headlineMedium),
                    const Text('Diodo LED 5mm Bicolor 2 patas'),
                    const Text('- Tensión: 3V'),
                    const Text('- Color: rojo y azul'),
                    const SizedBox(height: 10),
                  ],
                ),
                  // PRECIO Y CODIGO DE EJEMPLO
                const Text("Precio: 10"),
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
                            theme: githubTheme,
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
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _incrementQuantity,
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Añadir al carrito'),
            ),
              
              // BOTN FLOTANTE PA POPEAR
              FloatingActionButton(onPressed: () => Navigator.pop(context))
              ],
            ),
            
          ),
        ));
  }
}
