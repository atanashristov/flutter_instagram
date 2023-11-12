import 'package:strings/strings.dart';

extension StringExtension on String? {
  bool isEqualTo(String? str) => Strings.compareTo(this, str) == 0;
}
