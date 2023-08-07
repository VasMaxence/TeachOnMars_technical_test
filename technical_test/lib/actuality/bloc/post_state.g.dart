// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostListState _$$_PostListStateFromJson(Map<String, dynamic> json) =>
    _$_PostListState(
      status: $enumDecodeNullable(_$PostStatusEnumMap, json['status']) ??
          PostStatus.initial,
      posts: (json['posts'] as List<dynamic>?)
              ?.map((e) => PostModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hasReachedMax: json['hasReachedMax'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PostListStateToJson(_$_PostListState instance) =>
    <String, dynamic>{
      'status': _$PostStatusEnumMap[instance.status]!,
      'posts': instance.posts,
      'hasReachedMax': instance.hasReachedMax,
    };

const _$PostStatusEnumMap = {
  PostStatus.initial: 'initial',
  PostStatus.success: 'success',
  PostStatus.failure: 'failure',
};
