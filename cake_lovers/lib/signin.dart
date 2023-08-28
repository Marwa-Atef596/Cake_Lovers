import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cake_lovers/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  signIn() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pass);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          AwesomeDialog(
              width: 500,
              context: context,
              title: "Error",
              body: Text("No user found for that email."))
            ..show();
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();

          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("Wrong password provided for that user."))
            ..show();
        }
      }
    } else {
      print("not valid");
    }
  }

  GlobalKey<FormState> formState = new GlobalKey<FormState>();
  var pass, email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          // padding: EdgeInsets.only(top: 5),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ;
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 30,
                    color: Color(0xffd24685),
                  ),
                ],
              ),
              Image.asset(
                "images/logo-removebg-preview.png",
                fit: BoxFit.cover,
                width: 250,
                height: 200,
              ),
              Expanded(
                child: Container(
                  //  padding: EdgeInsets.only(top: 1),
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
                          padding: EdgeInsets.only(top: 30),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  "Log In",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontFamily: "json",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffd24685),
                                  ),
                                ),
                                Form(
                                    key: formState,
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(top: 20),
                                          width: 320,
                                          child: TextFormField(
                                            onSaved: (newValue) {
                                              email = newValue!;
                                            },
                                            validator: (value) {
                                              if (value!.length > 50) {
                                                return "Email can't be more than 50";
                                              }
                                              if (value.length < 5) {
                                                return "Email can't be less than 5";
                                              }
                                              return null;
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xffd24685),
                                                        width: 2),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(10))),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(
                                                                0xffd24685),
                                                            width: 2),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                prefixIcon: Icon(Icons.email),
                                                hintText: "Email Address",
                                                hintStyle: TextStyle(
                                                  fontFamily: "json",
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 20),
                                          width: 320,
                                          child: TextFormField(
                                            onSaved: (newValue) {
                                              pass = newValue!;
                                            },
                                            validator: (value) {
                                              if (value!.length > 20) {
                                                return "Password can't be more than 20";
                                              }
                                              if (value.length < 4) {
                                                return "Password can't be less than 4";
                                              }
                                              return null;
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xffd24685),
                                                        width: 2),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(10))),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(
                                                                0xffd24685),
                                                            width: 2),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                prefixIcon: Icon(Icons.lock),
                                                suffixIcon: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.visibility_off,
                                                      // color: Colors.grey,
                                                    )),
                                                hintText: "Password",
                                                hintStyle: TextStyle(
                                                  fontFamily: "json",
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 20, right: 20),
                                              child: InkWell(
                                                child: Text(
                                                  "Sign up",
                                                  style: TextStyle(
                                                      fontFamily: "json",
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontSize: 20,
                                                      color: Color(0xffd24685)),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              signup()));
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 320,
                                          height: 75,
                                          padding: EdgeInsets.only(top: 20),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Color(0xffd24685),
                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30))),
                                              onPressed: () async {
                                                var user = await signIn();
                                                if (user != null) {
                                                  Navigator.pushNamed(
                                                      context, "menu");
                                                }
                                              },
                                              child: Text("Log In",
                                                  style: const TextStyle(
                                                    fontFamily: "json",
                                                    fontSize: 24,
                                                    color: Colors.white,
                                                  ))),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 22),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Or Conect Use",
                                                style: TextStyle(
                                                    fontFamily: "json",
                                                    fontSize: 20,
                                                    color: Color(0xffd24685)),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 30, right: 30),
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
                                                  icon: Image.asset(
                                                      "images/ins.png"),
                                                  iconSize: 35,
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Image.asset(
                                                        "images/gg.png")),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            ),
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
      ),
    );
  }
}
