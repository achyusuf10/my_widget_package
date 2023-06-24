import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final ShapeBorder shapeBorder;
  final Widget? child;
  final bool? isList;
  final int? itemCount;
  final double? itemHeight;
  final int? separatorHeight;
  final double aspectRatio;
  final bool isScrollable;

  const ShimmerWidget.rectangular({
    super.key,
    required this.width,
    this.aspectRatio = 1,
  })  : itemCount = 0,
        itemHeight = 0,
        separatorHeight = 0,
        child = null,
        isScrollable = false,
        shapeBorder = const RoundedRectangleBorder(),
        isList = false;

  const ShimmerWidget.circular({
    super.key,
    required this.width,
    this.aspectRatio = 1,
  })  : itemCount = 0,
        itemHeight = 0,
        separatorHeight = 0,
        child = null,
        isScrollable = false,
        shapeBorder = const CircleBorder(),
        isList = false;

  const ShimmerWidget.noShape({
    super.key,
    required this.child,
  })  : itemCount = 0,
        itemHeight = 0,
        separatorHeight = 0,
        width = 0,
        aspectRatio = 0,
        isScrollable = false,
        shapeBorder = const RoundedRectangleBorder(),
        isList = false;

  const ShimmerWidget.listItem({
    super.key,
    required this.itemCount,
    this.itemHeight = 40,
    this.separatorHeight = 10,
    this.isScrollable = false,
  })  : shapeBorder = const RoundedRectangleBorder(),
        width = 0,
        child = null,
        aspectRatio = 0,
        isList = true;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[100]!,
      child: (isList != null && isList == true)
          ? ListView.separated(
              itemCount: itemCount!,
              itemBuilder: (context, index) => Container(
                color: const Color(0xff000000).withOpacity(0.16),
                height: itemHeight!.toDouble(),
                width: double.infinity,
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: separatorHeight!.toDouble(),
              ),
              primary: isScrollable,
              shrinkWrap: true,
            )
          : (child == null)
              ? AspectRatio(
                  aspectRatio: aspectRatio,
                  child: Container(
                    width: width,
                    decoration: ShapeDecoration(
                      shape: shapeBorder,
                      color: Colors.grey[300],
                    ),
                  ),
                )
              : child!,
    );
  }
}
