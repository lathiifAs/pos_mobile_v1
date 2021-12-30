import 'package:flutter/material.dart';

class GeneralSwitch extends StatelessWidget {
  const GeneralSwitch({
    Key? key,
    required this.label,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  final String label;
  final value;
  final onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300, width: 1),
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          Switch(
            inactiveThumbColor: Colors.red,
            inactiveTrackColor: Colors.red[100],
            value: value,
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}
