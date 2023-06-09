import 'package:book_tickets/data/books_data.dart';
import 'package:book_tickets/modul/books/books_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/books.dart';

class HotBooks extends StatefulWidget {
  const HotBooks({
    super.key,
  });

  @override
  State<HotBooks> createState() => _HotBooksState();
}

class _HotBooksState extends State<HotBooks> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Hot Books"),
          trailing: IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text("Books"),
                  ),
                  body: const BooksScreen(),
                );
              }));
            },
          ),
        ),
        SizedBox(
          height: 200,
          child: PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            children:
                hotBooks.map((Books books) => HotBooks(books: books)).toList(),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            hotBooks.length,
            (index) => DotWidget(_pageIndex, index),
          ),
        )
      ],
    );
  }
}

class DotWidget extends StatelessWidget {
  int index;
  int itemIndex;
  DotWidget(
    this.index,
    this.itemIndex, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        radius: 5,
        backgroundColor: itemIndex == index ? Colors.black : Colors.grey,
      ),
    );
  }
}

class Ho extends StatelessWidget {
  Books books;
  Ho({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).pushNamed(
          'books-detail',
          params: {
            'id': books.id.toString(),
          },
          extra: books,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              books.image!,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black])),
            child: ListTile(
              title: Text(
                books.title!,
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              subtitle: Text(
                books.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
