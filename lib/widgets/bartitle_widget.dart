import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarTitleWidget extends StatelessWidget {
  const BarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row( crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/logo-dark.svg', // Ruta de tu logo
          height: 30, // Ajusta el tamaño según sea necesario
        ),
        const SizedBox(width: 10), // Espacio entre el logo y el texto
        Text('Rakuun Tech',
            style: TextStyle(
              fontFamily: 'LeagueSpartan-SemiBold',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ],
    );
  }
}
