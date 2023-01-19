import 'package:flutter/material.dart';

import '../../../../../consts/app_colors.dart';
import '../../../../../consts/string_consts.dart';
import 'app_divider.dart';

class OrLine extends StatelessWidget {
  const OrLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            StringConsts.or,
            style:
                TextStyle(color: AppColors.shadowColorLight.withOpacity(0.6)),
          ),
        ),
        const AppDivider(),
      ],
    );
  }
}
