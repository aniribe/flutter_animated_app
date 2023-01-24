import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

import '../../../../model/rive_asset.dart';
import '../../../widgets/utils/rive_utils.dart';

class AnimatedIcon extends StatelessWidget {
  final int index;
  final RiveAsset selectedNav;

  const AnimatedIcon({
    Key? key,
    required this.index,
    required this.selectedNav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      child: Opacity(
        opacity: RiveUtils.bottomNavs[index] == selectedNav ? 1 : 0.5,
        child: RiveAnimation.asset(
          RiveUtils.bottomNavs[index].src,
          artboard: RiveUtils.bottomNavs[index].artboard,
          onInit: (artboard) {
            StateMachineController controller = RiveUtils.getRiveController(
              artboard,
              stateMachineName: RiveUtils.bottomNavs[index].stateMachineName,
            );
            RiveUtils.bottomNavs[index].input =
                controller.findSMI('active') as SMIBool;
          },
        ),
      ),
    );
  }
}
