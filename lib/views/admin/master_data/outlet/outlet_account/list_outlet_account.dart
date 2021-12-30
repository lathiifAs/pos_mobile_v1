import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/p_cafe_account.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'add_cafe_account/add_cafe_account.dart';
import 'detail_cafe_account/detail_cafe_account.dart';

class ListOutletAccount extends StatefulWidget {
  const ListOutletAccount({Key? key, required this.parentId}) : super(key: key);

  final String parentId;

  @override
  _ListOutletAccountState createState() => _ListOutletAccountState();
}

class _ListOutletAccountState extends State<ListOutletAccount> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderCafeAccount>(context, listen: false);
      data.getListCafeAccount(context, widget.parentId);
    });
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderCafeAccount>(context, listen: false);
      data.getListCafeAccount(context, widget.parentId);
      print(widget.parentId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Outlet Account"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddCafeAccount(
                        parentId: widget.parentId,
                      )));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderCafeAccount>(
        builder: (context, data, _) => (data.modelCafeAccount == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelCafeAccount!.data!.length == 0)
                ? Container()
                : (data.modelCafeAccount!.data![0].arrayAkun!.length == 0)
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
                              data.modelCafeAccount!.data![0].arrayAkun!.length,
                          itemBuilder: (BuildContext context, int i) => Card(
                            elevation: 0.4,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailCafeAccount(
                                      userId: data.modelCafeAccount!.data![0]
                                          .arrayAkun![i].userId
                                          .toString(),
                                      parentId: widget.parentId,
                                    ),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/images/cafe-acount.png",
                                  width: 25,
                                  height: 25,
                                ),
                                title: Text(
                                  data.modelCafeAccount?.data?[0].arrayAkun?[i]
                                          .nama
                                          .toString() ??
                                      "-",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  data.modelCafeAccount?.data?[0].arrayAkun?[i]
                                          .roleNm
                                          .toString() ??
                                      "-",
                                  style: TextStyle(fontSize: 13),
                                ),
                                trailing: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: (data.modelCafeAccount!.data![0]
                                                  .arrayAkun![i].userSt ==
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
