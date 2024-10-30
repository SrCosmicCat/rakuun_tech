import 'package:flutter/material.dart';
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
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dona tu componente',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 10),
              const Text(
                  'Texto para donar un componente paso 1 paso 2 paso 3 y asi akdapsdk'),

              SizedBox(height: 20),
              TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    hintText: 'Juan Pérez',
                  ),
                  onChanged: (value) {}),

              SizedBox(height: 20),
              TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Celular',
                    hintText: '427 111 5765',
                  ),
                  onChanged: (value) {}),

              SizedBox(height: 20),
              TextFormField(
                  minLines: 2,
                  maxLines: 3,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      labelText: 'Descripción',
                      hintText: 'LED con dos usadas',
                      hintStyle: TextStyle()),
                  onChanged: (value) {}),

              SizedBox(height: 20),
              // BOTON PARA SOLICITAR DONACION
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Aviso', style: Theme.of(context).textTheme.headlineLarge,),
                            content:
                            Text('Tu solicitud de donación fue enviada con éxito, espera una respuesta por parte de nuestros colaboradores. ¡Gracias!')
                           , actions: [TextButton(onPressed: () => Navigator.pop(context) , child: Text('OK'))],
                          );
                        });
                  },
                  child: const Text('Solicitar')),

              SizedBox(height: 20),
              // BOTN FLOTANTE PA POPEAR
              // FloatingActionButton(onPressed: () => Navigator.pop(context))
            ],
          ),
        ),
      ),
    );
  }
}
