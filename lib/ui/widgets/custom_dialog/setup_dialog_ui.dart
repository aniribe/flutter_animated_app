import 'package:animated_app/consts/app_colors.dart';
import 'package:animated_app/consts/app_image.dart';
import 'package:animated_app/ui/ui_helpers.dart';
import 'package:animated_app/ui/widgets/custom_dialog/sign_in_content/sign_in_dialog_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../config/app.locator.dart';
import '../../../consts/string_consts.dart';
import '../signin_form.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.signInForm: (context, sheetRequest, completer) =>
        _SignInDialog(request: sheetRequest, service: dialogService),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _SignInDialog extends StatelessWidget {
  final DialogRequest request;
  final DialogService service;

  const _SignInDialog({
    Key? key,
    required this.request,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      backgroundColor: Colors.transparent,
      child: SignInDialogContent(request: request, service: service),
    );
  }
}

/// The type of dialog to show
enum DialogType { signInForm }
