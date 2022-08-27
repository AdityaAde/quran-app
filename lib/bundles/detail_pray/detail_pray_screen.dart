import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

import '../../bloc/bloc.dart';
import '../../components/components.dart';

/// [DetailPrayScreen] Halaman yang menampilam dari dari Doa-doa

class DetailPrayScreen extends StatelessWidget {
  const DetailPrayScreen({Key? key, this.arguments}) : super(key: key);

  final Tuple2<BuildContext, String>? arguments;

  static const String routeName = '/detail-doa';

  static Route route({required Tuple2<BuildContext, String>? arguments}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => DetailPrayScreen(arguments: arguments),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBarCustom.appBarCustom(
        context,
        arguments!.item2,
        textTheme,
        colorScheme,
        const SizedBox(),
      ),
      body: BlocBuilder<DetailDoaBloc, DetailDoaState>(
        builder: (context, state) {
          return BlocBuilder<DetailDoaBloc, DetailDoaState>(
            builder: (context, state) {
              if (state is DetailDoaLoading) {
                return const Center(child: Loading());
              } else if (state is DetailDoaLoaded) {
                return ListView.builder(
                    itemCount: state.detailDoa.data!.length,
                    itemBuilder: (context, index) {
                      final data = state.detailDoa.data![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                data.lafal!,
                                style: textTheme.bodyLarge!.copyWith(fontSize: 20),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data.transliterasi!,
                              style: textTheme.bodyLarge!.copyWith(color: colorScheme.secondaryContainer),
                            ),
                            Text(
                              data.arti!,
                              style: textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data.riwayat!,
                              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: Text('Terjadi masalah'),
                );
              }
            },
          );
        },
      ),
    );
  }
}
