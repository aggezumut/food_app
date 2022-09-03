import 'package:flutter/material.dart';


import 'app_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(10),
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppText.card(text: text),
          ],
        ),
      );
  }
}