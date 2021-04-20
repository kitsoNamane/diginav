import 'dart:async';

import 'package:diginav/model/user.dart';
import 'package:floor/floor.dart';
import 'package:floor_annotation/floor_annotation.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'type_converters.dart';
import 'user_dao.dart';


part 'db.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 2, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
