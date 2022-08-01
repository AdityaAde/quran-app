import 'package:flutter/material.dart';

class AppBarCustom {
  static PreferredSizeWidget appBarCustom(
    BuildContext context,
    String title,
    TextTheme textTheme,
    ColorScheme colorScheme,
    VoidCallback? onPressed,
  ) {
    return AppBar(
      title: Text(
        title,
        style: textTheme.headline4!.copyWith(color: colorScheme.primary),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.search,
              color: colorScheme.onBackground.withOpacity(0.5),
            ))
      ],
    );
  }
}
