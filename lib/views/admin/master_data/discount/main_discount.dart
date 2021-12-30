import 'package:flutter/material.dart';
import 'package:pointofsales/views/admin/master_data/discount/discount_screen.dart';
import 'package:pointofsales/views/admin/master_data/discount/discount_type_get.dart';

class MainDiscount extends StatefulWidget {
  const MainDiscount({Key? key}) : super(key: key);

  @override
  _MainDiscountState createState() => _MainDiscountState();
}

class _MainDiscountState extends State<MainDiscount> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Discount",
          ),
          bottom: TabBar(tabs: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Discount Percentage",
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Discount Get",
              ),
            ),
          ]),
        ),
        body: TabBarView(
            children: [DiscountScreen(), DiscountTypeGet()]),
      ),
    );
  }
}
