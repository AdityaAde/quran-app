import 'package:flutter/material.dart';

class TafsirSurah extends StatelessWidget {
  const TafsirSurah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
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
                      'Tafsir Al-Fatihah: 1',
                      style: textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Lorem ipsum'.replaceAll('<i>', ''),
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
        Icons.book_outlined,
        color: colorScheme.primary,
      ),
    );
  }
}
