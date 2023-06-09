import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/books.dart';

class BooksItems extends StatelessWidget {
  BooksItems({
    super.key,
    required this.books,
  });

  Books books;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          GoRouter.of(context).pushNamed(
            "books-detail",
            params: {
              "id": books.id.toString(),
            },
            extra: books,
          );
        },
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        leading: Image.network(books.image!),
        title: Text(books.title!),
        subtitle: Text(
          books.description!,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
