import 'package:diginav/model/user.dart';
import 'package:floor_annotation/floor_annotation.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM users WHERE updatedAt < :lastKey LIMIT :pageSize')
  Future<List<User>> listUsers(int lastKey, int pageSize);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> addUser(User user);

  @delete
  Future<void> deleteUser(User user);

  @Query('SELECT * FROM users WHERE uuid = :uuid')
  Future<User?> getUser(String uuid);
}
