import 'package:flutter/material.dart';

class AppBarCustom {
  static PreferredSizeWidget appBarCustom(
    BuildContext context,
    String title,
    TextTheme textTheme,
    ColorScheme colorScheme,
    Widget widget,
  ) {
    return AppBar(
      title: Text(
        title,
        style: textTheme.headline4!.copyWith(color: colorScheme.primary),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [widget],
    );
  }
}
