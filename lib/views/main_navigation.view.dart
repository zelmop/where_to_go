import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:where_to_go/viewmodels/views/main_navigation_view.viewmodel.dart';
import 'package:where_to_go/views/views.dart';

class MainNavigationView extends StatelessWidget {
  final PageController pageController;

  const MainNavigationView({
    super.key,
    required this.pageController
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainNavigationViewViewModel>.reactive(
      viewModelBuilder: () => MainNavigationViewViewModel(), 
      builder: (context, viewModel, child) => PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SearchView(friends: viewModel.friends),
          FriendsView(friends: viewModel.friends),
          const PaymentView(),
          const SettingsView()
        ]
      )
    );
  }
}