import 'package:flutter/material.dart';

import 'loading_indicator.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Widget titleWidget;
  final bool fullWidth;
  final bool isLoading;
  final VoidCallback? onPressed;
  final bool _isWidgetTitle;
  final bool isOutlined;

  const PrimaryButton({
    Key? key,
    required this.title,
    this.fullWidth = true,
    this.isLoading = false,
    this.isOutlined = false,
    this.onPressed,
  })  : titleWidget = const SizedBox.shrink(),
        _isWidgetTitle = false,
        super(key: key);

  const PrimaryButton.custom({
    Key? key,
    required this.titleWidget,
    this.fullWidth = true,
    this.isLoading = false,
    this.isOutlined = false,
    this.onPressed,
  })  : title = '',
        _isWidgetTitle = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: isOutlined
          ? OutlinedButton(
              onPressed: isLoading ? null : onPressed,
              child: isLoading
                  ? const LoadingIndicator()
                  : _isWidgetTitle
                      ? titleWidget
                      : Text(title),
            )
          : ElevatedButton(
              onPressed: isLoading ? null : onPressed,
              child: isLoading
                  ? const LoadingIndicator()
                  : _isWidgetTitle
                      ? titleWidget
                      : Text(title),
            ),
    );
  }
}
