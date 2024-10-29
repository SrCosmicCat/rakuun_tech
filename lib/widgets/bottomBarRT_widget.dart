import 'package:flutter/material.dart';

class BottomBarRT extends StatelessWidget {
  const BottomBarRT({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          iconSize: 40,
          isSelected: true,
          hoverColor: Theme.of(context).highlightColor,
          tooltip: 'Tienda',
          icon: const Icon(Icons.storefront_outlined),
          onPressed: () {
            // Navigator.pushNamed(context, 'catalogue');
          },
        ),
        IconButton(
          iconSize: 40,
          tooltip: 'Donar un producto',
          icon: const Icon(Icons.volunteer_activism_outlined),
          onPressed: () {
            Navigator.pushNamed(context, 'donation');
          },
        ),
        IconButton(
          iconSize: 40,
          tooltip: 'Carrito de compras',
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            Navigator.pushNamed(context, 'shopping-cart');
          },
        ),
      ],
    );
  }
}
