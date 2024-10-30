import 'package:flutter/material.dart';
import 'package:rakuun_tech/widgets/top_login_widget.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
                  Text(
                    'Crear cuenta',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Theme.of(context).primaryColor,
                          )),
                      onChanged: (value) {}),
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
                              'Cuenta creada correctamente! (O solo le dio a continuar)'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pushNamed(context, 'catalogue');
                      },
                      child: const Text('Continuar')),
                  // Crear Cuent
                ],
              ),
            ),
            // FloatingActionButton(onPressed: () => Navigator.pop(context))
          ],
        ),
      )),
    );
  }
}
