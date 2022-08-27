import 'package:flutter/material.dart';

/// Create [AppBarCustom] Widget yang digunakan untuk menampilkan
/// sebuah custom AppBar
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
