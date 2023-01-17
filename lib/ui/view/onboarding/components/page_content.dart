import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

import '../../../widgets/buttons/animated_button.dart';
import 'page_title_and_slogan.dart';
import 'promo_text_section.dart';

class PageContent extends StatelessWidget {
  final RiveAnimationController buttonAnimationController;

  const PageContent({
    Key? key,
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
            },
          ),
          const PromoText(),
        ],
      ),
    );
  }
}
