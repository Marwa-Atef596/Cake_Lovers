import 'package:cake_lovers/db/dbhelper.dart';
import 'package:cake_lovers/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cartProvider with ChangeNotifier {
  DBHelper db = DBHelper();
  int _counter = 0;
  int get counterr => _counter;
  double _totalprice = 0.0;
  double get totallprice => _totalprice;

  late Future<List<Cart1>> _cart1;
  Future<List<Cart1>> get cart => _cart1;
  Future<List<Cart1>> getData() async {
    _cart1 = db.getCartList();
    return _cart1;
  }

  void _setprefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('Cart1_ITem', _counter);
    prefs.setDouble('Total_PRice', _totalprice);
    notifyListeners();
  }

  void _getprefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('Cart1_ITem') ?? 0;
    _totalprice = prefs.getDouble('Total_PRice') ?? 0.0;
    notifyListeners();
  }

  void addcounter() {
    _counter++;
    _setprefItems();
    notifyListeners();
  }

  void removecounter() {
    _counter--;
    _setprefItems();
    notifyListeners();
  }

  int getCounter() {
    _getprefItems();
    return _counter;
  }

  void addtotalprice(double productPrice) {
    _totalprice = _totalprice + productPrice;
    _setprefItems();
    notifyListeners();
  }

  void removetotalprice(double productPrice) {
    _totalprice = _totalprice - productPrice;

    _setprefItems();
    notifyListeners();
  }

  double gettotalprice() {
    _getprefItems();
    return _totalprice;
  }
}
