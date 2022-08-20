import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/config/config.dart';

import '../bloc/bloc.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
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
            IconButton(
                onPressed: () => bottomSheet(context, textTheme),
                icon: const Icon(
                  Icons.wb_sunny_outlined,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }

  void bottomSheet(BuildContext context, TextTheme textTheme) {
    var isChangeTheme = false;
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0))),
              child: ListTile(
                title: Text(
                  'Kamu yakin ingin mengubah tema?',
                  style: textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(fixedSize: const Size(50, 30)),
                      onPressed: () {
                        isChangeTheme = !isChangeTheme;
                        context.read<ThemeCubit>().switchTheme(isChangeTheme);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Ya',
                        style: textTheme.bodyLarge!.copyWith(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(fixedSize: const Size(50, 30)),
                      onPressed: () {
                        isChangeTheme = false;
                        context.read<ThemeCubit>().switchTheme(isChangeTheme);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Tidak',
                        style: textTheme.bodyLarge!.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
