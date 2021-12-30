import 'package:flutter/material.dart';
import 'package:pointofsales/utils/constants.dart';

class TextFieldPrinter extends StatelessWidget {
  final String title;
  final String hint;
  final int maxLines;
  final String noted;
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  const TextFieldPrinter({Key? key, required this.title, required this.hint, this.maxLines=1, required this.noted, this.controller, this.onChange, this.textInputType, this.textInputAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "$title",
          style: blackBoldTextStyle,
        ),
        TextField(
          controller: controller,
          maxLines: maxLines,
          onChanged:onChange,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)),
            hintText: "$hint",
          ),
        ),
        SizedBox(
          height: 10,
        ),
         Text(
          "* $noted",
          style: blackItalicTextStyle,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
