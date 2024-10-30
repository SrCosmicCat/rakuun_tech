import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Top_login extends StatelessWidget {
  const Top_login({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        color: Theme.of(context).primaryColor,
        height: size.height * 0.3,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            'assets/icons/logo-dark.svg',
            semanticsLabel: 'Rakuun Tech Logo',
            height: 100,
            width: 70,
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Rakuun Tech',
              style: (Theme.of(context).textTheme.headlineMedium)),
        ]));
  }
}
