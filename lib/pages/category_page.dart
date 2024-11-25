import 'package:flutter/material.dart';
import 'package:rakuun_tech/pages/product_page.dart';
import 'package:rakuun_tech/widgets/bartitle_widget.dart';
import 'package:rakuun_tech/widgets/bottomBarRT_widget.dart';

class CategoryPage extends StatefulWidget {
  final Map jsondata;
  final String category;
  const CategoryPage(
      {super.key, required this.jsondata, required this.category});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<dynamic> filteredProductos = [];
  TextEditingController searchController = TextEditingController();

  late String categoria = widget.category;
  late List productos = widget.jsondata['productos'];

  @override
  void initState() {
    super.initState();
    filteredProductos = productos;
  }

  void filterSearchResults(String query) {
    List<dynamic> productosCoincidentes = [];
    productosCoincidentes.addAll(productos);
    if (query.isNotEmpty) {
      List<dynamic> productosCoincidentesData = [];
      productosCoincidentes.forEach((item) {
        if (item['nombre'].toString().toLowerCase().contains(query.toLowerCase())) {
          productosCoincidentesData.add(item);
        }
      });
      setState(() {
        filteredProductos = productosCoincidentesData;
      });
      return;
    } else {
      setState(() {
        filteredProductos = productos;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoria,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              
              // * BARRA DE BUSQUEDA
              TextField(
                controller: searchController,
                onChanged: (value) {
                  filterSearchResults(value);
                },
                onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search_rounded),
                  hintText: 'Busca...',
                ),
              ), //* Barra de búsqueda

              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Evita el desplazamiento independiente
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: filteredProductos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(
                            productoData: filteredProductos[index],
                          ),
                        ),
                      );
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
                                    offset: const Offset(0, 2),
                                    color: Colors.blueGrey.shade100,
                                    blurRadius: 2)
                              ]),
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: filteredProductos[index]['imagen'] == null
                                  ? const Image(
                                      image: AssetImage(
                                          'assets/images/no-images.png'),
                                      fit: BoxFit.cover,
                                    )
                                  : FadeInImage(
                                      placeholder: const AssetImage(
                                          'assets/images/loading.gif'),
                                      image: NetworkImage(
                                          filteredProductos[index]['imagen']))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            filteredProductos[index]['nombre']!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
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
