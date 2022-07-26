// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppBarTitleWidget extends StatelessWidget with PreferredSizeWidget {
  AppBarTitleWidget({
    Key? key,
    required this.title,
    required this.automaticallyImplyLeading,
  }) : super(key: key);
  final String title;
 final bool automaticallyImplyLeading;
  @override
  Size get preferredSize => const Size.fromHeight(64);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: const Color(0xFF0C40A6),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
