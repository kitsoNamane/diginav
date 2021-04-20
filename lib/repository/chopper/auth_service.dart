import 'dart:async';
import 'package:chopper/chopper.dart';

part 'auth_service.chopper.dart';

@ChopperApi(baseUrl: '/api/auth')
abstract class AuthService extends ChopperService {
  static AuthService create(ChopperClient client) => _$AuthService(client);

  @Post(path: '/authenticate')
  Future<Response> emailLogin(
    @Field('email') String email,
    @Field('password') String password,
  );

  @Post(path: '/refresh')
  Future<Response> refreshToken(
    @Field('x-auth-token') String authToken,
    @Field('x-refresh-token') String refreshToken,
  );
}
