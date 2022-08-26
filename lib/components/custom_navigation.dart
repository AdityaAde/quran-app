import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../bundles/bundles.dart';
import '../config/theme/theme_cubit.dart';
import 'route_transition.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isChangeTheme = false;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 149, 96, 223),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(onTap: () {}, child: Image.asset('assets/images/quran.png')),
            InkWell(
              onTap: () {
                Navigator.push(context, SlideTopRoute(page: const PrayScreen()));
                context.read<DoaBloc>().add(GetListDoa());
              },
              child: Image.asset('assets/images/pray.png'),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, SlideTopRoute(page: const BookmarkScreen()));
                context.read<BookmarkBloc>().add(GetBookmarkEvent());
              },
              child: Image.asset('assets/images/bookmark.png'),
            ),
            InkWell(
              onTap: () {
                isChangeTheme = !isChangeTheme;
                context.read<ThemeCubit>().switchTheme(isChangeTheme);
              },
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  if (state.theme == 'light') {
                    return const Icon(
                      Icons.light_mode_outlined,
                      color: Colors.white,
                      size: 30,
                    );
                  } else {
                    return const Icon(
                      Icons.dark_mode_outlined,
                      color: Colors.white,
                      size: 30,
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
