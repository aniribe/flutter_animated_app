import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_image.dart';
import '../../consts/string_consts.dart';
import '../ui_helpers.dart';
import 'inputs/general_input.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GeneralInput(
            labelText: StringConsts.email,
            icon: AppImage.emailIcon,
          ),
          verticalSpace(25),
          const GeneralInput(
            labelText: StringConsts.password,
            icon: AppImage.passwordIcon,
            obscureText: true,
          ),
          verticalSpace(25),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.pink,
              minimumSize: const Size(double.infinity, 56),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
            ),
            onPressed: () {},
            icon: const Icon(CupertinoIcons.arrow_right),
            label: const Text(StringConsts.signIn),
          )
        ],
      ),
    );
  }
}
