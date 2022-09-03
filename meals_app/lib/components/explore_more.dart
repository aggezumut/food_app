import 'package:flutter/material.dart';
import 'package:meals_app/widgets/app_text.dart';

class ExploreMore extends StatelessWidget {
  ExploreMore({Key? key}) : super(key: key);

  final List<IconData> _icons = [
    Icons.fastfood,
    Icons.restaurant,
    Icons.local_drink_rounded,
    Icons.kitchen,
  ];

  final List<Color> _colors = [
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.red,
  ];

  final List<String> _names = [
    "Fast Food",
    "Restaurant",
    "Drink",
    "Kitchen",
  ];


  Widget _buildCategory(int index) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: _colors[index].withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 80,
          width: 80,
          child: Icon(_icons[index],size: 30,color: _colors[index],),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: AppText.subtitle(text: _names[index]),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _icons.length,
        itemBuilder: (context, index) => _buildCategory(index),
      ),
    );
  }
}
