import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

import '../../bloc/bloc.dart';
import '../../models/surah_models.dart';

class SearchScreen extends SearchDelegate {
  List<SurahModels> listSurah;
  SearchScreen({required this.listSurah});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    List<SurahModels> suggestions = listSurah.where((searchResult) {
      final result = searchResult.namaLatin!.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(
            'List Surah',
            style: textTheme.headline3!.copyWith(
              fontSize: 21,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = suggestions[index];
                  return _searchTile(suggestion, textTheme, colorScheme, context);
                }),
          ),
        ],
      ),
    );
  }

  Padding _searchTile(SurahModels suggestion, TextTheme textTheme, ColorScheme colorScheme, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    suggestion.namaLatin!,
                    style: textTheme.headline5!.copyWith(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  Text(
                    suggestion.nama!,
                    style: textTheme.headline5!.copyWith(fontSize: 12, color: colorScheme.primary),
                    textDirection: TextDirection.rtl,
                  )
                ],
              ),
              Divider(thickness: 1, color: colorScheme.primary.withOpacity(0.2)),
            ],
          ),
          onTap: () {
            query = suggestion.namaLatin!;
            context.read<DetailSurahBloc>().add(GetDetailSurahEvent(surahIndex: suggestion.nomor.toString()));
            final Tuple2<BuildContext, SurahModels> arguments = Tuple2(context, suggestion);
            Navigator.pushNamed(context, '/detail-surah', arguments: arguments);
          }),
    );
  }
}
