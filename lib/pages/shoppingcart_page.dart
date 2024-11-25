import 'package:rakuun_tech/providers/cart_provider.dart';
import 'package:rakuun_tech/widgets/bartitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingcartPage extends StatefulWidget {
  const ShoppingcartPage({super.key});

  @override
  State<ShoppingcartPage> createState() => _ShoppingcartPageState();
}

class _ShoppingcartPageState extends State<ShoppingcartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const BarTitleWidget(),
        iconTheme: const IconThemeData(color: Colors.white),
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
                const SizedBox(height: 20),
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
                        provider.price == 0
                            ? Text('No has agregado ningún producto')
                            : Text(
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
                            const Text(
                              'Envío',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            provider.price == 0
                                ? Text('')
                                : provider.envio > 0
                                    ? Text('\$${provider.costoEnvio}')
                                    : const Text('Gratis')
                          ],
                        ),
                        provider.price == 0
                            ? const Text(
                                'Agrega productos para calcular tu envío')
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  provider.envio > 0
                                      ? Text(
                                          'Agrega \$${provider.envio} para envío gratis',
                                        )
                                      : const Text('Tienes envío gratis'),
                                ],
                              ),
                        Divider(
                          color: Theme.of(context).primaryColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            provider.price == 0
                                ? const Text('')
                                : const Text(
                                    'Total',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                            provider.envio > 0
                                ? provider.price == 0
                                    ? const Text('Aquí se mostrará tu total')
                                    : Text(
                                        '\$${provider.price + provider.costoEnvio}')
                                : Text('\$${provider.price}')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      duration: const Duration(seconds: 2),
                      backgroundColor: Theme.of(context).primaryColor,
                      showCloseIcon: true,
                      content: const Text(
                        'Aquí se usará la API de mercado pago',
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text('Pagar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
