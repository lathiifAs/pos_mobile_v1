import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/transaction/p_warehouse_mutation.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/admin/transaction/warehouse_mutation/add_warehouse_mutation/add_warehouse_mutation.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WarehouseMutation extends StatefulWidget {
  const WarehouseMutation({Key? key}) : super(key: key);

  @override
  _WarehouseMutationState createState() => _WarehouseMutationState();
}

class _WarehouseMutationState extends State<WarehouseMutation> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderWarehouseMutation>(context, listen: false)
        .getList(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderWarehouseMutation>(context, listen: false)
        .getList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Warehouse Mutation"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddWarehouseMutation()));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderWarehouseMutation>(
        builder: (context, data, _) => (data.modelListWarehouseMut == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelListWarehouseMut!.data == null)
                ? Container()
                : (data.modelListWarehouseMut!.data!.arrayList!.length == 0)
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
                        child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(),
                          itemCount: data
                              .modelListWarehouseMut!.data!.arrayList!.length,
                          itemBuilder: (BuildContext context, int i) => InkWell(
                              onTap: () {},
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              data
                                                      .modelListWarehouseMut!
                                                      .data!
                                                      .arrayList![i]
                                                      .gudangAsal ??
                                                  "-",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                " -> ",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              data
                                                      .modelListWarehouseMut!
                                                      .data!
                                                      .arrayList![i]
                                                      .gudangTujuan ??
                                                  "-",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            data.modelListWarehouseMut!.data!
                                                    .arrayList![i].produkNama ??
                                                "-",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            data.modelListWarehouseMut!.data!
                                                .arrayList![i].qty
                                                .toString(),
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            data.modelListWarehouseMut!.data!
                                                    .arrayList![i].satuanNama ??
                                                "-",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ))),
                        ),
                      ),
      ),
    );
  }
}
