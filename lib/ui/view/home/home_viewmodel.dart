import 'package:animated_app/ui/widgets/utils/rive_utils.dart';
import 'package:stacked/stacked.dart';

import '../../../model/rive_asset.dart';

class HomeViewModel extends BaseViewModel {
  RiveAsset selectedNav = RiveUtils.bottomNavs.first;

  void onNavBattomPressed(int index) {
    selectedNav = RiveUtils.bottomNavs[index];
    notifyListeners();
  }
}
