import 'package:flutter/material.dart';
import 'package:instagram/ui/constants/constants.dart';
import 'package:strings/strings.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    required this.username,
    this.bio,
    super.key,
  });

  final String username;
  final String? bio;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          username,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        if (Strings.isNotBlank(bio)) ...[
          kGapVS,
          Text(bio ?? '', style: const TextStyle(fontSize: 15)),
        ],
        const Divider(),
      ],
    );
  }
}
