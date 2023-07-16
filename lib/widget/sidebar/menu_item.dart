import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTapFunction;

  const MenuItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTapFunction});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Padding(
        padding: EdgeInsets.fromLTRB(32, 10, 10, 10),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 30,
              color: Colors.cyan,
            ),
            SizedBox(
              width: 22,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 26.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
