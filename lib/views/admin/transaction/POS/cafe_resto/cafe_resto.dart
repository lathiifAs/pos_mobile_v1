import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/transaction/p_pos.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/admin/transaction/POS/cafe_resto/checkout/checkout_cafe.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CafeResto extends StatefulWidget {
  const CafeResto({Key? key}) : super(key: key);

  @override
  _CafeRestoState createState() => _CafeRestoState();
}

class _CafeRestoState extends State<CafeResto> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderPos>(context, listen: false)
        .getListTransaction(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderPos>(context, listen: false)
        .getListTransaction(context);
    Provider.of<ProviderPos>(context, listen: false).getPPNandServices(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Consumer<ProviderPos>(
        builder: (context, data, _) => (data.modelListTransaction == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelListTransaction!.data == null)
                ? Container()
                : (data.modelListTransaction!.data!.arrayList!.length == 0)
                    ? SmartRefresher(
                        enablePullDown: true,
                        header: WaterDropHeader(),
                        controller: _refreshController,
                        onRefresh: _onRefresh,
                        child: EmptyData(),
                      )
                    : SmartRefresher(
                        enablePullDown: true,
                        header: WaterDropHeader(),
                        controller: _refreshController,
                        onRefresh: _onRefresh,
                        child: ListView.builder(
                            padding: EdgeInsets.all(10),
                            itemCount: data
                                .modelListTransaction!.data!.arrayList!.length,
                            itemBuilder: (BuildContext context, int i) => Card(
                                  elevation: 0.4,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CheckoutCafe(
                                                    transaksiId: data
                                                        .modelListTransaction!
                                                        .data!
                                                        .arrayList![i]
                                                        .transaksiId
                                                        .toString(),
                                                  )));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width:
                                                    SizeConfig.screenWidth * 0.3,
                                                child: Text(
                                                  "Cafe Name",
                                                  style: TextStyle(fontSize: 13),
                                                ),
                                              ),
                                              Text(
                                                " : ",
                                                style: TextStyle(fontSize: 13),
                                              ),
                                              Expanded(
                                                  child: Text(
                                                      data
                                                              .modelListTransaction!
                                                              .data!
                                                              .arrayList![i]
                                                              .namaToko ??
                                                          "-",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold)))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width:
                                                    SizeConfig.screenWidth * 0.3,
                                                child: Text(
                                                  "Customer Name",
                                                  style: TextStyle(fontSize: 13),
                                                ),
                                              ),
                                              Text(
                                                " : ",
                                                style: TextStyle(fontSize: 13),
                                              ),
                                              Expanded(
                                                  child: Text(
                                                      (data
                                                                  .modelListTransaction!
                                                                  .data!
                                                                  .arrayList![i]
                                                                  .namaPemesan ==
                                                              "")
                                                          ? "-"
                                                          : data
                                                              .modelListTransaction!
                                                              .data!
                                                              .arrayList![i]
                                                              .namaPemesan!,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold)))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width:
                                                    SizeConfig.screenWidth * 0.3,
                                                child: Text(
                                                  "Table",
                                                  style: TextStyle(fontSize: 13),
                                                ),
                                              ),
                                              Text(
                                                " : ",
                                                style: TextStyle(fontSize: 13),
                                              ),
                                              Expanded(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      data
                                                              .modelListTransaction!
                                                              .data!
                                                              .arrayList![i]
                                                              .mejaNomor ??
                                                          "-",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 2),
                                                    decoration: BoxDecoration(
                                                        color: (data
                                                                    .modelListTransaction!
                                                                    .data!
                                                                    .arrayList![i]
                                                                    .jenisOrder ==
                                                                "makan_ditempat")
                                                            ? Colors.blue
                                                            : (data
                                                                        .modelListTransaction!
                                                                        .data!
                                                                        .arrayList![
                                                                            i]
                                                                        .jenisOrder ==
                                                                    "take_away")
                                                                ? Colors.amber
                                                                : Colors.green
                                                                    .shade800,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                30)),
                                                    child: Text(
                                                      (data
                                                                  .modelListTransaction!
                                                                  .data!
                                                                  .arrayList![i]
                                                                  .jenisOrder ==
                                                              "makan_ditempat")
                                                          ? "Dine In"
                                                          : (data
                                                                      .modelListTransaction!
                                                                      .data!
                                                                      .arrayList![
                                                                          i]
                                                                      .jenisOrder ==
                                                                  "take_away")
                                                              ? "Take Away"
                                                              : "Delivery",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white),
                                                    ),
                                                  )
                                                ],
                                              ))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                      ),
      ),
    );
  }
}
