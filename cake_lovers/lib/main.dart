import 'package:cake_lovers/cartscreen.dart';
import 'package:cake_lovers/login.dart';
import 'package:cake_lovers/menucard.dart';
import 'package:cake_lovers/model/cartprovider.dart';
import 'package:cake_lovers/onboarding.dart';
import 'package:cake_lovers/page1.dart';
import 'package:cake_lovers/proculist.dart';
import 'package:cake_lovers/prodolist.dart';
import 'package:cake_lovers/profchlist.dart';
import 'package:cake_lovers/protlist.dart';
import 'package:cake_lovers/signin.dart';
import 'package:cake_lovers/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (Context) {
          return cartProvider();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "board": (context) => OnboardingPage1(),
            "login": (context) => login(),
            "signUp": (context) => signup(),
            "signin": (context) => signin(),
            "menu": (context) => menue(),
            "tartlist": (context) => protlist(),
            "cheesetlist": (context) => prochlist(),
            "cuptlist": (context) => proculist(),
            "dontlist": (context) => prodolist(),
            "cart": (context) => catrscreen()
          },
          home: page1(),
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(), onWillPop: () => _onbackbutton(context));
  }

  _onbackbutton(BuildContext context) async {
    bool? exitApp = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Relly Exit?"),
            content: Text("Do you want Exit App?"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("Ok"))
            ],
          );
        });
    return exitApp ?? false;
  }
}
