import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

class DropdownTypeService extends StatelessWidget {
  const DropdownTypeService({
    Key? key,
    required this.data,
  }) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: FindDropdown<String?>(
        label: "Type Service *",
        selectedItem: (data.typeService == null) ? "Choose" : data.typeService,
        labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        items: ["Dine In", "Take Away", "Delivery"],
        onChanged: (val) => data.typeService = val!,
        dropdownBuilder: (c, v) {
          return Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.grey.shade300),
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
      ),
    );
  }
}
