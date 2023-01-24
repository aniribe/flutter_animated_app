import 'package:flutter/cupertino.dart';

import '../../../../consts/app_colors.dart';
import '../../../../model/rive_asset.dart';
import '../../../widgets/utils/rive_utils.dart';

class AnimatedBar extends StatelessWidget {
  final int index;
  final RiveAsset selectedNav;

  const AnimatedBar({
    Key? key,
    required this.index,
    required this.selectedNav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 4,
      width: RiveUtils.bottomNavs[index] == selectedNav ? 20 : 0,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
