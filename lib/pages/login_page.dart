import 'package:rakuun_tech/widgets/top_login_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (SingleChildScrollView(
        child: Column(
          children: [
            const Top_login(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text('Iniciar sesión'),
                  TextFormField(
                      autocorrect: false,
                      decoration: InputDecoration(
                          labelText: 'Usuario',
                          prefixIcon: Icon(
                            Icons.person_outline_rounded,
                            color: Theme.of(context).primaryColor,
                          )),
                      onChanged: (value) {}),
                  TextFormField(
                      autocorrect: false,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Contraseña',
                          hintText: '********',
                          prefixIcon: Icon(
                            Icons.password_outlined,
                            color: Theme.of(context).primaryColor,
                          )),
                      onChanged: (value) {}),
                  // Ingresar
                  TextButton(onPressed: () {
                    Navigator.pushNamed(context, 'catalogue');
                  }, child: const Text('Ingresar')),
                  // Crear Cuenta
                  const Text('¿Aún no estás registrado?'),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'signup');
                      },
                      child: const Text('Crear Cuenta'))
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
