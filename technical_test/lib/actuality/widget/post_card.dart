// ignore_for_file: inference_failure_on_instance_creation

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technical_test/actuality/view/image_details.dart';
import 'package:technical_test/actuality/view/post_details.dart';
import 'package:technical_test/domain/model/post/post_model.dart';
import 'package:technical_test/l10n/l10n.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    required this.post,
    super.key,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (post.picture?.url != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageDetailsPage(post: post),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReviewDetailsPage(post: post),
            ),
          );
        }
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    if (post.picture?.url != null) {
      return Hero(
        tag: post.id!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title ?? '',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Container(
              clipBehavior: Clip.antiAlias,
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: post.picture!.url!,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                post.author ?? '',
                style: theme.textTheme.titleSmall,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title ?? '',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          Text(
            post.text ?? '',
            style: theme.textTheme.bodyMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewDetailsPage(post: post),
                ),
              );
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF2E66D4),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  l10n.seeMoreButton,
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ),
          )
        ],
      );
    }
  }
}
