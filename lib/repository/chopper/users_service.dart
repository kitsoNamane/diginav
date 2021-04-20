import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:diginav/model/user.dart';

part 'users_service.chopper.dart';

@ChopperApi(baseUrl: '/api/users')
abstract class UsersService extends ChopperService {
  static UsersService create(ChopperClient client) => _$UsersService(client);

  // find a way to add auth headers headers
  @Get(path: '/fetch_all')
  Future<Response<List<User>>> listUsers(
    @Query('page_size') String pageSize,
    @Query('last_key') String lastKey,
  );
}
