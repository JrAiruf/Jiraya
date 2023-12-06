import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/user/models/user_model.dart';
import 'package:jiraya/src/modules/user/views/components/app_bottom_navigation_bar.dart';
import 'package:jiraya/src/modules/user/views/initial_page_view.dart';
import 'package:jiraya/src/modules/user/views/options_page_view.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

final user = Modular.args.data as UserModel;
final _pageController = PageController();
int _pageIndex = 0;

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    final userName = user.name?.split(" ").first ?? "";
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          InitialPageView(userName: userName),
          const OptionsPageView(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: AppBottomNavigationBar(
          pageIndex: _pageIndex,
          controller: _pageController,
        ),
      ),
    );
  }
}
