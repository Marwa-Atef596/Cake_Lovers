import 'package:flutter/material.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "board");
          },
          child: Image.asset(
            "images/logo-removebg-preview.png",
            fit: BoxFit.cover,
            width: 250,
            height: 300,
          ),
        ),
      ),
      Container(
        child: Column(
          children: [
            Text(
              "Cake Lovers",
              style: TextStyle(
                  // color: Color(0xffcd3278),
                  color: Colors.pink,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "danco"),
            ),
          ],
        ),
      ),
    ])));
  }
}
