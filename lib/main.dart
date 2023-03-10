import 'package:animated_app/ui/view/home/home_view.dart';
import 'package:animated_app/ui/view/onboarding/onboarding_view.dart';
import 'package:animated_app/ui/view/onboarding/onboarding_viewmodel.dart';
import 'package:animated_app/ui/widgets/custom_dialog/setup_dialog_ui.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'config/app.locator.dart';
import 'config/app.router.dart';

void main() {
  setupLocator();
  setupDialogUi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEEF1F8),
        primarySwatch: Colors.blue,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      home: OnboardingView(),
    );
  }
}
