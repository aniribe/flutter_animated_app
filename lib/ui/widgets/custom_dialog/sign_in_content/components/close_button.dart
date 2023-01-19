import 'package:flutter/material.dart';

import '../../../../../consts/app_colors.dart';
import '../../../../ui_helpers.dart';

class AppCloseButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AppCloseButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: screenWidth(context) / 2 - 40,
      bottom: 2,
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              spreadRadius: 5,
              color: AppColors.shadowColorLight.withOpacity(0.3),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: onPressed,
          child: const CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.backgroundColorLight,
            child: Icon(
              Icons.close,
              color: AppColors.backgroundColorDark,
            ),
          ),
        ),
      ),
    );
  }
}
