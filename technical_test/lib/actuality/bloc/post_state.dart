import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:technical_test/domain/enum.dart';
import 'package:technical_test/domain/model/post/post_model.dart';

part 'post_state.freezed.dart';
part 'post_state.g.dart';

@freezed
class PostListState with _$PostListState {
  factory PostListState({
    @Default(PostStatus.initial) PostStatus status,
    @Default([]) List<PostModel> posts,
    @Default(false) bool hasReachedMax,
  }) = _PostListState;

  factory PostListState.fromJson(Map<String, dynamic> json) => _$PostListStateFromJson(json);
}
