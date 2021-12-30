import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_warehouse.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/general_switch.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WarehouseMaster extends StatefulWidget {
  const WarehouseMaster({Key? key}) : super(key: key);

  @override
  State<WarehouseMaster> createState() => _WarehouseMasterState();
}

class _WarehouseMasterState extends State<WarehouseMaster> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderWarehouse>(context, listen: false)
        .getListMasterGudang(context: context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    Provider.of<ProviderWarehouse>(context, listen: false)
        .getListMasterGudang(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warehouse Master'),
      ),
      floatingActionButton: Consumer<ProviderWarehouse>(
        builder: (context, data, _) => FloatingActionButton(
          backgroundColor: kButtonColor,
          onPressed: () async {
            await NDialog(
              dialogStyle: DialogStyle(titleDivider: true),
              title: Text("Warehouse Master"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GeneralTextField(
                    label: "Warehouse Name *",
                    controller: data.namaGudangCont,
                  ),
                  SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  GeneralTextField(
                    label: "Description",
                    controller: data.descCont,
                  ),
                ],
              ),
              actions: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: DefaultButton(
                        backgroundColor: kButtonColor,
                        buttonText: "Save",
                        onPressed: () {
                          Get.back();
                          Provider.of<ProviderWarehouse>(context, listen: false)
                              .postAddWarehouse(
                                  context: context,
                                  warehouseName: data.namaGudangCont.text,
                                  desc: data.descCont.text);
                          data.namaGudangCont.clear();
                          data.descCont.clear();
                        }))
              ],
            ).show(context);
          },
          child: Icon(Icons.add),
        ),
      ),
      body: Consumer<ProviderWarehouse>(
        builder: (context, data, _) => (data.modelListMasterGudang == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelListMasterGudang!.data == null)
                ? Container()
                : (data.modelListMasterGudang!.data!.arrayRetail!.length == 0)
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
                            itemCount: data.modelListMasterGudang!.data!
                                .arrayRetail!.length,
                            itemBuilder: (BuildContext context, int i) => Card(
                                  elevation: 0.4,
                                  child: InkWell(
                                      onTap: () async {
                                        data.activeSt = (data
                                                    .modelListMasterGudang!
                                                    .data!
                                                    .arrayRetail![i]
                                                    .aktifSt ==
                                                '1')
                                            ? true
                                            : false;
                                        data.namaGudangCont.text = data
                                            .modelListMasterGudang!
                                            .data!
                                            .arrayRetail![i]
                                            .roleNm!;
                                        data.descCont.text = data
                                                .modelListMasterGudang!
                                                .data!
                                                .arrayRetail![i]
                                                .roleDesc ??
                                            '-';
                                        await NAlertDialog(
                                          dialogStyle:
                                              DialogStyle(titleDivider: true),
                                          title: Text("Warehouse Master"),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                GeneralTextField(
                                                  label: "Warehouse Name",
                                                  controller:
                                                      data.namaGudangCont,
                                                ),
                                                SizedBox(
                                                  height: kDefaultPadding / 2,
                                                ),
                                                GeneralTextField(
                                                  label: "Desc",
                                                  controller: data.descCont,
                                                ),
                                                SizedBox(
                                                  height: kDefaultPadding / 2,
                                                ),
                                                StatefulBuilder(
                                                  builder: (context,
                                                          setState) =>
                                                      GeneralSwitch(
                                                          label:
                                                              'Active Status',
                                                          value: data.activeSt,
                                                          onChange: (val) {
                                                            setState(() {
                                                              data.activeSt =
                                                                  val;
                                                            });
                                                          }),
                                                )
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                  data.getListMasterGudang(
                                                      context: context);
                                                  data.postEditWarehouse(
                                                      context: context,
                                                      inputRoleId: data
                                                          .modelListMasterGudang!
                                                          .data!
                                                          .arrayRetail![i]
                                                          .roleId
                                                          .toString(),
                                                      warehouseName: data
                                                          .namaGudangCont.text,
                                                      desc: data.descCont.text,
                                                      aktifSt: (data.activeSt ==
                                                              false)
                                                          ? '0'
                                                          : '1');
                                                  data.namaGudangCont.clear();
                                                  data.descCont.clear();
                                                },
                                                child: Text(
                                                  "Save",
                                                  style: TextStyle(
                                                      color: Colors.orange),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                  data.postDeleteWarehouse(
                                                      context: context,
                                                      inputRoleId: data
                                                          .modelListMasterGudang!
                                                          .data!
                                                          .arrayRetail![i]
                                                          .roleId
                                                          .toString());
                                                  data.namaGudangCont.clear();
                                                  data.descCont.clear();
                                                },
                                                child: Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  data.namaGudangCont.clear();
                                                  data.descCont.clear();
                                                },
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                )),
                                          ],
                                        ).show(context);
                                      },
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/warehouse.png",
                                          width: 25,
                                          height: 25,
                                        ),
                                        title: Text(
                                          data.modelListMasterGudang!.data!
                                                  .arrayRetail![i].roleNm ??
                                              "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        subtitle: Text(
                                            data.modelListMasterGudang!.data!
                                                    .arrayRetail![i].roleDesc ??
                                                "",
                                            style: TextStyle(fontSize: 13)),
                                        trailing: Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: (data
                                                          .modelListMasterGudang!
                                                          .data!
                                                          .arrayRetail![i]
                                                          .aktifSt ==
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
