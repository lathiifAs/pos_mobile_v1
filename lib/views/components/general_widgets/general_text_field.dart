import 'package:flutter/material.dart';

class GeneralTextField extends StatelessWidget {
  const GeneralTextField({
    Key? key,
    this.controller,
    required this.label,
    this.hintText,
    this.inputType = TextInputType.text,
    this.onChanged,
    this.colorHint,
    this.onTap,
    this.readOnly = false,
    this.inputFormatters,
    this.onSubmitted,
    this.height,
    this.maxLines,
    this.suffixIcon,
    this.prefixText,
    this.obscureText = false,
  }) : super(key: key);

  final label;
  final controller;
  final hintText;
  final inputType;
  final onChanged;
  final colorHint;
  final onTap;
  final readOnly;
  final inputFormatters;
  final onSubmitted;
  final height;
  final maxLines;
  final suffixIcon;
  final prefixText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey.shade300)),
          child: TextField(
            controller: controller,
            keyboardType: inputType,
            onChanged: onChanged,
            maxLines: maxLines,
            onTap: onTap,
            onSubmitted: onSubmitted,
            readOnly: readOnly,
            inputFormatters: inputFormatters,
            obscureText: obscureText,
            decoration: InputDecoration(
                suffixIcon: suffixIcon,
                prefixText: prefixText,
                prefixStyle: TextStyle(color: Colors.black),
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 13, color: colorHint)),
          ),
        ),
      ],
    );
  }
}
