import 'package:flutter/material.dart';
import 'package:pointofsales/utils/constants.dart';

class DefaultTextInput extends StatelessWidget {
  const DefaultTextInput({
    Key? key,
    this.controller,
    required this.labelText,
    this.initialValue,
    this.onChanged,
    this.keyboardType,
    this.suffixIcon,
    required this.readOnly,
    required this.obscureText,
    this.onTap,
    this.hintText,
    this.floatingLabelBehavior,
    this.inputFormatters,
    this.prefixText,
  }) : super(key: key);

  final controller;
  final labelText;
  final initialValue;
  final onChanged;
  final keyboardType;
  final suffixIcon;
  final readOnly;
  final obscureText;
  final onTap;
  final hintText;
  final floatingLabelBehavior;
  final inputFormatters;
  final prefixText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 7, 5, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 4.0,
          ),
        ],
      ),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText,
        readOnly: readOnly,
        onTap: onTap,
        inputFormatters: inputFormatters,
        style: TextStyle(fontSize: 13),
        decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            prefixText: prefixText,
            labelStyle: TextStyle(fontSize: 14, color: Colors.black),
            floatingLabelBehavior: floatingLabelBehavior,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              // borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              // borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: suffixIcon),
      ),
    );
  }
}
