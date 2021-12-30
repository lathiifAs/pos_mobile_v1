import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/transaction/p_pos.dart';
import 'package:pointofsales/views/admin/transaction/POS/cafe_resto/cafe_resto.dart';
import 'package:pointofsales/views/admin/transaction/POS/pos_retail/pos_retail.dart';
import 'package:provider/provider.dart';

class PosScreen extends StatefulWidget {
  const PosScreen({Key? key}) : super(key: key);

  @override
  _PosScreenState createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> {
  @override
  void initState() {
    // TODO: implement initState
    if (Provider.of<ProviderPos>(context, listen: false)
        .listDataCart
        .isNotEmpty) {
      Provider.of<ProviderPos>(context, listen: false).listDataCart.clear();
    }
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderPos>(context, listen: false);
      data.isCartNull = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("POS"),
            bottom: TabBar(tabs: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Cafe & Resto",
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Retail Bakery",
                ),
              ),
            ]),
          ),
          body: TabBarView(children: [CafeResto(), PosRetail()])),
    );
  }
}
