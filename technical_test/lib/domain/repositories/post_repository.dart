// ignore_for_file: lines_longer_than_80_chars

import 'package:dio/dio.dart';
import 'package:technical_test/datasource/local/post_local.dart';
import 'package:technical_test/datasource/remote/post_api.dart';
import 'package:technical_test/domain/model/post/post_model.dart';
import 'package:technical_test/utils/resources/misc.dart';

abstract class PostRepository {
  static Future<List<PostModel>> fetchPosts([int initialPage = 0, int numberItems = 10]) async {
    try {
      final local = LocalPostApi();

      final dio = Dio();

      final result = await PostApi(dio).getPosts();

      if (result.isEmpty) {
        throw Exception('No results');
      }

      /// Save in local cache
      await local.addPostList(result);

      return result;
    } catch (e) {
      printExcept(e);
      return [];
    }
  }

  static Future<List<PostModel>?> fetchPostsFromLocal() async {
    try {
      final local = LocalPostApi();

      /// Fetch from local cache
      final posts = await local.getPosts();

      if (posts.isNotEmpty) {
        return posts;
      }

      return null;
    } catch (e) {
      printExcept(e);
      return null;
    }
  }
}
