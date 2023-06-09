import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pertemuan_v/data/animes_data.dart';
import 'package:pertemuan_v/models/anime.dart';
import 'package:pertemuan_v/modul/home/header_widget.dart';
import 'package:pertemuan_v/widget/news_item_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(title: Text("Anime List")),
        Column(
          children:
              newsData.map((News news) => NewsItemWidget(news: news)).toList(),
        ),
      ],
    );
  }
}