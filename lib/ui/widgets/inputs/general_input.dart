import 'package:animated_app/ui/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../consts/app_colors.dart';

class GeneralInput extends StatelessWidget {
  final String labelText;
  final String? icon;
  final bool obscureText;

  const GeneralInput({
    Key? key,
    required this.labelText,
    this.icon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(color: AppColors.shadowColorLight),
        ),
        verticalSpace(7),
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: icon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset(icon as String),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: AppColors.shadowColorLight, width: 1),
            ),
          ),
          obscureText: obscureText,
        ),
      ],
    );
  }
}
