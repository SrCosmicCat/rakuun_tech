import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarTitleWidget extends StatelessWidget {
  const BarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/logo-dark.svg', // Ruta de tu logo
          height: 40, // Ajusta el tamaño según sea necesario
        ),
        const SizedBox(width: 10), // Espacio entre el logo y el texto
        Text('Rakuun Tech',
            style: TextStyle(
              fontFamily: 'LeagueSpartan',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ],
    );
  }
}
