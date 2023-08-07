import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:technical_test/domain/model/post/post_model.dart';

part 'post_api.g.dart';

@RestApi(baseUrl: 'https://interview-dev.teachonmars.com/interview-api.php')
abstract class PostApi {
  factory PostApi(Dio dio, {String baseUrl}) = _PostApi;

  @GET('')
  Future<List<PostModel>> getPosts();
}
