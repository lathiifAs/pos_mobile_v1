import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

class DefaultDropdown extends StatelessWidget {
  const DefaultDropdown({
    Key? key,
    this.label,
    required this.selectedItem,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  final String? label;
  final String selectedItem;
  final onChanged;
  final items;

  @override
  Widget build(BuildContext context) {
    return FindDropdown<String?>(
      label: label,
      selectedItem: selectedItem,
      labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      onChanged: onChanged,
      items: items,
      dropdownBuilder: (c, v) {
        return Container(
            width: double.infinity,
            height: 60,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.grey.shade300)
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey,
                //     offset: Offset(0.0, 1.0),
                //     //(x,y)
                //     blurRadius: 4.0,
                //   ),
                // ],
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "$v",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.arrow_drop_down_outlined)
              ],
            ));
      },
    );
  }
}
