import 'package:internship_project_1/local_storage/db_provider.dart';
import 'package:internship_project_1/models/cart_item.dart';
import 'package:sqflite/sqflite.dart';

class CartRepository {
  static const tableCart = "Cart";
  static const String columnProductId = 'productId';
  static const String columnQuantity = 'quantity';

  static createTable(Database db) async {
    return db.execute('''
      CREATE TABLE $tableCart(
        $columnProductId INTEGER PRIMARY KEY,
        $columnQuantity INTEGER)
    ''');
  }

  static create(CartItem item) async {
    final db = await DBProvider.db.database;
    print(db.isOpen);

    return db.insert(
      tableCart,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static getById(int id) async {
    final db = await DBProvider.db.database;

    var result = await db.query(
      tableCart,
      where: "$columnProductId = ?",
      whereArgs: [id],
    );
    return result.isNotEmpty ? CartItem.fromMap(result.first) : null;
  }

  static getAll() async {
    final db = await DBProvider.db.database;

    var result = await db.query(tableCart);
    return result.isNotEmpty
        ? result.map((c) => CartItem.fromMap(c)).toList()
        : <CartItem>[];
  }

  static update(CartItem item) async {
    final db = await DBProvider.db.database;

    return await db.update(
      "Cart",
      item.toMap(),
      where: "$columnProductId = ?",
      whereArgs: [item.productId],
    );
  }

  static delete(int id) async {
    final db = await DBProvider.db.database;

    return db.delete(
      tableCart,
      where: "$columnProductId = ?",
      whereArgs: [id],
    );
  }
}
