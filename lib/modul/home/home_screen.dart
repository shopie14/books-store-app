import 'package:book_tickets/modul/books/books_screen.dart';
import 'package:book_tickets/modul/home/hot_book.dart';
import 'package:book_tickets/modul/home/lates_books.dart';
import 'package:book_tickets/modul/home/search_bar.dart';
import 'package:flutter/material.dart';
import '../../models/author.dart';

import '../menu/menu_screen.dart';
import 'header_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.author});

  Author author;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabIndex = 0;
  _selectedTabIndex(int value) {
    setState(() {
      _tabIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: Drawer(
        width: size.width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(color: Colors.grey[400]),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      foregroundImage:
                          NetworkImage(widget.author.profileImage!),
                    ),
                    Text(widget.author.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(widget.author.email),
                  ],
                )),
            Card(
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _tabIndex,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  HeaderWidget(data: widget.author),
                  const SearchbarWidget(),
                  const HotBooks(),
                  const LatesBooks()
                ],
              ),
            ),
            const BooksScreen(),
            const MenuScreen(),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  BottomNavigationBar bottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _tabIndex,
      onTap: _selectedTabIndex,
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Books",
          icon: Icon(Icons.newspaper),
        ),
        BottomNavigationBarItem(
          label: "Menu",
          icon: Icon(Icons.menu),
        )
      ],
    );
  }
}
