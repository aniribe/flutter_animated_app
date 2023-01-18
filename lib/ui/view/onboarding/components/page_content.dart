import 'package:animated_app/consts/app_colors.dart';
import 'package:animated_app/consts/app_image.dart';
import 'package:animated_app/consts/string_consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import '../../../ui_helpers.dart';
import '../../../widgets/buttons/animated_button.dart';
import '../../../widgets/inputs/general_input.dart';
import 'page_title_and_slogan.dart';
import 'promo_text_section.dart';

class PageContent extends StatelessWidget {
  final RiveAnimationController buttonAnimationController;

  const PageContent({
    Key? key,
    required this.buttonAnimationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          const PageTitleAndSlogan(),
          const Spacer(flex: 2),
          AnimatedButton(
            buttonAnimationController: buttonAnimationController,
            onTap: () {
              buttonAnimationController.isActive = true;
              showGeneralDialog(
                barrierDismissible: true,
                barrierLabel: 'Sign In',
                context: context,
                pageBuilder: (context, _, __) => Center(
                  child: Container(
                    height: 620,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 32),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.94),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Column(
                        children: [
                          const Text(
                            StringConsts.signIn,
                            style: TextStyle(
                              fontSize: 34,
                              fontFamily: StringConsts.poppinsFamily,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              StringConsts.accessPhrase,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Form(
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const PromoText(),
        ],
      ),
    );
  }
}
