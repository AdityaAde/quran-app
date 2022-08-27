import 'package:flutter/material.dart';

/// [InfoSurah] Widget yang menampilkan informasi dari surah
class InfoSurah extends StatelessWidget {
  const InfoSurah({
    Key? key,
    required this.textTheme,
    required this.descriptionSurah,
    required this.colorScheme,
  }) : super(key: key);

  final TextTheme textTheme;
  final String descriptionSurah;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (builder) {
              return Container(
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
                      'Penjelasan Surah',
                      style: textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        descriptionSurah.replaceAll('<i>', ''),
                        style: textTheme.bodyLarge,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      icon: Icon(
        Icons.info_outline,
        color: colorScheme.primary,
      ),
    );
  }
}
