import 'package:cake_lovers/cartscreen.dart';
import 'package:cake_lovers/class/custom%20buttomnavigate.dart';
import 'package:cake_lovers/class/customcard.dart';
import 'package:cake_lovers/class/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/cartprovider.dart';

class menue extends StatefulWidget {
  const menue({super.key});

  @override
  State<menue> createState() => _menueState();
}

class _menueState extends State<menue> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            backgroundColor: Color(0xffd24685),
            title: Text(
              "Menu",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "danco",
                  fontSize: 25),
            ),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => catrscreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Badge(
                    // padding: EdgeInsets.only(top: 20),
                    label: Consumer<cartProvider>(
                        builder: (context, value, child) {
                      return Text(value.getCounter().toString());
                    }),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 1, right: 1),
                      child: Icon(
                        Icons.shopping_cart,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              )
            ]),
        drawerScrimColor: Color(0XFFfaeaf1).withOpacity(0.5),
        drawer: drawerlist(),
        bottomNavigationBar: ClipRRect(
          child: bottom(),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffd24685),
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/assortment-pieces-cake.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    " Our cake shop offers\n a delightful selection of\n cakes and treats that\n cater to various tastes\n and occasions",
                    style: TextStyle(fontSize: 18, fontFamily: "danco"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Categories",
                  style: TextStyle(
                      fontFamily: "danco",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffd24685)),
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "tartlist");
                    },
                    child: CustomCard(
                        imagePath: "images/torta.jpg", overlayText: "Tart"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "cheesetlist");
                    },
                    child: CustomCard(
                        imagePath: "images/cheesecake-1-22.jpg",
                        overlayText: "Cheese Cake"),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "cuptlist");
                    },
                    child: CustomCard(
                        imagePath: "images/cup.jpg", overlayText: "Cup Cake"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "dontlist");
                    },
                    child: CustomCard(
                        imagePath: "images/dont.jpg", overlayText: "Donuts"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
