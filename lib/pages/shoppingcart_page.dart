import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rakuun_tech/providers/cart_provider.dart';
import 'package:rakuun_tech/widgets/bartitle_widget.dart';

class ShoppingcartPage extends StatefulWidget {
  const ShoppingcartPage({super.key});

  @override
  State<ShoppingcartPage> createState() => _ShoppingcartPageState();
}

class _ShoppingcartPageState extends State<ShoppingcartPage> {
  double paraEnvio = 500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const BarTitleWidget(),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Consumer<CartProvider>(
        builder: (context, provider, child) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mi carrito',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Productos',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Divider(
                          color: Theme.of(context).primaryColor,
                        ),
                        ...provider.cartItems.map((item) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Image(
                                        image: NetworkImage(item['imagen']),
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        item['nombre'],
                                        softWrap: true,
                                      ),
                                      Text(
                                        '\$${item['precio']}',
                                        softWrap: true,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Cantidad: ${item['cantidad']}'),
                                      MaterialButton(
                                        onPressed: () {
                                          provider.removeItem(item);
                                        },
                                        child: Text(
                                          'Eliminar',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          );
                        }).toList(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Envío',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            provider.envio > 0
                                ? Text('\$${109}')
                                : Text('Gratis')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            provider.envio > 0
                                ? Text(
                                    'Agrega ${provider.envio} para envío gratis',
                                  )
                                : Text('Tienes envío gratis'),
                          ],
                        ),
                        Divider(
                          color: Theme.of(context).primaryColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('\$${provider.price}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      duration: Duration(seconds: 2),
                      backgroundColor: Theme.of(context).primaryColor,
                      showCloseIcon: true,
                      content: const Text(
                        'Aquí se usará la API de mercado pago',
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text('Pagar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
