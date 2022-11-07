import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/enum.dart';
import '../custom_button.dart';

class DialogNotif extends StatelessWidget {
  final String message;
  final NotifType notifType;
  final Color? colorTheme;
  final Function additionalOnNegativeTap;
  final TextStyle titleStyle;
  final TextStyle descStyle;
  final TextStyle closeSytyle;
  const DialogNotif({
    super.key,
    required this.message,
    required this.notifType,
    required this.additionalOnNegativeTap,
    this.colorTheme,
    required this.titleStyle,
    required this.descStyle,
    required this.closeSytyle,
  });

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
      content: Container(
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
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        CustomButton(
          width: 80,
          onPressed: () {
            additionalOnNegativeTap();
            Navigator.pop(context);
          },
          bgColor: (colorTheme == null)
              ? Theme.of(context).primaryColor
              : colorTheme!,
          child: Text(
            'Tutup',
            style: closeSytyle.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
