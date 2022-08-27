import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

import '../../../bloc/bloc.dart';
import '../../../components/components.dart';
import '../../../models/models.dart';
import '../../bundles.dart';

/// [SearchDoa] Halaman yang berfungsi untuk melakukan pencarian pada doa-doa

class SearchDoa extends SearchDelegate {
  ListDoaModels listDoa;
  SearchDoa({required this.listDoa});

  @override
  String get searchFieldLabel => 'Cari Doa...';

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
    final suggestions = listDoa.data!.where((searchResult) {
      final result = searchResult.nama!.toLowerCase();
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

  Padding _searchTile(
    DataDoa suggestion,
    TextTheme textTheme,
    ColorScheme colorScheme,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      suggestion.nama!,
                      style: textTheme.headline5!.copyWith(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  )
                ],
              ),
              Divider(thickness: 1, color: colorScheme.primary.withOpacity(0.2)),
            ],
          ),
          onTap: () {
            query = suggestion.nama!;
            context.read<DetailDoaBloc>().add(GetDetailDoaEvent(id: suggestion.idDoa!));
            final Tuple2<BuildContext, String> arguments = Tuple2(context, suggestion.nama!);
            Navigator.push(context, SlideRightRoute(page: DetailPrayScreen(arguments: arguments)));
          }),
    );
  }
}
