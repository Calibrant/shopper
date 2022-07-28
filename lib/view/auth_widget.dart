// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../models/newmodel/profile_model.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final _formKeyPass = GlobalKey<FormState>();
  final _formKeyEmail = GlobalKey<FormState>();

  String _errorMessage = '';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool submitEmail = false;
  bool submitPass = false;
  bool isValidateEmail = false;

  @override
  void initState() {
    emailController.addListener(() {
      setState(() {
        submitEmail = emailController.text.isNotEmpty;
      });
    });
    passwordController.addListener(() {
      setState(() {
        submitPass = passwordController.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Электронная почта не может быть пустой";
      });
    } else if (!EmailValidator.validate(val, false)) {
      setState(() {
        _errorMessage = "Неверный адрес электронной почты";
      });
    } else {
      setState(() {
        _errorMessage = "";
        isValidateEmail = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    var modelProfile = context.read<ProfileModel>();
    var profile = context.select<AuthModel,Profile>(
      (user) => user.getByPosition(1));

    final onPressed = submitEmail && submitPass && isValidateEmail
        ? () {
            if (_formKeyEmail.currentState!.validate() &&
                _formKeyPass.currentState!.validate() &&
                isValidateEmail) {
               modelProfile.add(profile);
              Navigator.pushNamed(context, '/group_catalog');
            }
          }
        : null;

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 75,
            ),
            const Text(
              'Авторизация',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Color(0xff363636),
              ),
            ),
            Text(
              _errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(
              height: 20.0,
            ),
            emailWidget(),
            const SizedBox(
              height: 20.0,
            ),
            passwordWidget(),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButtonWidget(
              child: 'Войти',
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }

  Form emailWidget() {
    return Form(
      key: _formKeyEmail,
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          label: const Text(
            'Введите email',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Color(0xffABABAB),
            ),
          ),
        ),
        onChanged: (val) {
          validateEmail(val);
        },
      ),
    );
  }

  Form passwordWidget() {
    return Form(
      key: _formKeyPass,
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          label: const Text(
            'Введите пароль',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Color(0xffABABAB),
            ),
          ),
        ),
      ),
    );
  }
}

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);
  final String child;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 375.0, height: 56.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color(0xff0C40A6),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          child,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}
