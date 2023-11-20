import 'package:flutter/material.dart';
import 'package:instagram/app/l10n/l10n.dart';
import 'package:instagram/ui/constants/constants.dart';
import 'package:instagram/ui/features/profile/widgets/profile_button.dart';

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
          kGapVS,
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
