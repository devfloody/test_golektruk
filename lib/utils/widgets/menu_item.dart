import 'package:flutter/material.dart';

import '../fonts/app_font.dart';

class MenuButtonItem extends StatelessWidget {
  const MenuButtonItem({
    Key? key,
    required this.color,
    required this.title,
    required this.questionNumber,
    required this.onPressed,
  }) : super(key: key);

  final Color color;
  final String title;
  final String questionNumber;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questionNumber,
            style: AppFont.poppinsSemiBold.copyWith(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            title,
            style: AppFont.poppinsMedium.copyWith(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
