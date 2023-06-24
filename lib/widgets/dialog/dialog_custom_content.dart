import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_widget_package/widgets/custom_button.dart';

class DialogCustomContent extends StatelessWidget {
  final Widget contentWidget;
  final String title;
  final String positiveText;
  final String negativeText;
  final Color? colorTheme;
  final String buttonType;

  /// Ini Otomatis Close Overlay
  final Function()? additionalOnNegativeTap;

  /// Ini Tidak Otomatis Close Overlay
  final Function()? onPositiveTap;
  final TextStyle titleStyle;
  final TextStyle buttonTextStyle;
  final EdgeInsets? actionsPadding;
  final EdgeInsets? contentPadding;

  const DialogCustomContent.doubleButton({
    Key? key,
    this.additionalOnNegativeTap,
    required this.contentWidget,
    required this.title,
    required this.onPositiveTap,
    required this.positiveText,
    required this.negativeText,
    required this.titleStyle,
    required this.buttonTextStyle,
    this.colorTheme,
    this.actionsPadding = const EdgeInsets.fromLTRB(16, 10, 16, 20),
    this.contentPadding = const EdgeInsets.fromLTRB(16, 16, 16, 2),
  })  : buttonType = 'double-button',
        super(key: key);

  const DialogCustomContent.singleButton({
    Key? key,
    this.additionalOnNegativeTap,
    required this.contentWidget,
    required this.title,
    required this.negativeText,
    required this.titleStyle,
    required this.buttonTextStyle,
    this.colorTheme,
    this.actionsPadding = const EdgeInsets.fromLTRB(16, 10, 16, 20),
    this.contentPadding = const EdgeInsets.fromLTRB(16, 16, 16, 2),
  })  : onPositiveTap = null,
        buttonType = 'single-button',
        positiveText = '',
        super(key: key);

  const DialogCustomContent.noButton({
    Key? key,
    required this.contentWidget,
    required this.title,
    required this.titleStyle,
    this.colorTheme,
    this.actionsPadding = const EdgeInsets.fromLTRB(16, 10, 16, 20),
    this.contentPadding = const EdgeInsets.fromLTRB(16, 16, 16, 2),
  })  : additionalOnNegativeTap = null,
        buttonType = 'no-button',
        negativeText = '',
        buttonTextStyle = const TextStyle(),
        onPositiveTap = null,
        positiveText = '',
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      contentPadding: contentPadding,
      title: Text(
        title,
        style: titleStyle,
        textAlign: TextAlign.center,
      ),
      content: contentWidget,
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: actionsPadding,
      actions: (buttonType == 'no-button')
          ? []
          : [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: buttonType == 'double-button',
                    replacement: CustomButton(
                      width: 80.w,
                      onPressed: () {
                        additionalOnNegativeTap;
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
                    child: Expanded(
                      child: CustomButton.outlined(
                        onPressed: () {
                          additionalOnNegativeTap;
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
                  ),
                  Visibility(
                    visible: buttonType == 'double-button',
                    child: SizedBox(
                      width: 10.w,
                    ),
                  ),
                  Visibility(
                    visible: buttonType == 'double-button',
                    child: Expanded(
                      child: CustomButton(
                        onPressed: onPositiveTap ?? () {},
                        bgColor: Theme.of(context).primaryColor,
                        child: Text(
                          positiveText,
                          style: buttonTextStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
    );
  }
}
