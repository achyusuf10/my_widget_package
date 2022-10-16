import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width, height;
  final ShapeBorder shapeBorder;
  final Widget? child;
  final bool? isList;
  final int? itemCount;
  final int? itemHeight;
  final int? separatorHeight;

  const ShimmerWidget.rectangular({
    Key? key,
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const RoundedRectangleBorder(),
    this.child,
    this.isList,
    this.itemCount,
    this.itemHeight,
    this.separatorHeight,
  }) : super(key: key);

  const ShimmerWidget.circular({
    Key? key,
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
    this.child,
    this.isList,
    this.itemCount,
    this.itemHeight,
    this.separatorHeight,
  }) : super(key: key);

  const ShimmerWidget.noShape({
    Key? key,
    this.width = 0,
    this.height = 0,
    this.shapeBorder = const RoundedRectangleBorder(),
    required this.child,
    this.isList,
    this.itemCount,
    this.itemHeight,
    this.separatorHeight,
  }) : super(key: key);

  const ShimmerWidget.listItem({
    Key? key,
    this.width = 0,
    this.height = 0,
    this.shapeBorder = const RoundedRectangleBorder(),
    this.child,
    this.isList = true,
    this.itemCount = 10,
    this.itemHeight = 40,
    this.separatorHeight = 10,
  }) : super(key: key);

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
              primary: false,
              shrinkWrap: true,
            )
          : (child == null)
              ? Container(
                  height: height,
                  width: width,
                  decoration: ShapeDecoration(
                    shape: shapeBorder,
                    color: Colors.grey,
                  ),
                )
              : child!,
    );
  }
}
