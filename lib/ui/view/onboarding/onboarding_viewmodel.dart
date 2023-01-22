import 'package:animated_app/ui/widgets/custom_dialog/setup_dialog_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../config/app.locator.dart';
import '../../../model/signup_model.dart';

class OnboardingViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  bool isSignUpDialogShown = false;

  late SignUpModel signUpModel;

  void onInit(GlobalKey<FormState> key) {
    initializeSignUpModel(key);
  }

  void initializeSignUpModel(GlobalKey<FormState> key) {
    signUpModel = SignUpModel(
      formKey: key,
      emptyValidation: emptyValidation,
      updateIsModalShown: setIsLoadingShownTo,
    );
  }

  String? emptyValidation(String? value) {
    if (value != null && value.isEmpty) {
      return '';
    }
    return null;
  }

  Future<void> onStartButtonPressedHandler(GlobalKey<FormState> key) async {
    setIsDialogShownTo(true);
    onStartButtonPressed(key);
  }

  Future<void> onStartButtonPressed(GlobalKey<FormState> key) async {
    final response = await _dialogService
        .showCustomDialog(
          variant: DialogType.signInForm,
          barrierDismissible: true,
          data: signUpModel,
        )
        .then((value) => setIsDialogShownTo(false));
  }

  void setIsDialogShownTo(bool value) {
    isSignUpDialogShown = value;
    notifyListeners();
  }

  void setIsLoadingShownTo(bool value) {
    signUpModel.isLoadingShown = value;
    print('HERE: $value');
    // notifyListeners();
  }
}
