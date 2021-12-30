import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/transaction/p_stock_opname.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/admin/transaction/stock_opname/add_stock_opname/add_stock_opname.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StockOpnameScreen extends StatefulWidget {
  const StockOpnameScreen({Key? key}) : super(key: key);

  @override
  _StockOpnameScreenState createState() => _StockOpnameScreenState();
}

class _StockOpnameScreenState extends State<StockOpnameScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderStockOpname>(context, listen: false)
        .getListTransaction(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderStockOpname>(context, listen: false)
        .getListTransaction(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock Opname"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddStockOpname()));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderStockOpname>(
        builder: (context, data, _) => (data.modelListSO == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelListSO!.data == null)
                ? Container()
                : (data.modelListSO!.data!.arrayOpname!.length == 0)
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
                                data.modelListSO!.data!.arrayOpname!.length,
                            itemBuilder: (BuildContext context, int i) => Card(
                                  elevation: 0.4,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.modelListSO!.data!
                                                    .arrayOpname![i].roleNm ??
                                                "-",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Desc : ",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                data
                                                        .modelListSO!
                                                        .data!
                                                        .arrayOpname![i]
                                                        .keterangan ??
                                                    "-",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.date_range,
                                                color: Colors.grey,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                data.modelListSO!.data!
                                                    .arrayOpname![i].tanggal!
                                                    .substring(0, 10),
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                data.modelListSO!.data!
                                                    .arrayOpname![i].tanggal!
                                                    .substring(11, 19),
                                                style: TextStyle(fontSize: 14),
                                              ),
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
