import 'package:internship_project_1/local_storage/db_provider.dart';
import 'package:internship_project_1/models/product.dart';
import 'package:sqflite/sqflite.dart';

class ProductRepository {
  static const tableProducts = 'Products';
  static const String columnId = 'id';
  static const columnTitle = 'title';
  static const columnPrice = 'price';
  static const columnImage = 'image';
  static const columnSubtitle = 'subtitle';
  static const columnAmount = 'amount';
  static const columnCategory = 'cateegory';
  static const columnFoodType = 'foodType';

  static createTable(Database db) async {
    return db.execute('''
      CREATE TABLE $tableProducts(
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTitle VARCHAR(100) NOT NULL,
        $columnPrice VARCHAR(100) NOT NULL,
        $columnImage VARCHAR(100) NOT NULL,
        $columnSubtitle VARCHAR(100) NOT NULL,
        $columnAmount VARCHAR(100) NOT NULL,
        $columnCategory VARCHAR(100) NOT NULL,
        $columnFoodType VARCHAR(100) NOT NULL)
    ''');
  }

  static create(Product product) async {
    final db = await DBProvider.db.database;

    return db.insert(
      tableProducts,
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static getById(int id) async {
    final db = await DBProvider.db.database;

    var result = await db.query(
      tableProducts,
      where: "id = ?",
      whereArgs: [id],
    );
    return result.isNotEmpty ? Product.fromMap(result.first) : null;
  }

  static getAll() async {
    final db = await DBProvider.db.database;

    var result = await db.query(tableProducts);
    return result.isNotEmpty
        ? result.map((c) => Product.fromMap(c)).toList()
        : [];
  }

  static update(Product product) async {
    final db = await DBProvider.db.database;

    return await db.update(
      "Product",
      product.toMap(),
      where: "id = ?",
      whereArgs: [product.id],
    );
  }

  static delete(int id) async {
    final db = await DBProvider.db.database;

    return db.delete(
      tableProducts,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
