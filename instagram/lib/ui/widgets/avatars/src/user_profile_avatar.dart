import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({
    required this.radius,
    super.key,
    this.profileImageUrl,
    this.profileImage,
  });

  final double radius;
  final String? profileImageUrl;
  final File? profileImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey.shade200,
      backgroundImage: profileImage != null
          ? Image.file(profileImage!).image
          : Strings.isNotBlank(profileImageUrl)
              ? CachedNetworkImageProvider(profileImageUrl!)
              : null,
      child: _noProfileIcon(),
    );
  }

  Icon? _noProfileIcon() {
    if (profileImage == null && Strings.isBlank(profileImageUrl)) {
      return Icon(
        Icons.account_circle,
        color: Colors.grey.shade400,
        size: radius * 2,
      );
    }
    return null;
  }
}
