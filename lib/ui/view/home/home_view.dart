import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'components/animated_bottom_navbar.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: SafeArea(
          child: AnimatedBottomNavBar(
            onNavBottomPressed: model.onNavBattomPressed,
            selectedNav: model.selectedNav,
          ),
        ),
      ),
    );
  }
}
