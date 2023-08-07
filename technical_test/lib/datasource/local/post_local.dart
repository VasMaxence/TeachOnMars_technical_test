// ignore_for_file: inference_failure_on_function_invocation

import 'package:hive/hive.dart';
import 'package:technical_test/domain/model/post/post_model.dart';

class LocalPostApi {
  LocalPostApi();

  final database = Hive.box('posts');

  Future<void> savePosts(List<PostModel> posts) async {
    await database.addAll(posts);
  }

  Future<void> addPostList(List<PostModel> posts) async {
    // Check if post already exists
    final existingPosts = await getPosts();

    for (final post in posts) {
      if (existingPosts.contains(post)) {
        continue;
      }
      await database.add(post);
    }
  }

  Future<void> deletePost(PostModel post) async {
    await database.delete(post.id);
  }

  Future<void> deleteAllPosts() async {
    await database.clear();
  }

  Future<List<PostModel>> getPosts() async {
    return database.values.map((e) => e as PostModel).toList();
  }
}
