// ignore_for_file: lines_longer_than_80_chars, no_default_cases

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/actuality/bloc/post_bloc.dart';
import 'package:technical_test/actuality/bloc/post_state.dart';
import 'package:technical_test/actuality/widget/post_card.dart';
import 'package:technical_test/domain/enum.dart';
import 'package:technical_test/utils/extension/widget.dart';

class ListPost extends StatefulWidget {
  const ListPost({super.key});

  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  late final ScrollController _scrollController = ScrollController()..addListener(_onScroll);

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostListBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return BlocBuilder<PostListBloc, PostListState>(
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.failure:
            return Container();

          case PostStatus.success:
            return Scrollbar(
              controller: _scrollController,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: state.hasReachedMax ? state.posts.length : state.posts.length + 1,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16).add(EdgeInsets.only(bottom: 16 + mediaQuery.padding.bottom, top: 15)),
                itemBuilder: (BuildContext context, int index) {
                  if (index >= state.posts.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
            
                  final post = state.posts[index];
            
                  return PostCard(post: post);
                },
              ),
            );

          default:
            return const CircularProgressIndicator().center();
        }
      },
    );
  }
}
