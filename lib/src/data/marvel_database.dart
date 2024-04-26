import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MarvelDatabase {
  static const String _dataBaseName = "characters";
  static const String _tableName = "characters_table";
  static const String keyName = "characters";

  //Initialize database. This function has the main to create and open the sqflite  database
  static Future<Database> initDataBase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String dataBasePath =
        path.join(documentsDirectory.path, '$_dataBaseName.db');

    Database database = await openDatabase(
      dataBasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, key TEXT, value TEXT)',
        );
      },
    );

    return database;
  }
  //Save characters function
  static Future<void> saveCharacters(Database database,
      Map<String, dynamic> map, bool onInitialResponse) async {
    String value = jsonEncode(map);

    if (onInitialResponse) {
      await database.insert(
        _tableName,
        {'key': keyName, 'value': value},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      await database.update(
        _tableName,
        {'key': keyName, 'value': value},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  //Get all loaded characters
  static Future<Map<String, dynamic>?> getSavedCharacters(
      Database database) async {
    final List<Map<String, dynamic>> maps = await database.query(
      _tableName,
      where: 'key = ?',
      whereArgs: [keyName],
    );

    if (maps.isEmpty) return null;
    return jsonDecode(maps.last['value']);
  }
}
