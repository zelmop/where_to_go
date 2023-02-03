import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_components/constants/color.constants.dart';
import 'package:where_to_go/viewmodels/viewmodels.dart';

import 'package:where_to_go/views/views.dart';
import 'package:where_to_go/views/widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ViewModelBuilder<HomeViewViewModel>.reactive(
      viewModelBuilder: () => HomeViewViewModel(), 
      builder: (context, viewModel, child) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              MainNavigationView(
                pageController: _controller
              ),
              viewModel.showMenu ? Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: size.height * .1),
                  child: MainNavigationBar(
                    pageController: _controller
                  )
                )
              ) : Container()
            ]
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => viewModel.toggleMenu(),
            backgroundColor: ColorConstants.primaryColor,
            child: Icon(
              viewModel.showMenu ? 
              Icons.close_fullscreen_outlined : Icons.open_in_full_outlined,
              color: Colors.white
            )
          )
        )
      )
    );
  }
}