import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Color color;
  double size;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppButton({Key? key,
    required this.size,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    this.text,
    this.icon,
    this.isIcon = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0
        ),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isIcon == false ? Center(child: AppText(text: text!, color: color,)) :
      Center(child: Icon(icon, color: color,)),
    );
  }
}
