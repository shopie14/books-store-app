import 'package:flutter/material.dart';
import 'package:pertemuan_v/models/anime.dart';

import '../../data/animes_data.dart';
import '../../widget/news_item_widget.dart';
import '../anime_list/anime_screen.dart';

class LatesNewsWidget extends StatelessWidget {
  const LatesNewsWidget({
    super.key,
  });

  Future<List<News>> getdataNews() async {
    List<News> newslist = [];
    await Future.delayed(const Duration(seconds: 2), () {
      newslist = newsData;
    });
    return newslist;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Lates News"),
          trailing: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text("News"),
                    ),
                    body: const NewsScreen(),
                  );
                }));
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              )),
        ),
        FutureBuilder(
          future: getdataNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                    children: List.generate(
                        3,
                        (int i) => NewsItemWidget(
                              news: newsData[i],
                            ))),
              );
            }
          },
        )
      ],
    );
  }
}