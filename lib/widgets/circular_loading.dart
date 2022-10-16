import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  final double? diameter;
  final double? strokeWidth;
  final Color? customColor;
  const CircularLoading({
    this.diameter,
    Key? key,
    this.strokeWidth,
    this.customColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (diameter == null)
          ? circularProgressIndicator()
          : SizedBox(
              height: diameter,
              width: diameter,
              child: circularProgressIndicator(),
            ),
    );
  }

  Widget circularProgressIndicator() {
    return CircularProgressIndicator(
      strokeWidth: (strokeWidth == null) ? 6 : strokeWidth!,
      color: customColor ?? const Color.fromARGB(255, 54, 165, 255),
    );
  }
}
