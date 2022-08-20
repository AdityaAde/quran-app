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
                  backgroundImage: const AssetImage('assets/images/border.png'),
                  radius: 17,
                  backgroundColor: Colors.transparent,
                  child: Text(
                    "${index + 1}",
                    style: textTheme.bodyLarge!,
                  )),
              title: Text(data['surah'].toString().replaceAll("+", "'")),
              subtitle: Text(
                "Ayat ${data['ayat']}",
                style: textTheme.bodyLarge!.copyWith(color: colorScheme.onBackground.withOpacity(0.6)),
              ),
              trailing: IconButton(
                onPressed: () {
                  context.read<BookmarkBloc>().add(DeleteBookmarkEvent(id: data['id']));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                      'Berhasil hapus bookmark',
                      style: TextStyle(color: Colors.white),
                    )),
                  );
                },
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
