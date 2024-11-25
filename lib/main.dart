import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:rakuun_tech/firebase_options.dart';
import 'package:rakuun_tech/pages/catalogue_page.dart';
import 'package:rakuun_tech/pages/donation_page.dart';
import 'package:rakuun_tech/pages/login_page.dart';
import 'package:rakuun_tech/pages/shoppingcart_page.dart';
import 'package:rakuun_tech/pages/signup_page.dart';
import 'package:rakuun_tech/providers/cart_provider.dart';
import 'package:rakuun_tech/themes/rakuun_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(
    ChangeNotifierProvider(create: (context) => CartProvider(), 
    child: MainApp(),),);
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
        'catalogue': (context) => const CataloguePage(),
        'donation': (context) => const DonationPage(),
        'shopping-cart': (context) => ShoppingcartPage(),
      },
      theme: (rakuunTheme),
    );
  }
}
