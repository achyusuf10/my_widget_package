import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obs;
  final bool needValidate;
  final String hintText;
  final String? errorMessage;
  final Widget? prefix;
  final int? maxLines;
  final bool readOnly;
  final TextInputType keyboardType;
  final bool showError;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final int? maxLength;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget? suffix;
  final AutovalidateMode? autovalidateMode;
  final bool isVersionTwo;
  final VoidCallback? onTap;
  final String? prefixText;
  final bool useLabel;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? hintStyle;
  final TextStyle? floatingLabelStyle;
  final Color? fillColor;
  final bool useBoxShadow;
  final BorderSide borderSide;
  final double? borderRadius;
  final int minLines;

  const CustomTextFormField({
    this.needValidate = true,
    this.errorMessage = 'Harus terisi',
    Key? key,
    this.obs = false,
    required this.controller,
    required this.hintText,
    this.prefix,
    this.readOnly = false,
    this.maxLines = 1,
    this.showError = false,
    this.enabled = true,
    this.inputFormatters = const [],
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.validator,
    this.suffix,
    this.onChanged,
    this.autovalidateMode,
    this.isVersionTwo = false,
    this.onTap,
    this.prefixText,
    this.useLabel = true,
    this.contentPadding,
    this.textStyle,
    this.labelStyle,
    this.errorStyle,
    this.hintStyle,
    this.floatingLabelStyle,
    this.fillColor,
    this.useBoxShadow = true,
    this.borderRadius,
    this.minLines = 1,
  })  : borderSide = BorderSide.none,
        super(key: key);

  const CustomTextFormField.outlined({
    this.needValidate = true,
    this.errorMessage = 'Harus terisi',
    Key? key,
    this.obs = false,
    required this.controller,
    required this.hintText,
    this.prefix,
    this.readOnly = false,
    this.maxLines = 1,
    this.showError = false,
    this.enabled = true,
    this.inputFormatters = const [],
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.validator,
    this.suffix,
    this.onChanged,
    this.autovalidateMode,
    this.isVersionTwo = false,
    this.onTap,
    this.prefixText,
    this.useLabel = true,
    this.contentPadding,
    this.textStyle,
    this.labelStyle,
    this.errorStyle,
    this.hintStyle,
    this.floatingLabelStyle,
    this.fillColor,
    this.useBoxShadow = true,
    required this.borderSide,
    this.borderRadius,
    this.minLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      minLines: minLines,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      maxLength: (maxLength != null) ? maxLength : null,
      cursorColor: Theme.of(context).focusColor,
      keyboardType: keyboardType,
      controller: controller,
      style: textStyle?.copyWith(fontSize: 13.sp),
      maxLines: maxLines,
      enabled: enabled,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: fillColor == null ? false : true,
        labelText: (useLabel) ? hintText : null,
        labelStyle: (labelStyle == null)
            ? Theme.of(context).inputDecorationTheme.labelStyle
            : labelStyle,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 8.r),
          ),
          borderSide: const BorderSide(color: Colors.red),
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
        border: DecoratedInputBorder(
          child: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 8.r),
            ),
            borderSide: borderSide,
          ),
          shadow: BoxShadow(
              color: Colors.black.withOpacity((useBoxShadow) ? 0.3 : 0),
              blurRadius: (useBoxShadow) ? 3 : 0,
              offset: (useBoxShadow) ? const Offset(0, 2) : const Offset(0, 0),
              spreadRadius: (useBoxShadow) ? 0.5 : 0),
        ),
        hintText: hintText,
        hintStyle: (hintStyle == null)
            ? Theme.of(context).inputDecorationTheme.hintStyle
            : hintStyle,
        floatingLabelStyle: (floatingLabelStyle == null)
            ? Theme.of(context).inputDecorationTheme.floatingLabelStyle
            : floatingLabelStyle,
        isDense: true,
        errorStyle: (errorStyle == null)
            ? Theme.of(context).inputDecorationTheme.errorStyle
            : errorStyle?.copyWith(color: Colors.red),
        contentPadding: contentPadding ?? const EdgeInsets.all(18),
      ),
      obscureText: obs,
      onChanged: onChanged,
      validator: (needValidate)
          ? validator ??
              (value) {
                if (value!.isNotEmpty) return null;
                return errorMessage;
              }
          : null,
      readOnly: readOnly,
    );
  }
}

class DecoratedInputBorder extends InputBorder {
  DecoratedInputBorder({
    required this.child,
    required this.shadow,
  }) : super(borderSide: child.borderSide);

  final InputBorder child;

  final BoxShadow shadow;

  @override
  bool get isOutline => child.isOutline;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      child.getInnerPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      child.getOuterPath(rect, textDirection: textDirection);

  @override
  EdgeInsetsGeometry get dimensions => child.dimensions;

  @override
  InputBorder copyWith(
      {BorderSide? borderSide,
      InputBorder? child,
      BoxShadow? shadow,
      bool? isOutline}) {
    return DecoratedInputBorder(
      child: (child ?? this.child).copyWith(borderSide: borderSide),
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  ShapeBorder scale(double t) {
    final scalledChild = child.scale(t);

    return DecoratedInputBorder(
      child: scalledChild is InputBorder ? scalledChild : child,
      shadow: BoxShadow.lerp(null, shadow, t)!,
    );
  }

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection? textDirection}) {
    final clipPath = Path()
      ..addRect(const Rect.fromLTWH(-5000, -5000, 10000, 10000))
      ..addPath(getInnerPath(rect), Offset.zero)
      ..fillType = PathFillType.evenOdd;
    canvas.clipPath(clipPath);

    final Paint paint = shadow.toPaint();
    final Rect bounds = rect.shift(shadow.offset).inflate(shadow.spreadRadius);

    canvas.drawPath(getOuterPath(bounds), paint);

    child.paint(canvas, rect,
        gapStart: gapStart,
        gapExtent: gapExtent,
        gapPercentage: gapPercentage,
        textDirection: textDirection);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is DecoratedInputBorder &&
        other.borderSide == borderSide &&
        other.child == child &&
        other.shadow == shadow;
  }

  @override
  int get hashCode => Object.hash(borderSide, child, shadow);

  @override
  String toString() {
    return '${objectRuntimeType(this, 'DecoratedInputBorder')}($borderSide, $shadow, $child)';
  }
}
