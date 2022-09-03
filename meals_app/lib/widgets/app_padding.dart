import 'package:flutter/material.dart';

class AppPadding extends StatelessWidget {
  const AppPadding({Key? key, required this.child}) : super(key: key);

  final Widget child;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: child,
    );
  }
}
