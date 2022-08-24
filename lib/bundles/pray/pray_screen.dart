import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import '../../components/components.dart';
import 'widget/list_doa.dart';

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
                return const Scaffold(
                  body: Center(
                    child: Loading(),
                  ),
                );
              } else if (state is DoaLoaded) {
                return ListDoa(
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                  state: state,
                  doa: state.listDoa,
                );
              } else {
                return const Scaffold(
                  body: Center(
                    child: Text('Terjadi Kesalahan!'),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
