import 'package:diginav/model/user.dart';

abstract class IUserRepository {
  Future<void> addUser({required User user});

  Future<void> addUsers(List<User> users);

  Future<User> getUser({required String id});

  Future<List<User>> listUsers(
      {required int page, required int pageSize, required DateTime lastKey});

  Future<void> deleteUser({required String id});
}
