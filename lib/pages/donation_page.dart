import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:rakuun_tech/widgets/bartitle_widget.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const BarTitleWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Text(
                'Dona tu componente',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Text(
                  'Texto para donar un componente paso 1 paso 2 paso 3 y asi akdapsdk'),
              TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    hintText: 'Juan Pérez',
                  ),
                  onChanged: (value) {}),
              TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Celular',
                    hintText: '427 111 5765',
                  ),
                  onChanged: (value) {}),
              TextFormField(
                  minLines: 2,
                  maxLines: 3,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      labelText: 'Descripción',
                      hintText: 'LED con dos usadas',
                      hintStyle: TextStyle()),
                  onChanged: (value) {}),
              // BOTON PARA SOLICITAR DONACION
              TextButton(
                  onPressed: () {
                  },
                  child: const Text('Solicitar')),

              // BOTN FLOTANTE PA POPEAR
              FloatingActionButton(onPressed: () => Navigator.pop(context))
            ],
          ),
        ),
      ),
    );
  }
}
