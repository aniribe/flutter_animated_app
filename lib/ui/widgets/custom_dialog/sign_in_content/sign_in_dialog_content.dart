import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'components/close_button.dart';
import 'components/main_content.dart';

class SignInDialogContent extends StatelessWidget {
  final DialogRequest request;
  final DialogService service;

  const SignInDialogContent({
    Key? key,
    required this.request,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 635),
        const MainContent(),
        AppCloseButton(
          onPressed: () =>
              service.completeDialog(DialogResponse(confirmed: false)),
        ),
      ],
    );
  }
}
