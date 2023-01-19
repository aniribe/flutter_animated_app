import 'package:flutter/material.dart';

import '../../../../../consts/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Divider(
      color: AppColors.shadowColorLight.withOpacity(0.5),
    ));
  }
}
