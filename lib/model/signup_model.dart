import 'package:flutter/cupertino.dart';

class SignUpModel {
  final GlobalKey<FormState> formKey;
  final String? Function(String) emptyValidation;
  bool isLoadingShown;
  final void Function(bool) updateIsModalShown;

  SignUpModel({
    required this.formKey,
    required this.emptyValidation,
    this.isLoadingShown = false,
    required this.updateIsModalShown,
  });
}
