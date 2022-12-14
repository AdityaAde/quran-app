import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../bundles/bundles.dart';
import '../config/theme/theme_cubit.dart';
import 'route_transition.dart';

/// Create [CustomNavbar] Sebuah widget custom yang digunakan
/// untuk melakukan navigasi di halaman utama

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({Key? key, required this.heightContainer})
      : super(key: key);

  final double heightContainer;

  @override
  Widget build(BuildContext context) {
    var isChangeTheme = false;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 149, 96, 223),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        height: heightContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Quran surah
            InkWell(
              onTap: () {},
              child: Image.asset('assets/images/quran.png'),
            ),

            // Navigasi ke halaman Doa-doa
            InkWell(
              onTap: () {
                Navigator.push(
                    context, SlideTopRoute(page: const PrayScreen()));
                context.read<DoaBloc>().add(GetListDoa());
              },
              child: Image.asset('assets/images/pray.png'),
            ),

            // Navigasi ke halaman bookmark
            InkWell(
              onTap: () {
                //Navigator.push(context, SlideTopRoute(page: const BookmarkScreenNew()));

                /// TODO: Update Halaman Bookmark
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookmarkScreen()));
                context.read<BookmarkBloc>().add(GetBookmarkEvent());
              },
              child: Image.asset('assets/images/bookmark.png'),
            ),

            // Fungsi untuk mengganti tema LIGHT or DARK
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
