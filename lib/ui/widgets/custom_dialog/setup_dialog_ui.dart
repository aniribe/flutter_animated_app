import 'package:animated_app/ui/widgets/custom_dialog/sign_in_content/sign_in_dialog_content.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../config/app.locator.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.signInForm: (context, sheetRequest, completer) =>
        _SignInDialog(request: sheetRequest, service: dialogService),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _SignInDialog extends StatefulWidget {
  final DialogRequest request;
  final DialogService service;

  const _SignInDialog({
    Key? key,
    required this.request,
    required this.service,
  }) : super(key: key);

  @override
  State<_SignInDialog> createState() => _SignInDialogState();
}

class _SignInDialogState extends State<_SignInDialog>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(0.0, -2),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller as AnimationController,
      curve: Curves.decelerate,
    ));
    _controller?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: SlideTransition(
        position: _animation as Animation<Offset>,
        child: AnimatedContainer(
          height: 675,
          width: 500,
          duration: const Duration(seconds: 2),
          child: SignInDialogContent(
              request: widget.request,
              service: widget.service,
              isLoadingShown: widget.request.data.isLoadingShown,
              updateIsShown: (value) {
                widget.request.data.updateIsModalShown(value);
                setState(() {});
              }),
        ),
      ),
    );
  }
}

/// The type of dialog to show
enum DialogType { signInForm }
