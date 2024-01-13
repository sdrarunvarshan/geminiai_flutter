import 'package:flutter/material.dart';
import 'package:gemini_ai/product/const/const_text.dart';

import '../const/const_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      elevation: 10,
      centerTitle: true,
      title: Text(
        appBarTitle,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: black),
      ),

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}