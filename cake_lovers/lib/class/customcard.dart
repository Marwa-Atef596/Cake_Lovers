import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String overlayText;

  const CustomCard({
    required this.imagePath,
    required this.overlayText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        //fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(
                      imagePath,
                    ),
                    fit: BoxFit.cover)),

            // child: Image.asset(
            //   imagePath,
            // height: 200,
            // width: 150,
            // fit: BoxFit.cover,
            // ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 139, 126, 132).withOpacity(0.4),
              ),
              height: 220,
              width: 180,
              // color: Color.fromARGB(225, 204, 162, 180).withOpacity(0.9),
              child: Center(
                child: Text(
                  overlayText,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: "danco",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // Container(
          //  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          //   height: 200,
          //   width: 150,
          //   color: Color.fromARGB(225, 204, 162, 180).withOpacity(0.9),
          //   child: Center(
          //     child: Text(
          //       overlayText,
          //       style: TextStyle(
          //         fontSize: 20,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
