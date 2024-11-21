import 'package:firebase_core/firebase_core.dart';
import 'package:rakuun_tech/firebase_options.dart';
import 'package:rakuun_tech/pages/catalogue_page.dart';
import 'package:rakuun_tech/pages/category_page.dart';
import 'package:rakuun_tech/pages/donation_page.dart';
import 'package:rakuun_tech/pages/login_page.dart';
import 'package:rakuun_tech/pages/product_page.dart';
import 'package:rakuun_tech/pages/shoppingcart_page.dart';
import 'package:rakuun_tech/pages/signup_page.dart';
import 'package:rakuun_tech/services/auth_gate.dart';
import 'package:rakuun_tech/themes/rakuun_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rakuun Tech',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'signup': (context) => SignupPage(),
        'catalogue': (context) => CataloguePage(),
        'category': (context) => CategoryPage(),
        'product': (context) => ProductPage(),
        'donation': (context) => DonationPage(),
        'shopping-cart': (context) => ShoppingcartPage(),
      },
      theme: (rakuunTheme),
    );
  }
}
