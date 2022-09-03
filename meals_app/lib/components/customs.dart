import 'package:flutter/material.dart';

class Customs extends StatefulWidget {
  const Customs({Key? key}) : super(key: key);

  @override
  State<Customs> createState() => _CustomsState();
}

class _CustomsState extends State<Customs> {
  List<int> numbers = [1, 2, 3, 4, 5];
  int selectedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: numbers.length,
        itemBuilder: (context, index) => _buildCustoms(index),
      ),
    );
  }

  _buildCustoms(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedNumber = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: selectedNumber == index ? Colors.grey : Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            "${numbers[index]}",
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
