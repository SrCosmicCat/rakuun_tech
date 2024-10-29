import 'package:flutter/material.dart';
import 'package:rakuun_tech/widgets/bartitle_widget.dart';

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Column(
                children: [
                  const Text('Mi carrito'),
                  Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Column(
                      children: [
                        const Text('Productos'),
                        Divider(
                          color: Theme.of(context).primaryColor,
                          thickness: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/componentes.jpeg'),
                                  height: 50,
                                )
                              ],
                            ),
                            // COLUMNA NOMBRE PRECIO
                            Column(
                              children: [
                                Text(
                                  'Nombre del producto',
                                  softWrap: true,
                                ),
                                Text(
                                  'Precio del producto',
                                  softWrap: true,
                                )
                              ],
                            ),
                            // COLUMNA CANTIDAD Y ELIMINAR
                            Column(
                              children: [
                                MaterialButton(
                                    onPressed: () {}, child: Text('Eliminar')),
                                Text('data')
                              ],
                            )
                          ],
                        ),
                        Divider(
                          color: Theme.of(context).primaryColor,
                          thickness: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Envío'), Text('Costo')],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Entrega local'),
                            Switch(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                        const Text(
                            'Con la entrega local activada, el costo de envío se vuelve el 10% de tu compra'),
                        Divider(
                          color: Theme.of(context).primaryColor,
                          thickness: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Total'), Text('Costo total')],),
                          Text('Agrega 490 mas a tu compra para envio grati')
                      ],
                    ),
                  ),
                  TextButton(onPressed: (){}, child: Text('Pagar'))
                ],
              ),
              FloatingActionButton(onPressed: () => Navigator.pop(context))
            ],
          ),
        ),
      ),
    );
  }
}
