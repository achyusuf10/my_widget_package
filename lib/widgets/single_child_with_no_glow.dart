import 'package:flutter/material.dart';
import 'package:my_widget_package/helper/no_scroll_glow_behavior.dart';

class NoGlowSingleChildScrollView extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget child;

  /// Membuat Single Child Scroll View tanpa glow
  const NoGlowSingleChildScrollView(
      {super.key, required this.child, this.padding});
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoScrollGlowBehavior(),
      child: SingleChildScrollView(
        padding: padding,
        child: child,
      ),
    );
  }
}
