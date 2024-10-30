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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Iniciar sesión',
                      style: Theme.of(context).textTheme.headlineLarge),
                  const SizedBox(height: 20),
                  TextFormField(
                      autocorrect: false,
                      decoration: InputDecoration(
                          labelText: 'Usuario',
                          prefixIcon: Icon(
                            Icons.person_outline_rounded,
                            color: Theme.of(context).primaryColor,
                          )),
                      onChanged: (value) {}),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  // Ingresar
                  TextButton(
                      onPressed: () {
                        final snackBar = SnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: Theme.of(context).primaryColor,
                          showCloseIcon: true,
                          content: const Text(
                              'Inició sesión con éxito! (O solo le dio a ingresar)'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        Navigator.pushNamed(context, 'catalogue');
                      },
                      child: const Text('Ingresar')),

                  const SizedBox(height: 30),

                  // Crear Cuenta
                  Column(
                    children: [
                      const Text('¿Aún no estás registrado?'),
                      SizedBox(
                        height: 20,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'signup');
                        },
                        child: const Text('Crear Cuenta'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
