import 'package:flutter/material.dart';

class CleanDigitalToasts {
  final BuildContext context;

  CleanDigitalToasts.of(this.context);

  SnackBar _buildSnackBar({
    required String message,
    Widget? icon,
    SnackBarAction? action,
    Color? backgroundColor,
  }) {
    return SnackBar(
      backgroundColor: backgroundColor,
      action: action,
      dismissDirection: DismissDirection.endToStart,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      elevation: 8,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          if (icon != null) ...[
            icon,
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              message,
            ),
          ),
        ],
      ),
    );
  }

  void showSuccess({
    required String message,
  }) {
    final snackBar = _buildSnackBar(
      icon: Icon(
        Icons.check_circle_rounded,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      message: message,
      backgroundColor: Theme.of(context).colorScheme.secondary,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showError({
    required String message,
  }) {
    final snackBar = _buildSnackBar(
      icon: Icon(
        Icons.error,
        color: Theme.of(context).colorScheme.onError,
      ),
      message: message,
      backgroundColor: Theme.of(context).colorScheme.error,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
