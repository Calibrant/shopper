import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_widget.dart';
import 'logo_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: const [
              LogoWidget(),
              AuthWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
