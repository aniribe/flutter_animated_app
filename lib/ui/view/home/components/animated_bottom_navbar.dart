import 'package:flutter/cupertino.dart';

import '../../../../consts/app_colors.dart';
import '../../../../model/rive_asset.dart';
import '../../../widgets/utils/rive_utils.dart';
import 'bottom_nav_button.dart';

class AnimatedBottomNavBar extends StatelessWidget {
  final Function(int) onNavBottomPressed;
  final RiveAsset selectedNav;

  const AnimatedBottomNavBar({
    Key? key,
    required this.onNavBottomPressed,
    required this.selectedNav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor2.withOpacity(0.8),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            RiveUtils.bottomNavs.length,
            (index) => BottomNavButton(
              onNavBottomPressed: onNavBottomPressed,
              selectedNav: selectedNav,
              index: index,
            ),
          )
        ],
      ),
    );
  }
}
