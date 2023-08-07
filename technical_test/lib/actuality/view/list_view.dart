import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/actuality/bloc/post_bloc.dart';
import 'package:technical_test/actuality/view/list.dart';
import 'package:technical_test/l10n/l10n.dart';

class ActualityListView extends StatefulWidget {
  const ActualityListView({super.key});

  @override
  State<ActualityListView> createState() => _ActualityListViewState();
}

class _ActualityListViewState extends State<ActualityListView> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          l10n.postsListAppBarTitle,
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: BlocProvider(
        create: (context) => PostListBloc()..add(PostListCreated()),
        child: const ListPost(),
      ),
    );
  }
}
