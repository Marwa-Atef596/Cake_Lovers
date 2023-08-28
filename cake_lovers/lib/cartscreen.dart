import 'package:cake_lovers/class/applist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'db/dbhelper.dart';
import 'model/cartmodel.dart';
import 'model/cartprovider.dart';

class catrscreen extends StatefulWidget {
  const catrscreen({super.key});

  @override
  State<catrscreen> createState() => _catrscreenState();
}

class _catrscreenState extends State<catrscreen> {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart1 = Provider.of<cartProvider>(context);

    return Scaffold(
      appBar: applist(title: 'Cart'),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.white,
          child: Column(
            children: [
              FutureBuilder(
                  future: cart1.getData(),
                  builder: (context, AsyncSnapshot<List<Cart1>> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return Center(
                          child: Container(
                            padding: EdgeInsets.only(top: 180),
                            child: Image.asset(
                              "images/empty-removebg-preview.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
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
                                  margin: EdgeInsets.only(
                                      right: 5, left: 5, bottom: 10),
                                  padding: EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 140.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(snapshot
                                                  .data![index].images
                                                  .toString())),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              topLeft: Radius.circular(20)),
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                snapshot
                                                    .data![index].productName
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: "json",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            snapshot.data![index].productPrice
                                                    .toString() +
                                                " L.E",
                                            style: TextStyle(
                                                fontFamily: "json",
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffd24685)),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    int quantity = snapshot
                                                        .data![index].quantity!;
                                                    int price = snapshot
                                                        .data![index]
                                                        .initPrice!;
                                                    quantity++;
                                                    int? newprice =
                                                        price * quantity;
                                                    dbHelper!
                                                        .updatequantity(Cart1(
                                                            productId: snapshot
                                                                .data![index].id
                                                                .toString(),
                                                            productName: snapshot
                                                                .data![index]
                                                                .productName!,
                                                            initPrice: snapshot
                                                                .data![index]
                                                                .initPrice!,
                                                            productPrice:
                                                                newprice,
                                                            quantity: quantity,
                                                            images: snapshot
                                                                .data![index]
                                                                .images
                                                                .toString(),
                                                            id: snapshot
                                                                .data![index]
                                                                .id))
                                                        .then((value) {
                                                      newprice = 0;
                                                      quantity = 0;
                                                      cart1.addtotalprice(
                                                          double.parse(snapshot
                                                              .data![index]
                                                              .initPrice!
                                                              .toString()));
                                                    }).onError((error,
                                                            stackTrace) {
                                                      print(error.toString());
                                                    });
                                                  },
                                                  icon: Icon(Icons.add)),
                                              Text(snapshot
                                                  .data![index].quantity
                                                  .toString()),
                                              IconButton(
                                                  onPressed: () {
                                                    int quantity = snapshot
                                                        .data![index].quantity!;
                                                    int price = snapshot
                                                        .data![index]
                                                        .initPrice!;
                                                    quantity--;
                                                    int? newprice =
                                                        price * quantity;
                                                    if (quantity > 0) {
                                                      dbHelper!
                                                          .updatequantity(Cart1(
                                                              productId: snapshot
                                                                  .data![index]
                                                                  .id
                                                                  .toString(),
                                                              productName: snapshot
                                                                  .data![index]
                                                                  .productName!,
                                                              initPrice: snapshot
                                                                  .data![index]
                                                                  .initPrice!,
                                                              productPrice:
                                                                  newprice,
                                                              quantity:
                                                                  quantity,
                                                              images: snapshot
                                                                  .data![index]
                                                                  .images
                                                                  .toString(),
                                                              id: snapshot
                                                                  .data![index]
                                                                  .id))
                                                          .then((value) {
                                                        newprice = 0;
                                                        quantity = 0;
                                                        cart1.removetotalprice(
                                                            double.parse(snapshot
                                                                .data![index]
                                                                .initPrice!
                                                                .toString()));
                                                      }).onError((error,
                                                              stackTrace) {
                                                        print(error.toString());
                                                      });
                                                    }
                                                  },
                                                  icon: Icon(Icons.remove)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 50),
                                      IconButton(
                                          onPressed: () {
                                            dbHelper!.delete(
                                                snapshot.data![index].id);
                                            cart1.removecounter();

                                            cart1.removetotalprice(double.parse(
                                                snapshot
                                                    .data![index].productPrice
                                                    .toString()));
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ))
                                    ],
                                  ));
                            });
                      }
                    } else {}
                    return Text("data");
                  }),
              Consumer<cartProvider>(builder: (context, value, child) {
                return Visibility(
                  visible: value.gettotalprice().toStringAsFixed(2) == '0.00'
                      ? false
                      : true,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      reuse(
                          title: "Total ",
                          value: value.gettotalprice().toStringAsFixed(2) +
                              '  L.E '),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            //padding: EdgeInsets.only(right: 40),
                            backgroundColor: Color(0xffd24685),
                            fixedSize: Size(150, 40)),
                        onPressed: () {},
                        child: Text(
                          'Buy Now',
                          style: TextStyle(fontFamily: "json", fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class reuse extends StatelessWidget {
  final String title, value;
  const reuse({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: TextStyle(
              fontFamily: "json",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xffd24685)),
        ),
        Text(value,
            style: TextStyle(
              fontFamily: "json",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ))
      ],
    );
  }
}
