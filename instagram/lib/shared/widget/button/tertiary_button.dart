import 'package:flutter/material.dart';
import 'package:instagram/shared/widget/button/button.dart';

class TertiaryButton extends StatelessWidget {
  const TertiaryButton(
    this.title, {
    this.onPressed,
    this.fontSize = kDefaultButtonFontSize,
    super.key,
  });

  final String title;
  final VoidCallback? onPressed;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: fontSize,
          decoration: TextDecoration.underline,
        ),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
