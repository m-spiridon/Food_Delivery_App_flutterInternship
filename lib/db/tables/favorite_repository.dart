import 'package:internship_project_1/local_storage/db_provider.dart';
import 'package:internship_project_1/models/favorite_item_model.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteRepository {
  static const repositoryFavorite = "Favorites";
  static const String columnProductId = 'productId';

  static createRepository(Database db) async {
    return db.execute('''
      CREATE TABLE $repositoryFavorite(
        $columnProductId INTEGER PRIMARY KEY
        )
    ''');
  }

  static create(FavoriteItem item) async {
    final db = await DBProvider.db.database;
    print(db.isOpen);

    return db.insert(
      repositoryFavorite,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static getById(int id) async {
    final db = await DBProvider.db.database;

    var result = await db.query(
      repositoryFavorite,
      where: "$columnProductId = ?",
      whereArgs: [id],
    );
    return result.isNotEmpty ? FavoriteItem.fromMap(result.first) : null;
  }

  static getAll() async {
    final db = await DBProvider.db.database;

    var result = await db.query(repositoryFavorite);
    return result.isNotEmpty
        ? result.map((c) => FavoriteItem.fromMap(c)).toList()
        : [];
  }

  static update(FavoriteItem item) async {
    final db = await DBProvider.db.database;

    return await db.update(
      "Favorites",
      item.toMap(),
      where: "$columnProductId = ?",
      whereArgs: [item.productId],
    );
  }

  static delete(int id) async {
    final db = await DBProvider.db.database;

    return db.delete(
      repositoryFavorite,
      where: "$columnProductId = ?",
      whereArgs: [id],
    );
  }
}
