import 'package:chopper/chopper.dart';

//@ChopperApi(baseUrl: 'https://jsonplaceholder.typicode.com/posts')
@ChopperApi(baseUrl: '/posts')
abstract class ChopperTestAPIService extends ChopperService {
  @Get()
  Future<Response> getPosts();

  @Get(path: "/{id}")
  Future<Response> getPost();

  @Post()
  Future<Response> addPost(
    @Body() Map<String, dynamic> body,
  );
}
