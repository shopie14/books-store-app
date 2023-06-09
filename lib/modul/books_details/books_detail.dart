import 'package:flutter/material.dart';
import 'package:pertemuan_v/models/anime.dart';

class NewsDetailScreen extends StatefulWidget {
  final News news;

  NewsDetailScreen({Key? key, required this.news}) : super(key: key);

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anime Detail"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Image.network(widget.news.image!),
            const SizedBox(height: 1),
            Text(
              widget.news.title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 1),
            Row(
              children: [
                InkWell(
                  child: Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 24.0,
                  ),
                  onTap: () {
                    setState(() {
                      _rating = (_rating + 1) % 11;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Rating increased to $_rating')),
                    );
                  },
                ),
                const SizedBox(width: 5),
                Text(
                  'Rating $_rating / 10',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 1),
            Text(
              widget.news.description!,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}