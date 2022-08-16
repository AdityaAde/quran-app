import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import '../../components/components.dart';

class PrayScreen extends StatelessWidget {
  const PrayScreen({Key? key}) : super(key: key);

  static const String routeName = '/pray';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const PrayScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBarCustom.appBarCustom(
        context,
        'Doa - Doa',
        textTheme,
        colorScheme,
        const SizedBox(),
      ),
      body: BlocConsumer<DoaBloc, DoaState>(
        listener: (context, state) {
          if (state is DoaError) {
            context.read<DoaBloc>().add(GetListDoa());
          }
        },
        builder: (context, state) {
          return BlocBuilder<DoaBloc, DoaState>(
            builder: (context, state) {
              if (state is DoaLoading) {
                return const Center(
                  child: Loading(),
                );
              } else if (state is DoaLoaded) {
                return ListView.builder(
                  itemCount: state.listDoa.data!.length,
                  itemBuilder: (context, index) {
                    final doa = state.listDoa.data![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          ListTile(
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
                );
              } else {
                return const Center(
                  child: Text('Terjadi Kesalahan!'),
                );
              }
            },
          );
        },
      ),
    );
  }
}
