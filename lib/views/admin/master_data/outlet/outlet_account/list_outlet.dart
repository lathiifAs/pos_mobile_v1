import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_master_cafe.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'list_outlet_account.dart';

class OutletAccount extends StatefulWidget {
  const OutletAccount({Key? key}) : super(key: key);

  @override
  _OutletAccountState createState() => _OutletAccountState();
}

class _OutletAccountState extends State<OutletAccount> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderMasterCafe>(context, listen: false)
        .getListMasterCafe(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderMasterCafe>(context, listen: false)
        .getListMasterCafe(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Outlet"),
      ),
      body: Consumer<ProviderMasterCafe>(
        builder: (context, data, _) => (data.modelMasterCafe == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelMasterCafe!.data!.length == 0)
                ? Container()
                : (data.modelMasterCafe!.data![0].arrayCafe!.length == 0)
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
                              data.modelMasterCafe!.data![0].arrayCafe!.length,
                          itemBuilder: (BuildContext context, int i) => Card(
                            elevation: 0.4,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListOutletAccount(
                                            parentId: data.modelMasterCafe!
                                                .data![0].arrayCafe![i].roleId
                                                .toString())));
                              },
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/images/cafe.png",
                                  width: 25,
                                  height: 25,
                                ),
                                title: Text(
                                  data.modelMasterCafe?.data?[0].arrayCafe?[i]
                                          .roleNm
                                          .toString() ??
                                      "-",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  data.modelMasterCafe?.data?[0].arrayCafe?[i]
                                          .roleDesc ??
                                      "-",
                                  style: TextStyle(fontSize: 13),
                                ),
                                trailing: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: (data.modelMasterCafe!.data![0]
                                                  .arrayCafe![i].aktifSt ==
                                              "1")
                                          ? Colors.green
                                          : Colors.red,
                                      shape: BoxShape.circle),
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
