import 'package:flutter/services.dart';

@Deprecated("Do not use global input formatters. Instead, get input formatter parameters from component response")
class BrgInputFormatters {
  @Deprecated("")
  BrgInputFormatters._();

  static final _allowOnlyNumbers = FilteringTextInputFormatter.allow(RegExp('[0-9]'));

  static List<TextInputFormatter> onlyNumbers() => [_allowOnlyNumbers];
}
