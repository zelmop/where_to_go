import 'package:flutter/material.dart';

class MainNavigationBar extends StatelessWidget {
  final PageController pageController;
  
  const MainNavigationBar({
    super.key,
    required this.pageController
  });

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
      color: const Color(0xFFF5F3F6),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        width: size.width * .8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                pageController.jumpToPage(0);
              },
              icon: const Icon(Icons.place_outlined),
            ),
            IconButton(
              onPressed: () {
                pageController.jumpToPage(1);
              },
              icon: const Icon(Icons.people_outline),
            ),
            IconButton(
              onPressed: () {
                pageController.jumpToPage(2);
              },
              icon: const Icon(Icons.paid_outlined),
            ),
            IconButton(
              onPressed: () {
                pageController.jumpToPage(3);
              },
              icon: const Icon(Icons.settings_outlined),
            )
          ]
        )
      )
    );
  }
}