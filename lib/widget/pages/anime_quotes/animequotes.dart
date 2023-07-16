import 'package:flutter/material.dart';

class AnimeQuotes extends StatelessWidget {
  const AnimeQuotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'AnimeQuotes',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
