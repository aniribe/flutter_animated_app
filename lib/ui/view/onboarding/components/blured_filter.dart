import 'dart:ui';

import 'package:flutter/cupertino.dart';

class BlurredFilter extends StatelessWidget {
  const BlurredFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
        child: const SizedBox(),
      ),
    );
  }
}
