import 'package:animated_app/ui/widgets/custom_dialog/sign_in_content/components/signin_icon_row.dart';
import 'package:animated_app/ui/widgets/custom_dialog/sign_in_content/components/title_section.dart';
import 'package:flutter/material.dart';

import '../../../../../consts/app_colors.dart';
import '../../../../../consts/string_consts.dart';
import '../../../../ui_helpers.dart';
import '../../../signin_form/signin_form.dart';
import 'or_line.dart';

class MainContent extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String? Function(String?)? emptyValidation;
  final void Function(bool) updateIsShown;
  final bool isLoadingShown;
  final void Function() redirect;

  const MainContent({
    Key? key,
    required this.formKey,
    this.emptyValidation,
    required this.updateIsShown,
    required this.isLoadingShown,
    required this.redirect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 660,
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
          SignInForm(
            formKey: formKey,
            emptyValidation: emptyValidation,
            updateIsShown: updateIsShown,
            isLoadingShown: isLoadingShown,
            redirect: redirect,
          ),
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
