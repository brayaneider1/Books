import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const TitleWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Icon(icon, size: 50,color: Color.fromARGB(255, 90, 31, 194),),
          const SizedBox(height: 16),
        ],
      );
}
