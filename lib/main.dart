import 'package:anime_quotes/widget/sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimeQuotesApp());
}

class AnimeQuotesApp extends StatelessWidget {
  const AnimeQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
      ),
      home: SafeArea(child: SidebarLayout()),
    );
  }
}

