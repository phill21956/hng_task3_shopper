import 'package:flutter/material.dart';

class CustomAppBarHeader extends StatelessWidget {
  const CustomAppBarHeader({
    super.key,
    this.title = '',
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/Malltiverse.png',
          width: 90,
        ),
        const SizedBox(width: 20),
        Text(
          title,
          style:const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
