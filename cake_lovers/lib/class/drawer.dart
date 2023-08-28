import 'package:cake_lovers/cartscreen.dart';
import 'package:cake_lovers/login.dart';
import 'package:cake_lovers/proculist.dart';
import 'package:cake_lovers/prodolist.dart';
import 'package:cake_lovers/profchlist.dart';
import 'package:cake_lovers/protlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class drawerlist extends StatefulWidget {
  const drawerlist({super.key});

  @override
  State<drawerlist> createState() => _drawerlistState();
}

class _drawerlistState extends State<drawerlist> {
  @override
  Widget build(BuildContext context) {
    return MultiLevelDrawer(
      backgroundColor: Colors.white,
      rippleColor: Colors.white,
      subMenuBackgroundColor: Colors.grey.shade100,
      header: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
                backgroundImage: AssetImage("images/d66.jpg"), maxRadius: 40),
            SizedBox(
              height: 10,
            ),
            Text(
              "marwa",
              style: TextStyle(fontSize: 16, fontFamily: "json"),
            )
          ],
        )),
      ),
      children: [
        MLMenuItem(
            leading: Icon(Icons.person, color: Color(0xffd24685)),
            content: Text(
              "My Profile",
              style: TextStyle(fontSize: 16, fontFamily: "json"),
            ),
            onClick: () {}),
        MLMenuItem(
            leading: Icon(
              Icons.restaurant_menu,
              color: Color(0xffd24685),
            ),
            trailing: Icon(Icons.arrow_right, color: Color(0xffd24685)),
            content: Text(
              "Menu",
              style: TextStyle(fontSize: 16, fontFamily: "json"),
            ),
            onClick: () {},
            subMenuItems: [
              MLSubmenu(
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => protlist()));
                  },
                  submenuContent: Text(
                    "Tart",
                    style: TextStyle(fontSize: 16, fontFamily: "json"),
                  )),
              MLSubmenu(
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => prochlist()));
                  },
                  submenuContent: Text(
                    "Cheese Cake",
                    style: TextStyle(fontSize: 16, fontFamily: "json"),
                  )),
              MLSubmenu(
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => proculist()));
                  },
                  submenuContent: Text(
                    "CupCakes",
                    style: TextStyle(fontSize: 16, fontFamily: "json"),
                  )),
              MLSubmenu(
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => prodolist()));
                  },
                  submenuContent: Text(
                    "Donuts",
                    style: TextStyle(fontSize: 16, fontFamily: "json"),
                  ))
            ]),
        MLMenuItem(
            leading: Icon(Icons.shopping_cart, color: Color(0xffd24685)),
            content: Text(
              style: TextStyle(fontSize: 16, fontFamily: "json"),
              "Cart",
            ),
            onClick: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => catrscreen()));
            }),
        MLMenuItem(
          leading: Icon(Icons.logout, color: Color(0xffd24685)),
          content: Text(
            "Log Out",
            style: TextStyle(fontSize: 16, fontFamily: "json"),
          ),
          onClick: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => login()));
          },
        ),
      ],
    );
  }
}
