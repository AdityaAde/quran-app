import 'package:flutter/material.dart';

class AppBarCustom {
  static PreferredSizeWidget appBarCustom(
      String title, TextTheme textTheme, ColorScheme colorScheme, BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: textTheme.headline4!.copyWith(color: colorScheme.primary),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Not implemented yet.')),
              );
            },
            icon: Icon(
              Icons.search,
              color: colorScheme.onBackground.withOpacity(0.5),
            ))
      ],
    );
  }
}
