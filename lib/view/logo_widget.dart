import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset('assets/images/87-874236_e-logo-transparent-png-e 1.png'),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Сделай жизнь проще',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Color(0xff232323),
            ),
          )
        ],
      ),
    );
  }
}
