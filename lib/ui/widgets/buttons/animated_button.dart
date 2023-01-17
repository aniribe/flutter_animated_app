import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

import '../../../consts/app_image.dart';
import '../../../consts/string_consts.dart';
import '../../ui_helpers.dart';

class AnimatedButton extends StatelessWidget {
  final RiveAnimationController buttonAnimationController;
  final VoidCallback onTap;

  const AnimatedButton({
    Key? key,
    required this.buttonAnimationController,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            RiveAnimation.asset(
              AppImage.riveButtonImage,
              controllers: [buttonAnimationController],
            ),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(CupertinoIcons.arrow_right),
                  horizontalSpace(8),
                  const Text(
                    StringConsts.startCoursePhrase,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
