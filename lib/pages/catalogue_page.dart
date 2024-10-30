import 'package:flutter/material.dart';
import 'package:rakuun_tech/widgets/bartitle_widget.dart';
import 'package:rakuun_tech/widgets/bottomBarRT_widget.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({super.key});

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  final List<Map<String, String>> categories = [
    {'name': 'Componentes', 'image': 'assets/images/componentes.jpeg'},
    {
      'name': 'Microcontroladores',
      'image': 'assets/images/microcontroladores.png'
    },
    {'name': 'Sensores', 'image': 'assets/images/sensores.jpg'},
    {'name': 'Otros', 'image': 'assets/images/otros.jpg'},
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
                'Categorías',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 20),

              // BARRA DE BUSQUEDA
            
              SearchBar(
                leading: Icon(Icons.search_rounded),
                hintText: 'Buscar',
                onChanged: (query) {
                  print('Search query: $query');
                },
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Evita el desplazamiento independiente
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'category');
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
                                image: AssetImage(categories[index]['image']!)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            categories[index]['name']!,
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
