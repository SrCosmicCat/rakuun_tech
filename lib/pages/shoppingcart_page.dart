import 'package:flutter/material.dart';
import 'package:rakuun_tech/widgets/bartitle_widget.dart';

class ShoppingcartPage extends StatefulWidget {
  const ShoppingcartPage({super.key});

  @override
  State<ShoppingcartPage> createState() => _ShoppingcartPageState();
}

class _ShoppingcartPageState extends State<ShoppingcartPage> {
  bool _localSwitch = false;

  void _toggleSwitch(bool value) {
    setState(() {
      _localSwitch = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const BarTitleWidget(),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mi carrito',
                      style: Theme.of(context).textTheme.headlineLarge),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor),
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
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  )
                                ],
                              ),
                              // COLUMNA CANTIDAD Y ELIMINAR
                              Column(
                                children: [
                                  Text('Cantidad'),
                                  MaterialButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Eliminar',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      )),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            color: Theme.of(context).primaryColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Envío', 
                            style: TextStyle(fontWeight: FontWeight.bold),), Text('Costo')],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Entrega local', 
                            style: TextStyle(fontWeight: FontWeight.bold),),
                              Switch(
                                value: _localSwitch,
                                onChanged: (value) {
                                  _toggleSwitch(value);
                                },
                              ),
                            ],
                          ),
                          const Text(
                              'Con la entrega local activada, el costo de envío se vuelve el 10% de tu compra'),
                          Divider(
                            color: Theme.of(context).primaryColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Total', 
                            style: TextStyle(fontWeight: FontWeight.bold),), Text('Costo total')],
                          ),
                          Text('Agrega 490 mas a tu compra para envio grati')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextButton(onPressed: () {
                    
                        final snackBar = SnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: Theme.of(context).primaryColor,
                          showCloseIcon: true,
                          content: const Text(
                              'Aquí se usará la API de mercado pago'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, child: Text('Pagar'))
                ],
              ),
              // FloatingActionButton(onPressed: () => Navigator.pop(context))
            ],
          ),
        ),
      ),
    );
  }
}
