import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final Color? bgColor;
  final Widget child;
  final double borderRadius;

  /// Minimum Width
  final double? width;

  /// Minimum height
  final double? height;
  final BorderSide borderSide;
  final EdgeInsets? padding;
  final MaterialTapTargetSize? materialTapTargetSize;
  const CustomButton({
    required this.onPressed,
    this.bgColor,
    required this.child,
    this.borderRadius = 8,
    Key? key,
    this.width,
    this.height,
    this.padding,
    this.materialTapTargetSize = MaterialTapTargetSize.shrinkWrap,
  })  : borderSide = BorderSide.none,
        super(key: key);

  const CustomButton.outlined({
    required this.onPressed,
    this.bgColor,
    required this.child,
    this.borderRadius = 8,
    Key? key,
    this.width,
    this.height,
    this.padding,
    this.materialTapTargetSize = MaterialTapTargetSize.shrinkWrap,
    required this.borderSide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: borderSide,
        ),
        backgroundColor: bgColor ?? Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        minimumSize: Size(width ?? double.infinity, height ?? 48.h),
        tapTargetSize: materialTapTargetSize,
      ),
      child: child,
    );
  }
}
