import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack (
      children: [
        Image.asset(
          'assets/img/bag.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ],

    );
  }
}