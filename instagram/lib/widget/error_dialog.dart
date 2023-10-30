import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/l10n/l10n.dart';
import 'package:instagram/widget/tertiary_button.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    this.title,
    this.message,
    super.key,
  });

  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final dialogTitle = title ?? context.l10n.errorDialogTitle;
    final dialogMessage = message ?? context.l10n.errorDialogDefaultMessage;

    return Platform.isIOS
        ? _showIOSDialog(context, dialogTitle, dialogMessage)
        : _showMaterialDialog(context, dialogTitle, dialogMessage);
  }

  CupertinoAlertDialog _showIOSDialog(
    BuildContext context,
    String title,
    String message,
  ) =>
      CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.l10n.okButtonTitle),
          ),
        ],
      );

  AlertDialog _showMaterialDialog(
    BuildContext context,
    String title,
    String message,
  ) =>
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TertiaryButton(
            onPressed: () => Navigator.of(context).pop(),
            title: context.l10n.okButtonTitle,
          ),
        ],
      );
}
