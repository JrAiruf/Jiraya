// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jiraya/src/shared/app_colors.dart';

class HomeLogoComponent extends StatefulWidget {
  const HomeLogoComponent({
    Key? key,
    required this.delayedTransition,
    required this.title,
    this.titleColor,
  }) : super(key: key);

  final bool delayedTransition;
  final String title;
  final Color? titleColor;
  @override
  State<HomeLogoComponent> createState() => _HomeLogoComponentState();
}

class _HomeLogoComponentState extends State<HomeLogoComponent> {
  late AssetImage logoImage;
  bool _showLogo = false;
  @override
  void initState() {
    setVisibility();
    super.initState();
  }

  setVisibility() async {
    logoImage = const AssetImage(
      "assets/images/jiraiya_logo.jpg",
    );
    widget.delayedTransition ? await Future.delayed(const Duration(seconds: 4)) : null;
    setState(() {
      _showLogo = true;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(logoImage, context);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Visibility(
      visible: _showLogo,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.2,
              width: width * 0.43,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.yellowSColor(context),
                        shape: BoxShape.circle,
                      ),
                      height: height * 0.17,
                      width: width * 0.34,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainerColor(context),
                        shape: BoxShape.circle,
                      ),
                      height: height * 0.17,
                      width: width * 0.34,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: logoImage,
                        ),
                      ),
                      height: height * 0.17,
                      width: width * 0.34,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 35,
                color: widget.titleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
