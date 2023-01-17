import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:stacked/stacked.dart';

import '../../../consts/app_image.dart';
import 'components/blured_filter.dart';
import 'components/page_content.dart';
import 'components/splie_image_container.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StatelessWidget {
  final RiveAnimationController _buttonAnimationController =
      OneShotAnimation('active', autoplay: false);

  OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            const SplineImageContainer(),
            const BlurredFilter(),

            ///Commented because of MAC
            // const RiveAnimation.asset(AppImage.riveShapesImage),
            const BlurredFilter(),
            SafeArea(
              child: PageContent(
                  buttonAnimationController: _buttonAnimationController),
            )
          ],
        ),
      ),
    );
  }
}
