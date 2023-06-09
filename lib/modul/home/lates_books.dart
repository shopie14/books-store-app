import 'package:book_tickets/data/books_data.dart';
import 'package:book_tickets/modul/books/books_screen.dart';
import 'package:book_tickets/widget/books_items.dart';
import 'package:flutter/material.dart';

import '../../models/books.dart';

class LatesBooks extends StatelessWidget {
  const LatesBooks({
    super.key,
  });

  Future<List<Books>> getdataNews() async {
    List<Books> bookslist = [];
    await Future.delayed(const Duration(seconds: 2), () {
      bookslist = booksData;
    });
    return bookslist;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Lates Book"),
          trailing: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text("Book"),
                    ),
                    body: const BooksScreen(),
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
                        (int i) => BooksItems(
                              books: booksData[i],
                            ))),
              );
            }
          },
        )
      ],
    );
  }
}
