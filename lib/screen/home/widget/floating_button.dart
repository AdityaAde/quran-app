import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return CircleAvatar(
      backgroundColor: colorScheme.primary,
      radius: 30,
      child: IconButton(
        onPressed: () {
          context.read<BookmarkBloc>().add(GetBookmarkEvent());
          Navigator.pushNamed(context, '/bookmarks');
        },
        icon: const Icon(Icons.bookmark),
        iconSize: 28,
        color: Colors.white,
      ),
    );
  }
}
