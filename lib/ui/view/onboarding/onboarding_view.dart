import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:stacked/stacked.dart';

import '../../../consts/app_image.dart';
import '../../ui_helpers.dart';
import 'components/blured_filter.dart';
import 'components/page_content.dart';
import 'components/splie_image_container.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StatelessWidget {
  final RiveAnimationController _buttonAnimationController =
      OneShotAnimation('active', autoplay: false);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      onModelReady: (model) => model.onInit(_formKey),
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            const SplineImageContainer(),
            const BlurredFilter(),

            ///Commented because of MAC
            // const RiveAnimation.asset(AppImage.riveShapesImage),
            const BlurredFilter(),
            AnimatedPositioned(
              top: model.isSignUpDialogShown ? -50 : 0,
              height: screenHeight(context),
              width: screenWidth(context),
              duration: const Duration(milliseconds: 240),
              child: SafeArea(
                child: PageContent(
                  model: model,
                  buttonAnimationController: _buttonAnimationController,
                  formKey: _formKey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
