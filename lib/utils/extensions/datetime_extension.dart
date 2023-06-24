part of 'extension.dart';

extension DateTimeExtension on DateTime {
  String toFormattedString(String format) {
    return DateFormat(format).format(this);
  }

  String toTimeString() {
    return DateFormat("HH:mm").format(this);
  }
}
