import 'dart:async';

import 'package:internship_project_1/local_storage/repositories/cart_repository.dart';
import 'package:internship_project_1/local_storage/repositories/product_repository.dart';
import 'package:internship_project_1/db/tables/favorite_repository.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      await getDatabasesPath() + "farmGlovoDB.db",
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version) async {
    await ProductRepository.createTable(db);
    await CartRepository.createTable(db);
    await FavoriteRepository.createRepository(db);
  }
}
