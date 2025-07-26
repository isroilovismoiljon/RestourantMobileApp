import 'package:flutter/material.dart';

import 'bottom_navigation_bar_gradient.dart';
import 'bottom_navigation_bar_main.dart';

class RecipeBottomNavigationBar extends StatelessWidget {
  const RecipeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BottomNavigationBarGradient(),
        BottomNavigationBarMain(),
      ],
    );
  }
}