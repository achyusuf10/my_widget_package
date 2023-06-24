import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/enum.dart';
import '../custom_button.dart';

class DialogNotif extends StatelessWidget {
  final String message;
  final String positiveText;
  final String negativeText;
  final NotifType notifType;
  final Color? colorTheme;

  /// Ini untuk mengambil screenshot
  final GlobalKey? renderKey;

  /// Ini Otomatis Close Overlay
  final Function additionalOnNegativeTap;

  /// Ini Tidak Otomatis Close Overlay
  final Function()? onPositiveTap;

  final int totalButton;
  final TextStyle titleStyle;
  final TextStyle descStyle;
  final TextStyle buttonTextStyle;
  const DialogNotif({
    super.key,
    required this.message,
    required this.notifType,
    required this.additionalOnNegativeTap,
    this.colorTheme,
    required this.titleStyle,
    required this.descStyle,
    required this.buttonTextStyle,
    this.negativeText = 'Tutup',
    this.renderKey,
  })  : positiveText = '',
        onPositiveTap = null,
        totalButton = 1;

  /// Membuat Dialog Notif dengan dua button, kiri outlined, kanan tidak
  const DialogNotif.doubleButton({
    super.key,
    required this.message,
    required this.notifType,
    required this.additionalOnNegativeTap,
    this.colorTheme,
    required this.titleStyle,
    required this.descStyle,
    required this.buttonTextStyle,
    required this.onPositiveTap,
    required this.positiveText,
    this.negativeText = 'Tutup',
    this.renderKey,
  }) : totalButton = 2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      content: RepaintBoundary(
        key: renderKey,
        child: ContentWidget(
          colorTheme: colorTheme,
          notifType: notifType,
          titleStyle: titleStyle,
          message: message,
          descStyle: descStyle,
        ),
      ),
      actionsPadding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 20.h),
      actionsAlignment: MainAxisAlignment.center,
      actions: ConditionalSwitch.list<int>(
        caseBuilders: {
          0: (context) => [],
          1: (context) => [
                CustomButton(
                  width: 80.w,
                  onPressed: () {
                    additionalOnNegativeTap();
                    Navigator.pop(context);
                  },
                  bgColor: (colorTheme == null)
                      ? Theme.of(context).primaryColor
                      : colorTheme!,
                  child: Text(
                    negativeText,
                    style: buttonTextStyle.copyWith(color: Colors.white),
                  ),
                ),
              ],
          2: (context) => [
                Row(
                  children: [
                    Expanded(
                      child: CustomButton.outlined(
                        onPressed: () {
                          additionalOnNegativeTap();
                          Navigator.pop(context);
                        },
                        bgColor: Colors.white,
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                        child: Text(
                          negativeText,
                          style: buttonTextStyle.copyWith(
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: CustomButton(
                        onPressed: onPositiveTap ?? () {},
                        bgColor: Theme.of(context).primaryColor,
                        child: Text(
                          positiveText,
                          style: buttonTextStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
        },
        context: context,
        fallbackBuilder: (context) => [],
        valueBuilder: (context) => totalButton,
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key? key,
    required this.colorTheme,
    required this.notifType,
    required this.titleStyle,
    required this.message,
    required this.descStyle,
  }) : super(key: key);

  final Color? colorTheme;
  final NotifType notifType;
  final TextStyle titleStyle;
  final String message;
  final TextStyle descStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: 80,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              color: (colorTheme == null)
                  ? Theme.of(context).primaryColor
                  : colorTheme,
            ),
            child: Image.asset(
              (notifType == NotifType.success)
                  ? 'assets/images/notif_succes.png'
                  : 'assets/images/notif_failed.png',
              height: 80,
              package: 'my_widget_package',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Informasi',
            style: titleStyle.copyWith(fontSize: 18.sp),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              message,
              style: descStyle.copyWith(fontSize: 13.sp),
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
