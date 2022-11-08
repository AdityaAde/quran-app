import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/bloc.dart';
import 'package:quran_app/models/doa_models.dart';
import 'package:tuple/tuple.dart';

import '../../../components/components.dart';
import 'search_doa.dart';

/// Widget [ListDoa] yang digunakan untuk menampilkan list dari doa-doa

class ListDoa extends StatelessWidget {
  const ListDoa({
    Key? key,
    required this.textTheme,
    required this.colorScheme,
    required this.state,
    required this.doa,
  }) : super(key: key);

  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final DoaLoaded state;
  final ListDoaModels doa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom.appBarCustom(
        context,
        'Doa - Doa',
        textTheme,
        colorScheme,
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: SearchDoa(listDoa: doa));
          },
          icon: Icon(
            Icons.search,
            color: colorScheme.onBackground.withOpacity(0.5),
          ),
        ),
        null,
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/pray_illustrator.png',
            height: 250,
            width: 200,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              thickness: 3,
              color: colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.listDoa.data!.length,
            itemBuilder: (context, index) {
              final doa = state.listDoa.data![index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        context.read<DetailDoaBloc>().add(GetDetailDoaEvent(id: doa.idDoa!));
                        final Tuple2<BuildContext, String> arguments = Tuple2(context, doa.nama!);
                        Navigator.pushNamed(context, '/detail-doa', arguments: arguments);
                      },
                      title: Text(
                        doa.nama!,
                        style: textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                          color: colorScheme.onBackground.withOpacity(0.7),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    ),
                    const Divider(thickness: 1),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
