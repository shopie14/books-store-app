import 'package:flutter/material.dart';
import '../../models/books.dart';

class BooksDetails extends StatefulWidget {
  final Books books;

  const BooksDetails({Key? key, required this.books}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BooksDetailsState createState() => _BooksDetailsState();
}

class _BooksDetailsState extends State<BooksDetails> {
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
            Image.network(widget.books.image!),
            const SizedBox(height: 1),
            Text(
              widget.books.title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 1),
            Row(
              children: [
                InkWell(
                  child: const Icon(
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
              widget.books.description!,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
