import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogChoice extends StatelessWidget {
  final String title;
  final String desc;
  final String positiveBtnText;
  final String negativeBtnText;
  final Function() onTapPositiveBtn;
  final Function()? onTapNegativeBtn;
  final TextStyle titleStyle;
  final TextStyle descStyle;
  final TextStyle negativeStyle;
  final TextStyle positiveStyle;
  final Color buttonColor;
  const DialogChoice({
    required this.title,
    required this.desc,
    this.positiveBtnText = 'Ya',
    this.negativeBtnText = 'Tidak',
    required this.onTapPositiveBtn,
    this.onTapNegativeBtn,
    Key? key,
    required this.titleStyle,
    required this.descStyle,
    required this.negativeStyle,
    required this.positiveStyle,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      title: Text(
        title,
        style: titleStyle.copyWith(fontSize: 18.sp),
      ),
      content: Text(
        desc,
        style: descStyle.copyWith(
          fontSize: 13.sp,
          color: const Color(0xff828282),
        ),
      ),
      actions: <Widget>[
        SizedBox(
          height: 36,
          child: ElevatedButton(
            onPressed: (onTapNegativeBtn != null)
                ? onTapNegativeBtn
                : () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: buttonColor),
              ),
              backgroundColor: Colors.white,
            ),
            child: Text(
              negativeBtnText,
              style: negativeStyle.copyWith(fontSize: 13.sp),
            ),
          ),
        ),
        SizedBox(
          height: 36,
          child: ElevatedButton(
            onPressed: onTapPositiveBtn,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: buttonColor,
            ),
            child: Text(
              positiveBtnText,
              style: positiveStyle.copyWith(
                fontSize: 13.sp,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
