import 'package:flutter/material.dart';

@Deprecated("Do not use custom validator. Validate with regex coming from component response")
class BrgValidator {
  final int tcknLength;

  @Deprecated("Do not use custom validator. Validate with regex coming from component response")
  BrgValidator({this.tcknLength = 11});

  final _emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final _phoneNumberLength = 10;

  FormFieldValidator<String> email({String errorMessage = ""}) =>
      (input) => _emailRegex.hasMatch(input ?? "") ? null : errorMessage;

  FormFieldValidator<String> tckn({String errorMessage = ""}) =>
      (input) => (input?.length ?? 0) < tcknLength ? errorMessage : null;

  FormFieldValidator<String> phoneNumber({String errorMessage = ""}) =>
      (input) => (input?.length ?? 0) < _phoneNumberLength ? errorMessage : null;

  FormFieldValidator<String> minLength({required int minLength, required String errorMessage}) =>
      (input) => (input?.length ?? 0) < minLength ? errorMessage : null;
}
