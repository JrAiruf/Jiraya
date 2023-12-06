// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:jiraya/src/shared/app_colors.dart';

class AppBottomNavigationBar extends StatefulWidget {
  AppBottomNavigationBar({required this.pageIndex, required this.controller, super.key});

  final PageController controller;
  int pageIndex;
  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 65),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: AppColors.yellowSColor(context),
          currentIndex: widget.pageIndex,
          onTap: (value) {
            setState(() {
              widget.pageIndex = value;
              widget.controller.animateToPage(
                value,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            });
          },
          backgroundColor: AppColors.redPColor(context),
          iconSize: 30,
          elevation: 15,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: "Opções",
            ),
          ],
        ),
      ),
    );
  }
}
