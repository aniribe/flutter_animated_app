import 'package:rive/rive.dart';

import '../../../consts/app_image.dart';
import '../../../consts/string_consts.dart';
import '../../../model/rive_asset.dart';

class RiveUtils {
  static StateMachineController getRiveController(Artboard artboard,
      {String stateMachineName = ''}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);

    artboard.addController(controller!);

    return controller;
  }

  static List<RiveAsset> bottomNavs = [
    RiveAsset(AppImage.riveIconsImage,
        stateMachineName: StringConsts.chatStateMachineName,
        artboard: StringConsts.chatArtboard,
        title: StringConsts.chatTitle),
    RiveAsset(AppImage.riveIconsImage,
        stateMachineName: StringConsts.searchStateMachineName,
        artboard: StringConsts.searchArtboard,
        title: StringConsts.searchTitle),
    RiveAsset(AppImage.riveIconsImage,
        stateMachineName: StringConsts.timerStateMachineName,
        artboard: StringConsts.timerArtboard,
        title: StringConsts.timerTitle),
    RiveAsset(AppImage.riveIconsImage,
        stateMachineName: StringConsts.bellStateMachineName,
        artboard: StringConsts.bellArtboard,
        title: StringConsts.bellTitle),
    RiveAsset(AppImage.riveIconsImage,
        stateMachineName: StringConsts.userStateMachineName,
        artboard: StringConsts.userArtboard,
        title: StringConsts.userTitle),
  ];
}
