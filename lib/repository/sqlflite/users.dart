import 'dart:async';

import 'package:diginav/model/user.dart';
import 'package:diginav/repository/i_user_repository.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

class UserDao implements IUserRepository {
  final Future<Database?>? db;
  const UserDao({@required this.db});

  Future<void> addUser({required User user}) async {
    var _db = await this.db;
    _db?.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> addUsers(List<User> users) async {
    var _db = await this.db;
    Batch? batch = _db?.batch();
    //TODO find way to do this with just one insert query

    for (var user in users) {
      batch!.insert(
        'users',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch?.commit();
  }

  Future<List<User>> listUsers(
      {required int page,
      required int pageSize,
      required DateTime lastKey}) async {
    final List<Map<String, dynamic?>>? maps;

    var _db = await this.db;
    maps = await _db?.query('users',
        where: "updated_at",
        whereArgs: [lastKey.millisecondsSinceEpoch],
        limit: pageSize);

    return List.generate(maps!.length, (i) {
      final userMap = maps![i];
      return User.fromMap(userMap);
    });
  }

  Future<void> updateUser(User user) async {
    var _db = await this.db;
    await _db?.update(
      'users',
      user.toMap(),
      where: "uuid = ?",
      whereArgs: [user.uuid],
    );
  }

  Future<User> getUser({required String id}) async {
    var _db = await this.db;
    final maps = await _db?.query(
      'users',
      where: "uuid = ?",
      whereArgs: [id],
    );

    final users = List.generate(
      maps!.length,
      (i) {
        final user = maps[i];
        return User.fromMap(user);
      },
    );
    return users.single;
  }

  @override
  Future<void> deleteUser({required String id}) async {
    var _db = await this.db;
    await _db?.delete('users', where: "uuid = ?", whereArgs: [id]);
  }
}
