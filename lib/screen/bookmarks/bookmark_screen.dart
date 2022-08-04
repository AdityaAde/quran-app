import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/bloc.dart';

import '../../components/components.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  static const String routeName = '/bookmarks';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const BookmarkScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBarCustom.appBarCustom(
          context,
          'Bookmarks',
          textTheme,
          colorScheme,
          const SizedBox(),
        ),
        body: BlocBuilder<BookmarkBloc, BookmarkState>(
          builder: (context, state) {
            if (state is BookmarkLoading) {
              return _loading();
            } else if (state is GetBookmarkEmpty) {
              return _bookmarkIsEmpty(textTheme);
            } else if (state is GetBookmarkLoadedState) {
              return _bookmarkLoaded(state, colorScheme, textTheme);
            } else {
              return const Center(child: Text('Something Went Wrong'));
            }
          },
        ));
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _bookmarkIsEmpty(TextTheme textTheme) {
    return Center(
      child: Text(
        "Bookmark tidak tersedia",
        style: textTheme.headline4!.copyWith(fontWeight: FontWeight.w300),
      ),
    );
  }

  ListView _bookmarkLoaded(GetBookmarkLoadedState state, ColorScheme colorScheme, TextTheme textTheme) {
    return ListView.builder(
      itemCount: state.listBookmarks.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> data = state.listBookmarks[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          child: Card(
            elevation: 3,
            child: ListTile(
              onTap: () {},
              leading: CircleAvatar(
                  radius: 17,
                  backgroundColor: colorScheme.primary,
                  child: Text(
                    "${index + 1}",
                    style: textTheme.bodyLarge!.copyWith(color: Colors.white),
                  )),
              title: Text(data['surah'].toString().replaceAll("+", "'")),
              subtitle: Text(
                "Ayat ${data['ayat']}",
                style: textTheme.bodyLarge!.copyWith(color: Colors.black.withOpacity(0.6)),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
                color: Colors.red,
              ),
            ),
          ),
        );
      },
    );
  }
}
