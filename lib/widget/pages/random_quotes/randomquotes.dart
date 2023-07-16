import 'package:flutter/material.dart';

class RandomQuotes extends StatelessWidget {
  const RandomQuotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'RandomQuotes',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
