import 'package:capgemini/data/models/gifts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE LikedGifts(id INTEGER PRIMARY KEY AUTOINCREMENT,  giftId TEXT NOT NULL, url TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertLikedGift(SqlGift sqlGift) async {
    final Database db = await initializeDB();
    await db.insert(
      'LikedGifts',
      sqlGift.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteLikedGift(String id) async {
    final Database db = await initializeDB();
    await db.delete(
      'LikedGifts',
      where: "giftId = ?",
      whereArgs: [id],
    );
  }

  Future<List<SqlGift>> getLikedGifts() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('LikedGifts');
    return List.generate(maps.length, (i) {
      return SqlGift(
        giftId: maps[i]['giftId'],
        url: maps[i]['url'],
      );
    });
  }
}
