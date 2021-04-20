import 'package:chopper/chopper.dart';

import 'auth_service.dart';
import 'users_service.dart';

class ChopperServiceClient {
  static ChopperClient chopperClient() {
    final chopper = ChopperClient(
      baseUrl: 'http://localhost:8080',
      services: [
        // the generated service
        UsersService.create(ChopperClient()),
        AuthService.create(ChopperClient()),
      ],
      converter: JsonConverter(),
    );
    return chopper;
  }
}
