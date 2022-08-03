import 'package:flutter/material.dart';
import 'package:quran_app/provider/bookmarks/bookmark_repository.dart';

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
    BookmarkRepository bookmarkRepository = BookmarkRepository();
    return Scaffold(
      appBar: AppBarCustom.appBarCustom(
        context,
        'Bookmarks',
        textTheme,
        colorScheme,
        const SizedBox(),
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
            future: bookmarkRepository.getBookmark(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    "Bookmark tidak tersedia",
                    style: textTheme.headline4!.copyWith(fontWeight: FontWeight.w300),
                  ),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data = snapshot.data![index];
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
                  });
            })),
      ),
    );
  }
}
