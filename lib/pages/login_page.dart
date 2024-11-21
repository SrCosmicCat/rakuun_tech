import 'package:rakuun_tech/services/auth_service.dart';
import 'package:rakuun_tech/widgets/top_login_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;

  LoginPage({super.key, this.onTap});

  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
          Navigator.pushNamed(context, 'catalogue');
    } catch (e) {
      showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: Text(e.toString()),
            )),
      );
    }
  }

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
                    controller: _emailController,
                      autocorrect: false,
                      decoration: InputDecoration(
                          labelText: 'Correo Electrónico',
                          prefixIcon: Icon(
                            Icons.person_outline_rounded,
                            color: Theme.of(context).primaryColor,
                          )),
                      onChanged: (value) {}),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
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
                  // BOTÓN DE INGRESAR 
                  TextButton(
                      onPressed: () {
                        login(context);
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
