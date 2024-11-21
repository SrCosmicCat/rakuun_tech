import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rakuun_tech/pages/catalogue_page.dart';
import 'package:rakuun_tech/pages/login_page.dart';
import 'package:rakuun_tech/pages/signup_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), 
    builder: (context, snapshot){
      
      print('HOLA GATITOS PLSUSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS');
      if (snapshot.hasData) {
        return const CataloguePage();
      }
      else{
        return SignupPage();
      }
    }),);
  }
}