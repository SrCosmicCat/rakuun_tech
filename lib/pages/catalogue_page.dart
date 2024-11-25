import 'dart:convert';
import 'package:rakuun_tech/pages/category_page.dart';
import 'package:rakuun_tech/widgets/bottomBarRT_widget.dart';
import 'package:rakuun_tech/services/auth_service.dart';
import 'package:rakuun_tech/widgets/bartitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CataloguePage extends StatefulWidget {
  const CataloguePage({super.key});
  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  late Future<List<dynamic>> response;
  TextEditingController searchController = TextEditingController();

  Future<List<dynamic>> fetchProductos() async {
    var result = await http.get(Uri.parse(
        "https://rakuun-tech-default-rtdb.firebaseio.com/categorias.json"));
    return jsonDecode(result.body);
  }

  @override
  void initState() {
    response = fetchProductos();
    super.initState();
  }

  void logout() {
    final auth = AuthService();
    auth.signOut();
    Navigator.pushNamed(context, 'login');
    // PONER UN SNACK BAR
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const BarTitleWidget(),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout_rounded))
        ],
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
              const SizedBox(height: 20),
              FutureBuilder(
                  future: response,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoryPage(
                                          jsondata: snapshot.data![index],
                                          category: snapshot.data![index]['nombre'])));},
                            child: Column(
                              children: [
                                Container(
                                  height: 120,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 2),
                                            color: Colors.blueGrey.shade100,
                                            blurRadius: 2)
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image(
                                        image: NetworkImage(
                                            snapshot.data![index]['imagen'])),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    snapshot.data![index]['nombre'],
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
                      );
                    }
                    // Si no carga retorna un indicador de progreso
                    else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBarRT(0),
    );
  }
}
