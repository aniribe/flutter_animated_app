import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_image.dart';
import '../../../consts/string_consts.dart';
import '../../ui_helpers.dart';
import '../inputs/general_input.dart';
import '../utils/rive_utils.dart';
import 'components/container_for_sign.dart';

class SignInForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String? Function(String?)? emptyValidation;
  final void Function(bool) updateIsShown;
  final void Function() redirect;
  final bool isLoadingShown;

  const SignInForm({
    Key? key,
    required this.formKey,
    required this.emptyValidation,
    required this.updateIsShown,
    required this.isLoadingShown,
    required this.redirect,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  SMITrigger? reset;
  SMITrigger? check;
  SMITrigger? error;
  SMITrigger? confetti;
  bool isShowConfetti = false;

  // StateMachineController getRiveController(Artboard artboard) {
  //   StateMachineController? controller =
  //       StateMachineController.fromArtboard(artboard, 'State Machine 1');
  //
  //   artboard.addController(controller!);
  //
  //   return controller;
  // }

  void onSignInButtonPressedHandler() {
    setState(() {
      widget.updateIsShown(true);
      isShowConfetti = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (widget.formKey.currentState!.validate()) {
        check?.fire();

        Future.delayed(
          const Duration(seconds: 2),
          () {
            setState(() {
              widget.updateIsShown(false);
            });
            confetti?.fire();
            Future.delayed(const Duration(seconds: 1), () => widget.redirect());
          },
        );
      } else {
        error?.fire();
        Future.delayed(
          const Duration(seconds: 2),
          () {
            setState(() {
              widget.updateIsShown(false);
            });
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralInput(
                labelText: StringConsts.email,
                icon: AppImage.emailIcon,
                validator: widget.emptyValidation,
              ),
              verticalSpace(25),
              GeneralInput(
                labelText: StringConsts.password,
                icon: AppImage.passwordIcon,
                obscureText: true,
                validator: widget.emptyValidation,
              ),
              verticalSpace(25),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.pink,
                  minimumSize: const Size(double.infinity, 56),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                  ),
                ),
                onPressed: () => onSignInButtonPressedHandler(),
                icon: const Icon(CupertinoIcons.arrow_right),
                label: const Text(StringConsts.signIn),
              )
            ],
          ),
        ),
        widget.isLoadingShown
            ? ContainerForSign(
                child: RiveAnimation.asset(
                  AppImage.riveCheckImage,
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: StringConsts.stateMachineTrigger);
                    check = controller.findSMI(StringConsts.checkTrigger);
                    error = controller.findSMI(StringConsts.errorTrigger);
                    reset = controller.findSMI(StringConsts.resetTrigger);
                  },
                ),
              )
            : Container(),
        isShowConfetti
            ? ContainerForSign(
                child: Transform.scale(
                  scale: 8,
                  child: RiveAnimation.asset(
                    AppImage.riveConfettiImage,
                    onInit: (artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveController(artboard,
                              stateMachineName:
                                  StringConsts.stateMachineTrigger);
                      confetti =
                          controller.findSMI(StringConsts.explosionTrigger);
                    },
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
