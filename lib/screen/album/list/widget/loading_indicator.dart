import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final ValueListenable<bool> showLoadingIndicatorListenable;

  const LoadingIndicator({
    Key? key,
    required this.showLoadingIndicatorListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      child: const Center(child: CircularProgressIndicator()),
      valueListenable: showLoadingIndicatorListenable,
      builder: (context, show, child) {
        return Visibility(visible: show, child: child!);
      },
    );
  }
}
