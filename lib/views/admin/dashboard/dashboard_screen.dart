import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pointofsales/providers/admin/p_auth.dart';
import 'package:pointofsales/providers/admin/p_dashboard.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/ADMIN/master_data/admin_account/admin_account_screen.dart';
import 'package:pointofsales/views/ADMIN/master_data/konversi_satuan/konversi_satuan_screen.dart';
import 'package:pointofsales/views/ADMIN/master_data/product/product.dart';
import 'package:pointofsales/views/ADMIN/master_data/product_group/product_group_screen.dart';
import 'package:pointofsales/views/ADMIN/master_data/sales_group/sales_group_screen.dart';
import 'package:pointofsales/views/ADMIN/master_data/sub_product_group/sub_product_group_screen.dart';
import 'package:pointofsales/views/ADMIN/master_data/supplier/supplier_screen.dart';
import 'package:pointofsales/views/ADMIN/master_data/type_of_payment/type_of_payment_screen.dart';
import 'package:pointofsales/views/ADMIN/master_data/unit/unit_screen.dart';
import 'package:pointofsales/views/admin/master_data/discount/main_discount.dart';
import 'package:pointofsales/views/admin/master_data/kitchen/kitchen_screen.dart';
import 'package:pointofsales/views/admin/master_data/outlet/outlet_account/list_outlet.dart';
import 'package:pointofsales/views/admin/master_data/outlet/outlet_master/outlet_master.dart';

import 'package:pointofsales/views/admin/master_data/printer_setting/printer_settings.dart';
import 'package:pointofsales/views/admin/master_data/table/list_outlet_screen.dart';
import 'package:pointofsales/views/admin/master_data/warehouse/warehouse_account/warehouse_account_screen.dart';
import 'package:pointofsales/views/admin/master_data/warehouse/warehouse_master/warehouse_master.dart';

import 'package:pointofsales/views/admin/settings/preferences_screen.dart';

