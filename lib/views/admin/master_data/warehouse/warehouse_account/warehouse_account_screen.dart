import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/p_warehouse_account.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'add_warehouse_account/add_warehouse_accunt.dart';
import 'detail_warehouse_account/detail_warehouse_account.dart';

class WarehouseAccountScreen extends StatefulWidget {
  const WarehouseAccountScreen({Key? key}) : super(key: key);

  @override
  _WarehouseAccountScreenState createState() => _WarehouseAccountScreenState();
}

class _WarehouseAccountScreenState extends State<WarehouseAccountScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderWarehouseAccount>(context, listen: false)
        .getListWarehouseAccount(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderWarehouseAccount>(context, listen: false)
        .getListWarehouseAccount(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warehouse Account"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddWarehouseAccount()));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderWarehouseAccount>(
        builder: (context, data, _) => (data.modelWarehoseAccount == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelWarehoseAccount!.data!.length == 0)
                ? Container()
                : (data.modelWarehoseAccount!.data![0].arrayAkun!.length == 0)
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
                            itemCount: data.modelWarehoseAccount!.data![0]
                                .arrayAkun!.length,
                            itemBuilder: (BuildContext context, int i) => Card(
                                  elevation: 0.4,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailWarehouseAccount(
                                                        inputUserId: data
                                                            .modelWarehoseAccount!
                                                            .data![0]
                                                            .arrayAkun![i]
                                                            .userId
                                                            .toString(),
                                                        inputRoleId: data
                                                            .modelWarehoseAccount!
                                                            .data![0]
                                                            .arrayAkun![i]
                                                            .roleId
                                                            .toString())));
                                      },
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/warehouse.png",
                                          width: 25,
                                          height: 25,
                                        ),
                                        title: Text(
                                          data.modelWarehoseAccount!.data![0]
                                                  .arrayAkun![i].nama ??
                                              "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        subtitle: Text(
                                            data
                                                    .modelWarehoseAccount!
                                                    .data![0]
                                                    .arrayAkun![i]
                                                    .alamatLengkap ??
                                                "",
                                            style: TextStyle(fontSize: 13)),
                                        trailing: Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: (data
                                                          .modelWarehoseAccount!
                                                          .data![0]
                                                          .arrayAkun![i]
                                                          .userSt ==
                                                      "1")
                                                  ? Colors.green
                                                  : Colors.red),
                                        ),
                                      )),
                                )),
                      ),
      ),
    );
  }
}
