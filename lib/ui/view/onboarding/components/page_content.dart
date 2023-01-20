import 'package:animated_app/consts/app_colors.dart';
import 'package:animated_app/consts/app_image.dart';
import 'package:animated_app/consts/string_consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import '../../../ui_helpers.dart';
import '../../../widgets/buttons/animated_button.dart';
import '../../../widgets/inputs/general_input.dart';
import '../../../widgets/signin_form.dart';
import '../onboarding_viewmodel.dart';
import 'page_title_and_slogan.dart';
import 'promo_text_section.dart';

class PageContent extends StatelessWidget {
  final OnboardingViewModel model;
  final RiveAnimationController buttonAnimationController;

  const PageContent({
    Key? key,
    required this.model,
    required this.buttonAnimationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          const PageTitleAndSlogan(),
          const Spacer(flex: 2),
          AnimatedButton(
            buttonAnimationController: buttonAnimationController,
            onTap: () {
              buttonAnimationController.isActive = true;
              Future.delayed(const Duration(milliseconds: 800),
                  () => model.onStartButtonPressed());
            },
          ),
          const PromoText(),
        ],
      ),
    );
  }
}
