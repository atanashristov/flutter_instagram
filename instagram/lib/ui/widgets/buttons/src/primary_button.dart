import 'package:flutter/material.dart';
import 'package:instagram/ui/widgets/buttons/buttons.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
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
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
