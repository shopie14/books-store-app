import 'package:flutter/material.dart';
import '../../data/books_data.dart';
import '../../models/books.dart';
import '../../widget/books_items.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const ListTile(
            title: Text("Anime Article List",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
        Column(
          children:
              booksData.map((Books books) => BooksItems(books: books)).toList(),
        )
      ],
    );
  }
}