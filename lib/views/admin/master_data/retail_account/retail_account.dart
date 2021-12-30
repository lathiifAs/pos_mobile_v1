import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_retail_bakery.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/admin/master_data/retail_account/list_akun_by_retail/list_akun_by_retail.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RetailAccount extends StatefulWidget {
  const RetailAccount({Key? key}) : super(key: key);

  @override
  _RetailAccountState createState() => _RetailAccountState();
}

class _RetailAccountState extends State<RetailAccount> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    Provider.of<ProviderRetailBakery>(context, listen: false)
        .getListRetailBakery(context);
    super.initState();
  }

  void _onRefresh() async {
    Provider.of<ProviderRetailBakery>(context, listen: false)
        .getListRetailBakery(context);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retail Bakery Account"),
      ),
      body: Consumer<ProviderRetailBakery>(
        builder: (context, data, _) => (data.modelRetailBakery == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelRetailBakery!.data == null)
                ? Container()
                : (data.modelRetailBakery!.data!.arrayRetail!.length == 0)
                    ? SmartRefresher(
                        enablePullDown: true,
                        onRefresh: _onRefresh,
                        controller: _refreshController,
                        header: WaterDropHeader(),
                        child: Center(
                          child: EmptyData(),
                        ))
                    : SmartRefresher(
                        header: WaterDropHeader(),
                        enablePullDown: true,
                        onRefresh: _onRefresh,
                        controller: _refreshController,
                        child: ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount:
                              data.modelRetailBakery!.data!.arrayRetail!.length,
                          itemBuilder: (BuildContext context, int i) => Card(
                            elevation: 0.4,
                            child: InkWell(
                              onTap: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListAkunByRetail(
                                            parentId: data.modelRetailBakery!
                                                .data!.arrayRetail![i].roleId
                                                .toString())));
                              },
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/images/roti-bakery.png",
                                  width: 25,
                                  height: 25,
                                ),
                                title: Text(
                                  data.modelRetailBakery!.data!.arrayRetail![i]
                                          .roleNm ??
                                      "-",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                subtitle: Text(
                                    data.modelRetailBakery!.data!
                                            .arrayRetail![i].roleDesc ??
                                        "-",
                                    style: TextStyle(fontSize: 13)),
                                trailing: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: (data.modelRetailBakery!.data!
                                                  .arrayRetail![i].aktifSt ==
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
