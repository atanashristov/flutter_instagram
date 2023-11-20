import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:instagram/app/l10n/l10n.dart';
import 'package:instagram/ui/features/profile_edit/view/profile_edit_screen.dart';
import 'package:instagram/ui/widgets/buttons/buttons.dart';

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
            onPressed: () => Navigator.of(context).pushNamed(
              ProfileEditScreen.routeName,
              arguments: ProfileEditScreenArgs(context: context),
            ),
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
