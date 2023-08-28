import 'package:cake_lovers/class/applist.dart';
import 'package:cake_lovers/db/dbhelper.dart';
import 'package:cake_lovers/model/cartmodel.dart';
import 'package:cake_lovers/model/cartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class proculist extends StatefulWidget {
  const proculist({super.key});

  @override
  State<proculist> createState() => _proculistState();
}

class _proculistState extends State<proculist> {
  DBHelper dbHelper = DBHelper();
  List<String> name = [
    "Regural ",
    "Red velvet ",
    "Chocolate ",
    "EX Chocolate ",
    "Strawberry ",
    "Caramel ",
    "Cream Cheese",
  ];
  List<int> price = [15, 30, 20, 25, 35, 28, 22];
  List<String> image = [
    "images/c1.jpg",
    "images/c2.webp",
    "images/cup.jpg",
    "images/c3.jpeg",
    "images/c4.jpg",
    "images/c5.jpg",
    "images/c6.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final cart1 = Provider.of<cartProvider>(context);
    return Scaffold(
      appBar: applist(title: "CupCakes"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: name.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xffFAACA8),
                              Color(0XFFFFDEE9),
                              Color(0XFFfaeaf1),
                            ]),
                      ),
                      width: 380,
                      height: 120,
                      margin: EdgeInsets.only(right: 5, left: 5, bottom: 10),
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 140.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(image[index])),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                name[index],
                                style: TextStyle(
                                  fontFamily: "json",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                price[index].toString() + " L.E",
                                style: TextStyle(
                                    fontFamily: "json",
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffd24685)),
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    backgroundColor: Color(0xffd24685),
                                    fixedSize: Size(100, 40)),
                                onPressed: () {
                                  dbHelper
                                      .insert(Cart1(
                                    id: index,
                                    productId: index.toString(),
                                    productName: name[index].toString(),
                                    initPrice: price[index],
                                    productPrice: price[index],
                                    quantity: 1,
                                    images: image[index].toString(),
                                  ))
                                      .then((value) {
                                    print("Product is added to cart");
                                    cart1.addtotalprice(
                                        double.parse(price[index].toString()));
                                    cart1.addcounter();
                                  }).onError((error, stackTrace) {
                                    print(error.toString());
                                  });
                                },
                                child: Text(
                                  "Add Cart",
                                  style: TextStyle(
                                    fontFamily: "json",
                                    fontSize: 16,
                                  ),
                                )),
                          )
                        ],
                      ));
                })
          ],
        ),
      ),
    );
  }
}
