import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/user/view_models/controllers/user_controller.dart';
import 'package:jiraya/src/modules/user/views/components/card_options_component.dart';
import 'package:jiraya/src/modules/user/views/components/home_logo_component.dart';
import 'package:jiraya/src/shared/app_colors.dart';

class OptionsPageView extends StatefulWidget {
  const OptionsPageView({super.key});

  @override
  State<OptionsPageView> createState() => _OptionsPageViewState();
}

final _controller = Modular.get<UserController>();

class _OptionsPageViewState extends State<OptionsPageView> {
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
            const HomeLogoComponent(delayedTransition: false, title: ""),
            const SizedBox(height: 10),
            CardOptionsComponent(
              onTap: () => _controller.defineRoute("/products/create_product_page"),
              title: "Criar Novo Produto",
              content: '''Os produtos cadastrados poderão ser utilizados para realizar promoções e novas publicações.Eles também aparecerão no menu de escolha do cliente.''',
              height: height * 0.13,
              width: width,
              image: const AssetImage("assets/images/card_image.jpg"),
              backgroundColor: AppColors.tertiaryColor(context),
            ),
            const SizedBox(height: 15),
            CardOptionsComponent(
              title: "Criar Nova Promoção",
              content: '''As promoções deverão conter pelo menos 1 produto cadastrado. Após a escolha dos produtos, a promoção poderá ser publicada nas redes sociais.''',
              height: height * 0.13,
              width: width,
              image: const AssetImage("assets/images/events_img.jpg"),
              backgroundColor: AppColors.tertiaryColor(context),
            ),
            const SizedBox(height: 15),
            CardOptionsComponent(
              title: "Criar Novo Evento",
              content: '''Os eventos assim como as promoções, poderão ser divulgados nas redes sociais. Informe a data e hora, utilize imagens, e adicione uma boa descrição.''',
              height: height * 0.13,
              width: width,
              image: const AssetImage("assets/images/new_event.jpg"),
              backgroundColor: AppColors.tertiaryColor(context),
            ),
          ],
        ),
      ),
    );
  }
}
