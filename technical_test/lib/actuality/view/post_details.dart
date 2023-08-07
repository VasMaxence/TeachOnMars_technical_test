import 'package:flutter/material.dart';
import 'package:technical_test/domain/model/post/post_model.dart';
import 'package:technical_test/l10n/l10n.dart';

class ReviewDetailsPage extends StatelessWidget {
  const ReviewDetailsPage({
    required this.post,
    super.key,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Text(
          l10n.postsArticleTitle,
          style: theme.textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16).add(
          EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: post.id!,
              child: Text(
                post.title ?? '',
                style: theme.textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              post.text ?? '',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
