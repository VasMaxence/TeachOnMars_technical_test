part of 'post_bloc.dart';

abstract class PostListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetched extends PostListEvent {}

class PostListCreated extends PostListEvent {}
