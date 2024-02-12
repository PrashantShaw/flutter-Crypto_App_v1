import 'package:crypto_app_01/utils/util.dart';
import 'package:flutter/material.dart';

class ChartFilterButton extends StatelessWidget {
  final String name;
  final bool isActive;
  void Function()? onPressed;

  ChartFilterButton({
    super.key,
    required this.name,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor:
              isActive ? MaterialStatePropertyAll(Colors.grey.shade100) : null),
      onPressed: onPressed,
      child: Text(name,
          style: textStyle(14, isActive ? Colors.black : Colors.grey.shade400,
              FontWeight.w400)),
    );
  }
}
