import 'package:flutter/material.dart';
import 'package:pointofsales/utils/constants.dart';

class GeneralButtonBorder extends StatelessWidget {
  const GeneralButtonBorder({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          label,
          style: TextStyle(
              color: kButtonColor, fontSize: 13, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: kButtonColor),
            borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}
