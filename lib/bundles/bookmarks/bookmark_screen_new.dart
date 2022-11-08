import 'package:flutter/material.dart';
import 'package:quran_app/components/app_bar_custom.dart';

/// TODO: Halaman bookmark terbaru
class BookmarkScreenNew extends StatelessWidget {
  const BookmarkScreenNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarCustom.appBarCustom(
          context,
          'Bookmark',
          textTheme,
          colorScheme,
          const SizedBox(),
          TabBar(
            indicatorColor: Colors.purple,
            unselectedLabelColor: Colors.black.withOpacity(0.4),
            labelColor: Colors.black,
            tabs: const [
              Tab(text: 'Surah'),
              Tab(text: 'Doa-Doa'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: const AssetImage('assets/images/border.png'),
                      radius: 17,
                      backgroundColor: Colors.transparent,
                      child: Text(
                        "1",
                        style: textTheme.bodyLarge!,
                      )),
                  title: const Text('Al-Fatihah'),
                  subtitle: Text(
                    "Ayat 1",
                    style: textTheme.bodyLarge!.copyWith(color: colorScheme.onBackground.withOpacity(0.6)),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: const AssetImage('assets/images/border.png'),
                      radius: 17,
                      backgroundColor: Colors.transparent,
                      child: Text(
                        "1",
                        style: textTheme.bodyLarge!,
                      )),
                  title: const Text('Doa Sebelum Tidur'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
