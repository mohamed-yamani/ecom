import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  String title;
  TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Container(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            height: 8,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
