import 'package:book_tickets/modul/books_details/books_detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/author.dart';
import '../models/books.dart';
import '../modul/home/home_screen.dart';
import '../modul/profile/profile_screen.dart';
import '../modul/splashscreen/splash_screen.dart';

class AppRoutes {
  static const String splash = 'splash';
  static const String home = 'home';
  static const String booksDetails = 'books-details';
  static const String profile = 'profile';

  static Page _splashScreenRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      key: state.pageKey,
      child: const SplashScreen(),
    );
  }

  static Page _homeScreenRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    late Author author;
    if (state.extra != null && state.extra is Author) {
      author = state.extra as Author;
    } else {
      author = Author(
        id: 000,
        name: "No name",
        authorName: "no name",
        email: "email@example.com",
        profileImage:
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
        phoneNumber: "+123456789",
      );
    }
    return CustomTransitionPage(
      child: HomeScreen(key: state.pageKey, author: author),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  static Page _booksDetailsRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    if (state.params['id'] != null) {
      return MaterialPage(
          child: BooksDetails(
        books: state.extra as Books,
      ));
    } else {
      return const MaterialPage(
          child: Scaffold(
        body: Center(
          child: Text("Data Not Found"),
        ),
      ));
    }
  }

  static Page _profileRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    late Author author;
    if (state.extra != null && state.extra is Author) {
      author = state.extra as Author;
    } else {
      author = Author(
        id: 000,
        name: "No name",
        authorName: "no name",
        email: "email@example.com",
        profileImage:
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
        phoneNumber: "+123456789",
      );
    }
    return MaterialPage(child: ProfileScreen(author: author));
  }

  static final GoRouter goRouter = GoRouter(
    routerNeglect: true,
    routes: [
      GoRoute(
        name: splash,
        path: "/splash",
        pageBuilder: _splashScreenRouteBuilder,
      ),
      GoRoute(
        name: home,
        path: "/home",
        pageBuilder: _homeScreenRouteBuilder,
      ),
      GoRoute(
        name: booksDetails,
        path: "/books-details/:id",
        pageBuilder: _booksDetailsRouteBuilder,
      ),
      GoRoute(
        name: profile,
        path: "/profile",
        pageBuilder: _profileRouteBuilder,
      ),
    ],
    initialLocation: "/splash",
  );
}
