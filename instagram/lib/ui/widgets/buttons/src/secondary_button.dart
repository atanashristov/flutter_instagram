import 'package:flutter/material.dart';
import 'package:instagram/ui/widgets/buttons/buttons.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: fontSize),
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.black,
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