import 'package:pointofsales/views/admin/transaction/POS/pos_screen.dart';
import 'package:pointofsales/views/admin/transaction/purchasing/purchasing.dart';
import 'package:pointofsales/views/admin/transaction/stock_opname/stock_opname_screen.dart';
import 'package:pointofsales/views/admin/transaction/warehouse_mutation/warehouse_mutation.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<ProviderDashboardAdmin>(
      builder: (context, data, _) => Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
        ),
        drawer: buildDrawer(data, context),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
                child: buildCardSales(),
              ),
              GridView.count(
                primary: false,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: const EdgeInsets.all(kDefaultPadding),
                crossAxisSpacing: kDefaultPadding,
                mainAxisSpacing: kDefaultPadding,
                crossAxisCount: 3,
                children: <Widget>[
                  CardMenuDashboard(
                    image: 'assets/images/icons8-cheque-64.png',
                    label: 'POS',
                  ),
                  CardMenuDashboard(
                    image: 'assets/images/icons8-cheque-64.png',
                    label: 'POS',
                  ),
                  CardMenuDashboard(
                    image: 'assets/images/icons8-cheque-64.png',
                    label: 'POS',
                  ),
                  CardMenuDashboard(
                    image: 'assets/images/icons8-cheque-64.png',
                    label: 'POS',
                  ),
                  CardMenuDashboard(
                    image: 'assets/images/icons8-cheque-64.png',
                    label: 'POS',
                  ),
                  CardMenuDashboard(
                    image: 'assets/images/icons8-cheque-64.png',
                    label: 'POS',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildCardSales() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/icons8-money-64.png',
                width: 30,
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sales'),
                  Text(
                    'Nov 2021',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Text(
            'Rp. 5.000.000',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Drawer buildDrawer(ProviderDashboardAdmin data, BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.fromLTRB(kDefaultPadding, 50, kDefaultPadding, 0),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: 80,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: kDefaultPadding / 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Admin")
                  ],
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              data.isDrawerMasterDataShow = !data.isDrawerMasterDataShow;
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Master Data",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
                  ),
                  Icon(
                    data.isDrawerMasterDataShow == true
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                  )
                ],
              ),
            ),
          ),
          (data.isDrawerMasterDataShow == false)
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => RoleScreen()));
                    //   },
                    //   child: Row(
                    //     children: [
                    //       Image.asset(
                    //         "assets/images/role.png",
                    //         width: 25,
                    //         height: 25,
                    //       ),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Text(
                    //         "Group User",
                    //         style: TextStyle(fontSize: 17),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: kDefaultPadding,
                    // ),
                    InkWell(
                      onTap: () {
                        data.isDrawerOutlet = !data.isDrawerOutlet;
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/cafe.png",
                                  width: 25,
                                  height: 25,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Outlet",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            Icon(
                              data.isDrawerOutlet == true
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_right,
                            )
                          ],
                        ),
                      ),
                    ),
                    (data.isDrawerOutlet == false)
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(left: 35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Outletmaster()));
                                  },
                                  child: Row(
                                    children: [
                                      // Image.asset(
                                      //   "assets/images/cafe.png",
                                      //   width: 25,
                                      //   height: 25,
                                      // ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      Text(
                                        "-  Outlet Master",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OutletAccount()));
                                  },
                                  child: Row(
                                    children: [
                                      // Image.asset(
                                      //   "assets/images/cafe-acount.png",
                                      //   width: 25,
                                      //   height: 25,
                                      // ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      Text(
                                        "-  Outlet Account",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        data.isDrawerWarehouse = !data.isDrawerWarehouse;
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/warehouse.png",
                                  width: 25,
                                  height: 25,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Warehouse",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            Icon(
                              data.isDrawerWarehouse == true
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_right,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    (data.isDrawerWarehouse == false)
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(left: 35),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(WarehouseMaster());
                                  },
                                  child: Row(
                                    children: [
                                      // Image.asset(
                                      //   "assets/images/warehouse.png",
                                      //   width: 25,
                                      //   height: 25,
                                      // ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      Text(
                                        "-  Warehouse Master",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WarehouseAccountScreen()));
                                  },
                                  child: Row(
                                    children: [
                                      // Image.asset(
                                      //   "assets/images/warehouse.png",
                                      //   width: 25,
                                      //   height: 25,
                                      // ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      Text(
                                        "-  Warehouse Account",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                              ],
                            ),
                          ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SupplierScreen()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/suplier.png",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Supplier",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        data.isDrawerProduct = !data.isDrawerProduct;
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/product.png",
                                  width: 25,
                                  height: 25,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Product",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            Icon(
                              data.isDrawerProduct == true
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_right,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    (data.isDrawerProduct == false)
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(left: 35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductGroupScreen()));
                                  },
                                  child: Row(
                                    children: [
                                      // Image.asset(
                                      //   "assets/images/product-group.png",
                                      //   width: 25,
                                      //   height: 25,
                                      // ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      Text(
                                        "-  Product Group",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SubProductGroupScreen()));
                                  },
                                  child: Row(
                                    children: [
                                      // Image.asset(
                                      //   "assets/images/product-group.png",
                                      //   width: 25,
                                      //   height: 25,
                                      // ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      Text(
                                        "-  Sub Product Group",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductScreen()));
                                  },
                                  child: Row(
                                    children: [
                                      // Image.asset(
                                      //   "assets/images/product.png",
                                      //   width: 25,
                                      //   height: 25,
                                      // ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      Text(
                                        "-  Product",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                              ],
                            ),
                          ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SalesGroupScreen()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/sales-group.png",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sales Group",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        data.isDrawerUOM = !data.isDrawerUOM;
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/unit.png",
                                  width: 25,
                                  height: 25,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "UOM",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            Icon(
                              data.isDrawerUOM == true
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_right,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    (data.isDrawerUOM == false)
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(left: 35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UnitScreen()));
                                  },
                                  child: Row(
                                    children: [
                                      // Image.asset(
                                      //   "assets/images/unit.png",
                                      //   width: 25,
                                      //   height: 25,
                                      // ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      Text(
                                        "-  UOM",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                KonversiSatuanScreen()));
                                  },
                                  child: Row(
                                    children: [
                                      // Image.asset(
                                      //   "assets/images/unit.png",
                                      //   width: 25,
                                      //   height: 25,
                                      // ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      Text(
                                        "-  UOM Conversion",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                              ],
                            ),
                          ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListOutletScreen()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/table.png",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Table",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KitchenScreen()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/kitchen.png",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Kitchen",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TypeOfPaymentScreen()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/payment-method.png",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Type of Payment",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          SizedBox(
            height: kDefaultPadding,
          ),
          InkWell(
            onTap: () {
              data.isDrawerTransaction = !data.isDrawerTransaction;
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Transaction",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
                  ),
                  Icon(
                    data.isDrawerTransaction == true
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                  )
                ],
              ),
            ),
          ),
          (data.isDrawerTransaction == false)
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PurchasingScreen()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/purchasing.png",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Purchasing",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WarehouseMutation()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/warehouse-mutation.png",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Warehouse Mutation",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PosScreen()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/pos.png",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "POS",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StockOpnameScreen()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/stok-opname.png",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Stock Opname",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          SizedBox(
            height: kDefaultPadding,
          ),
          InkWell(
            onTap: () {
              data.isDrawerSettings = !data.isDrawerSettings;
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
                  ),
                  Icon(
                    data.isDrawerSettings == true
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                  )
                ],
              ),
            ),
          ),
          (data.isDrawerSettings == false)
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PreferencesScreen()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/discount.png",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Preferences",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainDiscount()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/discount.png",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Discount",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminAccount()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/admin-acount.png",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Admin Account",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () => Get.to(PrinterSettingsScreen()),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/print.png",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Setting Printer",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          SizedBox(
            height: kDefaultPadding,
          ),
          InkWell(
            onTap: () {
              data.isDrawerReporting = !data.isDrawerReporting;
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reporting",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
                  ),
                  Icon(
                    data.isDrawerReporting == true
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                  )
                ],
              ),
            ),
          ),
          (data.isDrawerReporting == false)
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PreferencesScreen()));
                      },
                      child: Container(
                          width: double.infinity,
                          child: Text(
                            "- Sales Transaction",
                            style: TextStyle(fontSize: 17),
                          )),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PreferencesScreen()));
                      },
                      child: Container(
                          width: double.infinity,
                          child: Text(
                            "- Stock Transaction",
                            style: TextStyle(fontSize: 17),
                          )),
                    ),
                  ],
                ),
          SizedBox(
            height: kDefaultPadding,
          ),
          InkWell(
            onTap: () {
              Provider.of<ProviderAuth>(context, listen: false).logout();
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                        color: Colors.red),
                  ),
                  Icon(
                    Icons.logout,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}

class CardMenuDashboard extends StatelessWidget {
  const CardMenuDashboard({
    Key? key,
    required this.label,
    required this.image,
  }) : super(key: key);

  final String label;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(image),
          Text(label),
        ],
      ),
    );
  }
}
