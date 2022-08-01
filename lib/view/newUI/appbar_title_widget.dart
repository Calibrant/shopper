// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_test__task/models/utils/theme.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppBarTitleWidget extends StatelessWidget with PreferredSizeWidget {
  AppBarTitleWidget({
    Key? key,
    required this.title,
    required this.automaticallyImplyLeading,
  }) : super(key: key);
  final String title;
  final bool automaticallyImplyLeading;

  Future<String> internetConnect() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      return title;
    } else {
      return 'Нет подключения';
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: internetConnect(),
      builder: ((context, snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            AppBar(
              automaticallyImplyLeading: automaticallyImplyLeading,
             // backgroundColor: const Color(0xFF0C40A6),
              title: Text(
                '${snapshot.data}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = <Widget>[
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Color(0xFF0C40A6),
                strokeWidth: 2,
              ),
            ),
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        );
      }),
    );
  }
}
