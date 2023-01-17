import 'package:flutter/cupertino.dart';

import '../../../../consts/app_image.dart';
import '../../../ui_helpers.dart';

class SplineImageContainer extends StatelessWidget {
  const SplineImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: screenWidth(context) * 1.7,
      bottom: 200,
      left: 100,
      child: Image.asset(AppImage.splineImage),
    );
  }
}
