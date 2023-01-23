import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'components/close_button.dart';
import 'components/main_content.dart';

class SignInDialogContent extends StatelessWidget {
  final DialogRequest request;
  final DialogService service;
  final void Function(bool) updateIsShown;
  final bool isLoadingShown;

  const SignInDialogContent({
    Key? key,
    required this.request,
    required this.service,
    required this.updateIsShown,
    required this.isLoadingShown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 650),
        MainContent(
          formKey: request.data.formKey,
          emptyValidation: request.data.emptyValidation,
          updateIsShown: updateIsShown,
          isLoadingShown: isLoadingShown,
          redirect: request.data.redirect,
        ),
        AppCloseButton(
          onPressed: () =>
              service.completeDialog(DialogResponse(confirmed: false)),
        ),
      ],
    );
  }
}
