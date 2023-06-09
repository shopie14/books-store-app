import 'package:book_tickets/data/books_data.dart';
import 'package:book_tickets/widget/books_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../models/books.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(title: Text("Books List")),
        Column(
          children:
              booksData.map((Books books) => BooksItems(books: books)).toList(),
        ),
      ],
    );
  }
}
