import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_widget_package/widgets/shimmer_widget.dart';

class CustomBoxImage extends StatelessWidget {
  final Color? bgColor;
  final VoidCallback? onTap;
  final TextStyle labelStyle;
  final File? image;
  final String label;
  final Icon? iconNoImage;
  final String? urlImage;
  final double? width;
  final double aspectRatio;
  final double sizeIconError;
  final BoxBorder? boxBorder;

  final double borderRadius;

  const CustomBoxImage.buildChooseImage({
    Key? key,
    required this.onTap,
    required this.image,
    this.label = 'Tambahkan Foto',
    this.urlImage,
    this.width,

    /// Default 16/9
    this.aspectRatio = 16 / 9,

    /// Default 64
    this.sizeIconError = 64,
    required this.labelStyle,

    /// Default Menggunakan Theme Color
    this.bgColor,
    this.iconNoImage,
    this.boxBorder,

    /// Masukkan langsung angkanya saja, karena sudah dipakaikan screen util
    this.borderRadius = 8,
  }) : super(key: key);

  const CustomBoxImage.buildThumbnail({
    super.key,
    required this.urlImage,
    required this.width,
    required this.aspectRatio,

    /// Masukkan langsung angkanya saja, karena sudah dipakaikan screen util
    this.borderRadius = 8,

    /// Default 64
    this.sizeIconError = 64,
    this.label = 'No Image',
    required this.labelStyle,

    /// Default Menggunakan Theme Color
    this.bgColor,
    this.iconNoImage,
    this.boxBorder,
  })  : onTap = null,
        image = null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor ?? Theme.of(context).primaryColor.withOpacity(0.04),
          borderRadius: BorderRadius.circular(borderRadius.r),
          border: boxBorder,
        ),
        width: width ?? double.infinity,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: (image != null)
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius.r),
                  child: Image.file(
                    image!,
                    width: width ?? double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return errorNoImage(context);
                    },
                  ),
                )
              : (urlImage == null || urlImage == '')
                  ? errorNoImage(context)
                  : CachedNetworkImage(
                      width: width ?? double.infinity,
                      imageUrl: urlImage ?? '',
                      placeholder: (context, url) => ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ShimmerWidget.rectangular(
                          width: width ?? double.infinity,
                        ),
                      ),
                      imageBuilder: (context, imageProvider) => Container(
                        width: width ?? double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: width ?? double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[500]!,
                        ),
                        child: Icon(
                          Icons.error,
                          size: sizeIconError,
                          color: Colors.black,
                        ),
                      ),
                    ),
        ),
      ),
    );
  }

  Column errorNoImage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        iconNoImage ??
            Icon(
              Icons.photo_camera,
              color: Theme.of(context).primaryColor.withOpacity(0.6),
              size: sizeIconError,
            ),
        (label.isEmpty)
            ? const SizedBox()
            : Text(
                label,
                style: labelStyle,
              )
      ],
    );
  }
}
