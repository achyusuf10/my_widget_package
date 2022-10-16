import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color bgColor;
  final Widget child;
  final double borderRadius;
  final double? width;
  final double? height;
  final BorderSide borderSide;
  final EdgeInsets? padding;
  const CustomButton({
    required this.onPressed,
    required this.bgColor,
    required this.child,
    this.borderRadius = 8,
    this.borderSide = BorderSide.none,
    Key? key,
    this.width,
    this.height,
    this.padding,
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
        backgroundColor: bgColor,
        foregroundColor: Colors.black,
        minimumSize: Size(width ?? double.infinity, height ?? 48.h),
      ),
      child: child,
    );
  }
}
