import 'package:animated_app/ui/widgets/custom_dialog/setup_dialog_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../config/app.locator.dart';

class OnboardingViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  bool isSignUpDialogShown = false;

  Future<void> onStartButtonPressedHandler() async {
    setIsDialogShownTo(true);
    onStartButtonPressed();
  }

  Future<void> onStartButtonPressed() async {
    final response = await _dialogService
        .showCustomDialog(
          variant: DialogType.signInForm,
          barrierDismissible: true,
        )
        .then((value) => setIsDialogShownTo(false));
  }

  void setIsDialogShownTo(bool value) {
    isSignUpDialogShown = value;
    notifyListeners();
  }
}
