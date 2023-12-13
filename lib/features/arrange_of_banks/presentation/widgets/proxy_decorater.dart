import 'package:flutter/material.dart';

Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
  return AnimatedBuilder(
    animation: animation,
    builder: (BuildContext context, Widget? child) {
      return Material(
        elevation: 5.0 * animation.value,
        color: Colors.white.withOpacity(0.5 * animation.value),
        child: child,
      );
    },
    child: child,
  );
}
