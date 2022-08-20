import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key, required this.textTheme, required this.colorScheme}) : super(key: key);

  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return BlocConsumer<LastReadBloc, LastReadState>(
      listener: (context, state) {
        if (state is LastReadError) {
          context.read<LastReadBloc>().add(GetLastReadEvent());
        }
      },
      builder: (context, state) {
        return BlocBuilder<LastReadBloc, LastReadState>(
          builder: (context, state) {
            if (state is LastReadLoaded) {
              return _headerHome(
                textTheme,
                '${state.lastRead['surah']}',
                'Ayat Ke-${state.lastRead['ayat']}',
              );
            } else {
              return _headerHome(
                textTheme,
                '',
                'Belum ada surah',
              );
            }
          },
        );
      },
    );
  }

  Column _headerHome(TextTheme textTheme, String textSurah, String textAyat) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Stack(
          children: [
            Image.asset(
              'assets/images/home.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
                top: 25,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.book_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Last Read',
                          style: textTheme.bodyLarge!.copyWith(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textSurah.replaceAll('+', "'"),
                            style: textTheme.headline3!.copyWith(color: Colors.white),
                          ),
                          Text(
                            textAyat,
                            style: textTheme.bodyLarge!.copyWith(
                              fontSize: 15,
                              color: Colors.white.withOpacity(0.7),
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
        const SizedBox(height: 30),
        Center(
            child: Text(
          'Surah',
          style: textTheme.subtitle1!.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        )),
        Divider(
          thickness: 3,
          color: colorScheme.secondary,
        ),
      ],
    );
  }
}
