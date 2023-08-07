import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technical_test/domain/model/post/post_model.dart';
import 'package:technical_test/l10n/l10n.dart';

class ImageDetailsPage extends StatelessWidget {
  const ImageDetailsPage({
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
          l10n.postsImageTitle,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Hero(
              tag: post.id!,
              child: CachedNetworkImage(
                imageUrl: post.picture!.url!,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              post.title ?? '',
              style: theme.textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              post.author ?? '',
              style: theme.textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
