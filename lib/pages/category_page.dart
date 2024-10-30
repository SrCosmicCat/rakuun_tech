import 'package:flutter/material.dart';
import 'package:rakuun_tech/widgets/bartitle_widget.dart';
import 'package:rakuun_tech/widgets/bottomBarRT_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<Map<String, String>> products = [
    {
      'name': 'Led Genérico 5mm',
      'image': 'assets/images/sensores.jpg',
      'price': '10'
    },
    {
      'name': 'Led Rojo 5mm',
      'image': 'assets/images/microcontroladores.png',
      'price': '10'
    },
    {
      'name': 'Led Verde 5mm',
      'image': 'assets/images/sensores.jpg',
      'price': '10'
    },
    {
      'name': 'Led Amarillo 5mm',
      'image': 'assets/images/otros.jpg',
      'price': '10'
    },
    {'name': 'Led Azul 5mm', 'image': 'assets/images/otros.jpg', 'price': '10'},
    {'name': 'Led RGB 5mm', 'image': 'assets/images/otros.jpg', 'price': '20'},
  ];

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LEDS',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 20),
              SearchBar(
                leading: Icon(Icons.search_rounded),
                hintText: 'Buscar',
                onChanged: (query) {
                  print('Search query: $query');
                },
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Evita el desplazamiento independiente
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'product');
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 2),
                                    color: Colors.blueGrey.shade100,
                                    blurRadius: 2)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image(
                                image: AssetImage(products[index]['image']!)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            products[index]['name']!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBarRT(0),
    );
  }
}
