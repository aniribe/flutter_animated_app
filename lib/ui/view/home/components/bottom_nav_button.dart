import 'package:flutter/cupertino.dart';

import '../../../../model/rive_asset.dart';
import '../../../ui_helpers.dart';
import '../../../widgets/utils/rive_utils.dart';
import 'animated_bar.dart';
import 'animated_icon.dart';

class BottomNavButton extends StatelessWidget {
  final Function(int p1) onNavBottomPressed;
  final RiveAsset selectedNav;
  final int index;

  const BottomNavButton({
    Key? key,
    required this.onNavBottomPressed,
    required this.selectedNav,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RiveUtils.bottomNavs[index].input?.change(true);
        onNavBottomPressed(index);
        Future.delayed(const Duration(seconds: 1), () {
          RiveUtils.bottomNavs[index].input?.change(false);
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBar(index: index, selectedNav: selectedNav),
          verticalSpace(7),
          AnimatedIcon(index: index, selectedNav: selectedNav),
        ],
      ),
    );
  }
}
