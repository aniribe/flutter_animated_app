import 'package:animated_app/ui/widgets/custom_dialog/sign_in_content/components/signin_icon_row.dart';
import 'package:animated_app/ui/widgets/custom_dialog/sign_in_content/components/title_section.dart';
import 'package:flutter/material.dart';

import '../../../../../consts/app_colors.dart';
import '../../../../../consts/string_consts.dart';
import '../../../../ui_helpers.dart';
import '../../../signin_form.dart';
import 'or_line.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 620,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppColors.almostWhite,
      ),
      child: Column(
        children: [
          const TitleSection(),
          verticalSpace(20),
          const Text(
            StringConsts.accessPhrase,
            textAlign: TextAlign.center,
          ),
          verticalSpace(20),
          const SignInForm(),
          verticalSpace(15),
          const OrLine(),
          verticalSpace(20),
          const Text(
            StringConsts.emailSignIn,
            style: TextStyle(color: AppColors.shadowColorLight),
          ),
          verticalSpace(20),
          const SignInIconRow(),
        ],
      ),
    );
  }
}
