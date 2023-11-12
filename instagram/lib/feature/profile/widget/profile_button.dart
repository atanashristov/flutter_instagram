import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:instagram/app/l10n/l10n.dart';
import 'package:instagram/shared/widget/widget.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    required this.isCurrentUser,
    required this.isFollowing,
    super.key,
  });

  final bool isCurrentUser;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return isCurrentUser
        ? PrimaryButton(
            context.l10n.editProfileButtonTitle,
            fontSize: 16,
            onPressed: () => log('Edit profile'),
          )
        : isFollowing
            ? SecondaryButton(
                context.l10n.unfollowProfileButtonTitle,
                fontSize: 16,
                onPressed: () => log('Unfollow'),
              )
            : PrimaryButton(
                context.l10n.followProfileButtonTitle,
                fontSize: 16,
                onPressed: () => log('Follow profile'),
              );
  }
}
