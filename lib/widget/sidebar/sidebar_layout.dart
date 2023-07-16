import 'package:anime_quotes/widget/sidebar/sidebar.dart';
import 'package:flutter/material.dart';
import '../pages/random_quotes/randomquotes.dart';

class SidebarLayout extends StatelessWidget {
  const SidebarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          RandomQuotes(),
          SideBar(),
        ],
      ),
    );
  }
}
