import 'package:cake_lovers/cartscreen.dart';
import 'package:flutter/material.dart';

class bottom extends StatefulWidget {
  const bottom({super.key});

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Color(0xffd24685),
        backgroundColor: Color(0XFFfaeaf1),
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, 'menu');
              break;
            case 1:
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => catrscreen()));

              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => catrscreen()));

              break;
            case 4:
              _openDrawer(context);

              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.abc,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: "")
        ]);
  }

  void _onItemTapped(int indexx) {
    setState(() {
      index = indexx;
    });
  }
}
