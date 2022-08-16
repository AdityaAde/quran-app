import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 149, 96, 223),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/quran.png'),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/pray');
                context.read<DoaBloc>().add(GetListDoa());
              },
              child: Image.asset('assets/images/pray.png'),
            ),
            InkWell(
              onTap: () {
                context.read<BookmarkBloc>().add(GetBookmarkEvent());
                Navigator.pushNamed(context, '/bookmarks');
              },
              child: Image.asset('assets/images/bookmark.png'),
            ),
          ],
        ),
      ),
    );
  }
}
