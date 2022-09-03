import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton.pageView({Key? key, required this.width, required this.press, required this.child}) : super(key: key);
  const AppButton.basket({Key? key, required this.width, required this.press, required this.child}) : super(key: key);

  final double width;
  final Function press;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
        ),
        onPressed: () {
          press();
        },
        child: child,
      ),
    );
  }
}
