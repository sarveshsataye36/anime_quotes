import 'package:flutter/material.dart';

class CharacterQuotes extends StatelessWidget {
  const CharacterQuotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'CharacterQuotes',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
