// ignore_for_file: require_trailing_commas, lines_longer_than_80_chars

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
// ignore_for_file: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:technical_test/actuality/bloc/post_state.dart';
import 'package:technical_test/domain/enum.dart';
import 'package:technical_test/domain/model/post/post_model.dart';
import 'package:technical_test/domain/repositories/post_repository.dart';

part 'post_event.dart';

// to avoid spamming the API unnecessarily.
const throttleDuration = Duration(milliseconds: 100);
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  PostListBloc() : super(PostListState()) {
    on<PostFetched>(_onPostFetched, transformer: throttleDroppable(throttleDuration));
    on<PostListCreated>(_onPostListCreated, transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onPostFetched(PostFetched event, Emitter<PostListState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts();
        emit(state.copyWith(status: PostStatus.success, posts: posts, hasReachedMax: false));
        return;
      }

      final posts = await _fetchPosts();
      emit(state.copyWith(status: PostStatus.success, posts: List.of(state.posts)..addAll(posts), hasReachedMax: false));
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<void> _onPostListCreated(PostListCreated event, Emitter<PostListState> emit) async {
    if (state.status != PostStatus.initial) return;

    try {
      final localPosts = await PostRepository.fetchPostsFromLocal();

      if (localPosts?.isNotEmpty ?? false) {
        emit(state.copyWith(status: PostStatus.success, posts: localPosts!, hasReachedMax: false));
        return;
      }

      final posts = <PostModel>[];

      for (var i = 0; i < 15; i++) {
        posts.addAll(await _fetchPosts());
      }

      emit(state.copyWith(status: PostStatus.success, posts: posts, hasReachedMax: false));
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<List<PostModel>> _fetchPosts() async {
    return PostRepository.fetchPosts();
  }
}
