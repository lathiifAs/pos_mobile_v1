import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/p_retail_account.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/admin/master_data/retail_account/add_retail_account/add_retail_account.dart';
import 'package:pointofsales/views/admin/master_data/retail_account/detail_retail_account/detail_retail_account.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListAkunByRetail extends StatefulWidget {
  const ListAkunByRetail({Key? key, required this.parentId}) : super(key: key);

  final String parentId;

  @override
  _ListAkunByRetailState createState() => _ListAkunByRetailState();
}

class _ListAkunByRetailState extends State<ListAkunByRetail> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderRetailAccount>(context, listen: false)
        .getListAkun(context: context, parentId: widget.parentId);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    Provider.of<ProviderRetailAccount>(context, listen: false)
        .getListAkun(context: context, parentId: widget.parentId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Account"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddRetailAccount(parentId: widget.parentId)));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderRetailAccount>(
        builder: (context, data, _) => (data.modelListAkunByRetail == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelListAkunByRetail!.data!.length == 0)
                ? Container()
                : (data.modelListAkunByRetail!.data![0].arrayAkun!.length == 0)
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
                            itemCount: data.modelListAkunByRetail!.data![0]
                                .arrayAkun!.length,
                            itemBuilder: (BuildContext context, int i) => Card(
                                  elevation: 0.4,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailRetailAccount(
                                                      inputUserId: data
                                                          .modelListAkunByRetail!
                                                          .data![0]
                                                          .arrayAkun![i]
                                                          .userId
                                                          .toString(),
                                                      parentId: widget.parentId,
                                                    )));
                                      },
                                      child: ListTile(
                                        leading: Icon(Icons.person),
                                        title: Text(
                                          data.modelListAkunByRetail!.data![0]
                                                  .arrayAkun![i].nama ??
                                              "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        subtitle: Text(
                                            data.modelListAkunByRetail!.data![0]
                                                    .arrayAkun![i].roleNm ??
                                                "",
                                            style: TextStyle(fontSize: 13)),
                                        trailing: Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: (data
                                                          .modelListAkunByRetail!
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
