import 'package:cake_lovers/cartscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cartprovider.dart';

class applist extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const applist({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color(0xffd24685),
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: "danco", fontSize: 25),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                label: Consumer<cartProvider>(builder: (context, value, child) {
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
        ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
