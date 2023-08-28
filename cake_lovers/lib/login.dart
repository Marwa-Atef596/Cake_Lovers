import 'package:cake_lovers/signin.dart';
import 'package:cake_lovers/signup.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  // late UserCredential userCredential;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Image.asset(
              "images/logo-removebg-preview.png",
              fit: BoxFit.cover,
              width: 250,
              height: 200,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: IndexedStack(
                  index: 0,
                  children: [
                    Container(
                      width: 360,
                      height: 480,
                      decoration: BoxDecoration(
                          color: Color(0XFFfaeaf1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60))),
                      child: Container(
                        padding: EdgeInsets.only(top: 50),
                        child: Column(
                          children: [
                            Text(
                              "Welcom to Cake Lovers",
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: "json",
                                color: Color(0xffd24685),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 320,
                              height: 100,
                              padding: EdgeInsets.only(top: 50),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xffd24685),
                                      // onPrimary: Color(0xff23DF23),
                                      // onSurface: Color(0xff23DF23),
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => signin()));
                                  },
                                  child: Text("Log In",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: "json",
                                      ))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 320,
                              height: 80,
                              padding: EdgeInsets.only(top: 30),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xffFEF9F5),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(
                                            color: Color(0xffd24685),
                                            width: 2)),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => signup()));
                                  },
                                  child: Text("Create Account",
                                      style: const TextStyle(
                                        fontFamily: "json",
                                        fontSize: 20,
                                        color: Color(0xffd24685),
                                      ))),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 35),
                              child: Column(
                                children: [
                                  Text(
                                    "Or Connect Use",
                                    style: TextStyle(
                                        fontFamily: "json",
                                        fontSize: 20,
                                        color: Color(0xffd24685)),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 25),
                              child: Container(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.facebook,
                                          color: Colors.blue,
                                          size: 40,
                                        )),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset("images/ins.png"),
                                      iconSize: 35,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          "images/gg.png",
                                          fit: BoxFit.cover,
                                        )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
