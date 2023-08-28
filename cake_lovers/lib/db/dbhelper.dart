import 'dart:async';
import 'dart:io' as io;

import 'package:cake_lovers/model/cartmodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return null;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart1.db');
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      // onUpgrade: (db, oldVersion, newVersion) => _upgrade(db),
    );
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart1 (id INTEGER PRIMARY KEY autoincrement , productId VARCHAR UNIQUE, productName TEXT, initPrice INTEGER, productPrice INTEGER, quantity INTEGER, images TEXT)');
  }

  _upgrade(Database db) {
    try {
      String sql = 'DROP TABLE cart1';
      db.execute(sql);
      _onCreate(db, 6);
      print("on upgrate");
    } on DatabaseException catch (e) {
      print(e.result.toString());
    }
  }

  Future<Cart1> insert(Cart1 cart1) async {
    var dbClient = await db;
    await dbClient!.insert("cart1", cart1.toMap());
    return cart1;
  }

  Future<List<Cart1>> getCartList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query("cart1");
    return queryResult.map((e) => Cart1.fromMap(e)).toList();
  }

  Future<int> updatequantity(Cart1 cart1) async {
    var dbClient = await db;
    return await dbClient!
        .update('cart1', cart1.toMap(), where: 'id = ?', whereArgs: [cart1.id]);
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('cart1', where: 'id=?', whereArgs: [id]);
  }
}
