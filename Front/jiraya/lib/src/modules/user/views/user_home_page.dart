import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/user/models/user_model.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

final user = Modular.args.data as UserModel;

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(user.id ?? ""),
      ),
    );
  }
}
