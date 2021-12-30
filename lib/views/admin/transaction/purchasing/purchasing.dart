import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pointofsales/providers/admin/transaction/p_purchasing.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/admin/transaction/purchasing/add_purchasing/add_purchasing.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PurchasingScreen extends StatefulWidget {
  const PurchasingScreen({Key? key}) : super(key: key);

  @override
  _PurchasingScreenState createState() => _PurchasingScreenState();
}

class _PurchasingScreenState extends State<PurchasingScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderPurchasing>(context, listen: false)
        .getListPurchasing(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderPurchasing>(context, listen: false)
        .getListPurchasing(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("List Purchasing"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPurchasing()));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderPurchasing>(
        builder: (context, data, _) => (data.modelListPurchasing == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelListPurchasing!.data == null)
                ? Container()
                : (data.modelListPurchasing!.data!.arrayList!.length == 0)
                    ? SmartRefresher(
                        enablePullDown: true,
                        header: WaterDropHeader(),
                        controller: _refreshController,
                        onRefresh: _onRefresh,
                        child: Center(
                          child: EmptyData(),
                        ),
                      )
                    : SmartRefresher(
                        enablePullDown: true,
                        header: WaterDropHeader(),
                        controller: _refreshController,
                        onRefresh: _onRefresh,
                        child: ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount:
                              data.modelListPurchasing!.data!.arrayList!.length,
                          itemBuilder: (BuildContext context, int i) => Card(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    child: Text(
                                                      // 'Warehouse : Timika Papua Dimika',
                                                      'Warehouse',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    // 'Warehouse : Timika Papua Dimika',
                                                    ':  ' +
                                                        "${data.modelListPurchasing!.data!.arrayList![i].namaGudang ?? '-'}",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    child: Text(
                                                      // 'Warehouse : Timika Papua Dimika',
                                                      'Supplier',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    ':  ' +
                                                        "${data.modelListPurchasing!.data!.arrayList![i].supplierNama}",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                data
                                                        .modelListPurchasing!
                                                        .data!
                                                        .arrayList![i]
                                                        .tglReformat ??
                                                    "-",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
      ),
    );
  }
}
