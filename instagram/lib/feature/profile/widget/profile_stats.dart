// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:instagram/app/l10n/l10n.dart';
import 'package:instagram/feature/profile/widget/profile_button.dart';
import 'package:instagram/shared/constants/constants.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({
    required this.isCurrentUser,
    required this.isFollowing,
    required this.posts,
    required this.followers,
    required this.following,
    super.key,
  });

  final bool isCurrentUser;
  final bool isFollowing;
  final int posts;
  final int followers;
  final int following;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Stats(count: posts, label: context.l10n.countOfPostsLabel),
              _Stats(count: followers, label: context.l10n.countOfFollowersLabel),
              _Stats(count: following, label: context.l10n.countOfFollowingLabel),
            ],
          ),
          kSpacerVerticalS,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ProfileButton(
              isCurrentUser: isCurrentUser,
              isFollowing: isFollowing,
            ),
          ),
        ],
      ),
    );
  }
}

class _Stats extends StatelessWidget {
  const _Stats({
    required this.count,
    required this.label,
  });

  final int count;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}
