import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_master_cafe.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Outletmaster extends StatefulWidget {
  const Outletmaster({Key? key}) : super(key: key);

  @override
  _OutletmasterState createState() => _OutletmasterState();
}

class _OutletmasterState extends State<Outletmaster> {
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
    return Consumer<ProviderMasterCafe>(
      builder: (context, data, _) => Scaffold(
        appBar: AppBar(
          title: Text("Outlet Master"),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kButtonColor,
          onPressed: () async {
            await NDialog(
              dialogStyle: DialogStyle(titleDivider: true),
              title: Text("Outlet Master"),
              content: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GeneralTextField(
                        label: "Outlet Name *",
                        hintText: 'Enter outlet name',
                        controller: data.roleNameController,
                      ),
                      SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      GeneralTextField(
                        label: "Initials Table *",
                        hintText: 'Enter initials table',
                        controller: data.tableInisialContr,
                      ),
                      SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      GeneralTextField(
                        label: "Description",
                        hintText: 'Enter description',
                        controller: data.roleDescController,
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: DefaultButton(
                        backgroundColor: kButtonColor,
                        buttonText: "Save",
                        onPressed: () {
                          Navigator.pop(context);
                          Provider.of<ProviderMasterCafe>(context,
                                  listen: false)
                              .getListMasterCafe(context);
                          Provider.of<ProviderMasterCafe>(context,
                                  listen: false)
                              .postAddMasterCafe(
                                  context,
                                  data.roleNameController.text,
                                  data.tableInisialContr.text,
                                  data.roleDescController.text);
                          data.roleNameController.clear();
                          data.roleDescController.clear();
                          data.tableInisialContr.clear();
                        }))
              ],
            ).show(context);
          },
          child: Icon(Icons.add),
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
                              itemCount: data
                                  .modelMasterCafe!.data![0].arrayCafe!.length,
                              itemBuilder: (BuildContext context, int i) =>
                                  Card(
                                    elevation: 0.4,
                                    child: InkWell(
                                        onTap: () async {
                                          data.isStatusActive = (data
                                                      .modelMasterCafe!
                                                      .data![0]
                                                      .arrayCafe![i]
                                                      .aktifSt ==
                                                  "1")
                                              ? true
                                              : false;
                                          data.roleNameController.text = data
                                              .modelMasterCafe!
                                              .data![0]
                                              .arrayCafe![i]
                                              .roleNm
                                              .toString();
                                          data.roleDescController.text = data
                                              .modelMasterCafe!
                                              .data![0]
                                              .arrayCafe![i]
                                              .roleDesc
                                              .toString();
                                          await NAlertDialog(
                                            dialogStyle:
                                                DialogStyle(titleDivider: true),
                                            title: Text("Outlet Master"),
                                            content: SingleChildScrollView(
                                              child: Container(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    GeneralTextField(
                                                      label: "Role Name",
                                                      controller: data
                                                          .roleNameController,
                                                      colorHint: Colors.black,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    GeneralTextField(
                                                      label: "Description",
                                                      maxLines: 3,
                                                      controller: data.roleDescController,
                                                      colorHint: Colors.black,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .shade300,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Active Role",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          StatefulBuilder(
                                                            builder: (context,
                                                                    setState) =>
                                                                Switch(
                                                                    inactiveThumbColor:
                                                                        Colors
                                                                            .red,
                                                                    inactiveTrackColor:
                                                                        Colors.red[
                                                                            100],
                                                                    value: data
                                                                        .isStatusActive,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        data.isStatusActive =
                                                                            value;
                                                                      });
                                                                    }),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Provider.of<ProviderMasterCafe>(
                                                            context,
                                                            listen: false)
                                                        .getListMasterCafe(
                                                            context);
                                                    Provider.of<ProviderMasterCafe>(
                                                            context,
                                                            listen: false)
                                                        .postEditMasterCafe(
                                                            context: context,
                                                            namaCafe: data
                                                                .roleNameController
                                                                .text,
                                                            keterangan: data
                                                                .roleDescController
                                                                .text,
                                                            aktifStatus:
                                                                (data.isStatusActive ==
                                                                        true)
                                                                    ? "1"
                                                                    : "0",
                                                            inputRoleId: data
                                                                .modelMasterCafe!
                                                                .data![0]
                                                                .arrayCafe![i]
                                                                .roleId
                                                                .toString());
                                                    data.roleNameController
                                                        .clear();
                                                    data.roleDescController
                                                        .clear();
                                                    data.tableInisialContr
                                                        .clear();
                                                  },
                                                  child: Text(
                                                    "Save",
                                                    style: TextStyle(
                                                        color: Colors.orange),
                                                  )),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Provider.of<ProviderMasterCafe>(
                                                            context,
                                                            listen: false)
                                                        .getListMasterCafe(
                                                            context);
                                                    Provider.of<ProviderMasterCafe>(
                                                            context,
                                                            listen: false)
                                                        .postDeleteMasterCafe(
                                                            context: context,
                                                            inputRoleId: data
                                                                .modelMasterCafe!
                                                                .data![0]
                                                                .arrayCafe![i]
                                                                .roleId
                                                                .toString());
                                                    data.roleNameController
                                                        .clear();
                                                    data.roleDescController
                                                        .clear();
                                                    data.tableInisialContr
                                                        .clear();
                                                  },
                                                  child: Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  )),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    data.roleNameController
                                                        .clear();
                                                    data.roleDescController
                                                        .clear();
                                                    data.tableInisialContr
                                                        .clear();
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
                                              "assets/images/cafe.png",
                                              width: 25,
                                              height: 25,
                                            ),
                                            title: Text(
                                              data.modelMasterCafe!.data![0]
                                                      .arrayCafe![i].roleNm ??
                                                  "-",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            subtitle: Text(
                                              data.modelMasterCafe!.data![0]
                                                      .arrayCafe![i].roleDesc ??
                                                  "-",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                            trailing: Container(
                                              width: 8,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                  color: (data
                                                              .modelMasterCafe!
                                                              .data![0]
                                                              .arrayCafe![i]
                                                              .aktifSt ==
                                                          "1")
                                                      ? Colors.green
                                                      : Colors.red,
                                                  shape: BoxShape.circle),
                                            ))),
                                  )),
                        ),
        ),
      ),
    );
  }
}
