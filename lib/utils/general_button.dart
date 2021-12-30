import 'package:flutter/material.dart';
import 'package:pointofsales/utils/constants.dart';

class GeneralButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final Color? color;

  const GeneralButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.height = 54,
      this.width = double.infinity,
      this.color = kPrimaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
        width: width,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                primary: color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
            child: Text("$label")));
  }
}
