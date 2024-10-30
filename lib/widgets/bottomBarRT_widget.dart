import 'package:flutter/material.dart';

class BottomBarRT extends StatefulWidget {
  const BottomBarRT(selected);

  @override
  State<BottomBarRT> createState() => _BottomBarRTState();
}

class _BottomBarRTState extends State<BottomBarRT> {
  int _selectedIndex = 0;
  final List<String> _paginas = ['catalogue', 'donation', 'shopping-cart'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pushNamed(context, _paginas[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined), label: 'Tienda'),
        BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism_outlined), label: 'Donar'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), label: 'Mi carrito')
      ],

      currentIndex: _selectedIndex,
      selectedItemColor:
          Theme.of(context).highlightColor, // Cambia este color al que desees
      onTap: _onItemTapped,
    );
  }
}
