import 'package:animated_app/consts/app_colors.dart';
import 'package:animated_app/ui/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:stacked/stacked.dart';

import '../../../consts/app_image.dart';
import '../../widgets/utils/rive_utils.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late SMIBool searchTrigger;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor2.withOpacity(0.8),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  RiveUtils.bottomNavs.length,
                  (index) => GestureDetector(
                    onTap: () {
                      RiveUtils.bottomNavs[index].input?.change(true);
                      model.onNavBattomPressed(index);
                      Future.delayed(const Duration(seconds: 1), () {
                        RiveUtils.bottomNavs[index].input?.change(false);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 4,
                          width:
                              RiveUtils.bottomNavs[index] == model.selectedNav
                                  ? 20
                                  : 0,
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        verticalSpace(7),
                        Container(
                          height: 36,
                          width: 36,
                          child: Opacity(
                            opacity:
                                RiveUtils.bottomNavs[index] == model.selectedNav
                                    ? 1
                                    : 0.5,
                            child: RiveAnimation.asset(
                              RiveUtils.bottomNavs[index].src,
                              artboard: RiveUtils.bottomNavs[index].artboard,
                              onInit: (artboard) {
                                StateMachineController controller =
                                    RiveUtils.getRiveController(
                                  artboard,
                                  stateMachineName: RiveUtils
                                      .bottomNavs[index].stateMachineName,
                                );
                                RiveUtils.bottomNavs[index].input =
                                    controller.findSMI('active') as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
