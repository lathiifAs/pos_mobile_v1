import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/p_admin_account.dart';
import 'package:pointofsales/providers/admin/p_master_cafe.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/ADMIN/master_data/admin_account/add_admin_account/add_admin_account_screen.dart';
import 'package:pointofsales/views/ADMIN/master_data/admin_account/detail_admin_account/detail_admin_account.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AdminAccount extends StatefulWidget {
  const AdminAccount({Key? key}) : super(key: key);

  @override
  _AdminAccountState createState() => _AdminAccountState();
}

class _AdminAccountState extends State<AdminAccount> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderAdminAccount>(context, listen: false)
        .getListAkunAdmin(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderAdminAccount>(context, listen: false)
        .getListAkunAdmin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Master Admin Account"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddAdminAccountScreen()));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderAdminAccount>(
        builder: (context, data, _) => (data.modelListAkunAdmin == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelListAkunAdmin!.data!.length == 0)
                ? Container()
                : (data.modelListAkunAdmin!.data![0].arrayAkun!.length == 0)
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
                            itemCount: data
                                .modelListAkunAdmin!.data![0].arrayAkun!.length,
                            itemBuilder: (BuildContext context, int i) => Card(
                              elevation: 0.4,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailAdminAccount(
                                                        userId: data
                                                            .modelListAkunAdmin!
                                                            .data![0]
                                                            .arrayAkun![i]
                                                            .userId
                                                            .toString())));
                                      },
                                      child: ListTile(
                                        leading: Icon(Icons.person),
                                        title: Text(
                                          data.modelListAkunAdmin!.data![0]
                                                  .arrayAkun![i].nama ??
                                              "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        subtitle: Text(
                                          data.modelListAkunAdmin!.data![0]
                                                  .arrayAkun![i].noHp ??
                                              "",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        trailing: Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: (data
                                                          .modelListAkunAdmin!
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
