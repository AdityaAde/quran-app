import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/tafsir/tafsir_bloc.dart';
import 'package:quran_app/components/components.dart';

class TafsirSurah extends StatelessWidget {
  const TafsirSurah({Key? key, required this.ayatSurah}) : super(key: key);

  final int ayatSurah;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (builder) {
              return BlocBuilder<TafsirBloc, TafsirState>(
                builder: (context, state) {
                  if (state is TafsirLoading) {
                    return const Loading();
                  } else if (state is TafsirLoaded) {
                    return SingleChildScrollView(
                      child: Container(
                        color: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                            ),
                          ),
                          child: ListTile(
                            title: Text(
                              'Tafsir ${state.tafsir.namaLatin!} : $ayatSurah',
                              style: textTheme.headline3!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                state.tafsir.tafsir![ayatSurah].tafsir!,
                                style: textTheme.bodyLarge,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              );
            });
      },
      icon: Icon(
        Icons.book_outlined,
        color: colorScheme.primary,
      ),
    );
  }
}
