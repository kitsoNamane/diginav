import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database?> initDB() async {
   final database = openDatabase(join(await getDatabasesPath(), 'diginav.db'),
    onCreate: (db, version) {
    return db.execute(
      '''CREATE TABLE IF NOT EXISTS users(
          uuid TEXT PRIMARY KEY,
          email TEXT,
          first_name TEXT,
          middle_name TEXT,
          refresh_token TEXT,
          last_name TEXT,
          birthday INTEGER,
          role TEXT,
          phone TEXT,
          updated_at INT
      )''',
    );
  }, version: 1);
  return database;
}


