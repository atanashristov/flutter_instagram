import 'package:flutter/material.dart';

class TertiaryButton extends StatelessWidget {
  const TertiaryButton({
    required this.title,
    this.onPressed,
    super.key,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 20,
          decoration: TextDecoration.underline,
        ),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
