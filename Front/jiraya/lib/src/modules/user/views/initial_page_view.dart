// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/user/views/components/card_options_component.dart';
import 'package:jiraya/src/modules/user/views/components/home_logo_component.dart';
import 'package:jiraya/src/shared/app_colors.dart';

class InitialPageView extends StatefulWidget {
  const InitialPageView({
    Key? key,
    required this.userName,
  }) : super(key: key);
  final String userName;
  @override
  State<InitialPageView> createState() => _InitialPageViewState();
}

class _InitialPageViewState extends State<InitialPageView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            HomeLogoComponent(delayedTransition: false, title: "Olá, ${widget.userName}"),
            const SizedBox(height: 10),
            CardOptionsComponent(
              onTap: () {
                Modular.to.pushNamed("/products/user_products_page");
              },
              title: "Meus Produtos",
              content: '''Todos os produtos cadastrados até agora. Cadastre novos produtos, e os use para realizar promoções e novas publicações.''',
              height: height * 0.13,
              width: width,
              image: const AssetImage("assets/images/card_image.jpg"),
              backgroundColor: AppColors.tertiaryColor(context),
            ),
            const SizedBox(height: 15),
            CardOptionsComponent(
              title: "Eventos e Promoções",
              content: '''Organize os eventos e promoções que serão realizadas para seus clientes. Poste todas as novidades onde quiser.''',
              height: height * 0.13,
              width: width,
              image: const AssetImage("assets/images/events_img.jpg"),
              backgroundColor: AppColors.tertiaryColor(context),
            ),
          ],
        ),
      ),
    );
  }
}
