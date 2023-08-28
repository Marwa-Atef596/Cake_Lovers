import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  var email, pass;
  GlobalKey<FormState> formState = new GlobalKey<FormState>();
  signUp() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context, title: "Error", body: Text("pass too week"))
            ..show();
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Navigator.pop(context);

          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("The account already exists for that email."))
            ..show();
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("not valid");
    }
  }

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
                padding: EdgeInsets.only(top: 35),
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
                                "New Account",
                                style: const TextStyle(
                                  fontFamily: "json",
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffd24685),
                                ),
                              ),
                              SizedBox(
                                height: 10,
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
                                              return "Email can't be more than 100";
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
                                                      color: Color(0xffd24685),
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xffd24685),
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
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
                                      SizedBox(
                                        height: 10,
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
                                                      color: Color(0xffd24685),
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xffd24685),
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
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
                                      SizedBox(
                                        height: 20,
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
                                              UserCredential? response =
                                                  await signUp();
                                              print("___________________");
                                              if (response != null) {
                                                Navigator.pushNamed(
                                                    context, "menu");
                                              } else {
                                                print("Failed");
                                              }
                                              print("___________________");
                                            },
                                            child: Text("Sign Up",
                                                style: const TextStyle(
                                                  fontFamily: "json",
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 22),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "already a member? ",
                                                  style: TextStyle(
                                                      fontFamily: "json",
                                                      fontSize: 18,
                                                      color: Color.fromARGB(
                                                          255, 107, 108, 107)),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pushNamed(
                                                        context, "signin");
                                                  },
                                                  child: Text(
                                                    "login",
                                                    style: TextStyle(
                                                        fontFamily: "json",
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xffd24685),
                                                        decoration:
                                                            TextDecoration
                                                                .underline),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
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
    ));
  }
}
