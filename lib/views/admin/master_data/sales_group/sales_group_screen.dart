import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_sales_group.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SalesGroupScreen extends StatefulWidget {
  const SalesGroupScreen({Key? key}) : super(key: key);

  @override
  _SalesGroupScreenState createState() => _SalesGroupScreenState();
}

class _SalesGroupScreenState extends State<SalesGroupScreen> {
  TextEditingController _salesGroupNameController = TextEditingController();
  TextEditingController _salesGroupDescController = TextEditingController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderSalesGroup>(context, listen: false)
        .getListSalesGroup(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderSalesGroup>(context, listen: false)
        .getListSalesGroup(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sales Group"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () async {
          String? _groupId;
          await NDialog(
            dialogStyle: DialogStyle(titleDivider: true),
            title: Text("Sales Group"),
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DefaultDropdown(
                      label: "Group *",
                      selectedItem: "Choose",
                      onChanged: (String? item) => _groupId = item,
                      items: ["Cafe dan Resto", "Retail Bakery"],
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    GeneralTextField(
                      label: "Sales Group Name *",
                      controller: _salesGroupNameController,
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    GeneralTextField(
                      label: "Description",
                      maxLines: 3,
                      controller: _salesGroupDescController,
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
                        Provider.of<ProviderSalesGroup>(context, listen: false)
                            .getListSalesGroup(context);
                        Provider.of<ProviderSalesGroup>(context, listen: false)
                            .postAddSalesGroup(
                                context,
                                _salesGroupNameController.text,
                                _salesGroupDescController.text,
                                (_groupId == "Cafe dan Resto")
                                    ? "3"
                                    : (_groupId == "Retail Bakery")
                                        ? "4"
                                        : "");
                        _salesGroupNameController.clear();
                        _salesGroupDescController.clear();
                      }))
            ],
          ).show(context);
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderSalesGroup>(
        builder: (context, data, _) => (data.modelSalesGroup == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelSalesGroup!.data!.length == 0)
                ? Container()
                : (data.modelSalesGroup!.data![0].arraySalesGroup!.length == 0)
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
                            itemCount: data.modelSalesGroup!.data![0]
                                .arraySalesGroup!.length,
                            itemBuilder: (BuildContext context, int i) => Card(
                                  elevation: 0.4,
                                  child: InkWell(
                                      onTap: () async {
                                        data.isStatusActive = (data
                                                    .modelSalesGroup!
                                                    .data![0]
                                                    .arraySalesGroup![i]
                                                    .aktifSt ==
                                                "1")
                                            ? true
                                            : false;
                                        data.groupId = (data
                                                    .modelSalesGroup!
                                                    .data![0]
                                                    .arraySalesGroup![i]
                                                    .groupNama ==
                                                "Cafe dan Resto")
                                            ? "3"
                                            : "4";
                                        _salesGroupNameController.text = data
                                            .modelSalesGroup!
                                            .data![0]
                                            .arraySalesGroup![i]
                                            .salesGroupNama!;
                                        _salesGroupDescController.text = data
                                            .modelSalesGroup!
                                            .data![0]
                                            .arraySalesGroup![i]
                                            .salesGroupDesc!;
                                        await NAlertDialog(
                                          dialogStyle:
                                              DialogStyle(titleDivider: true),
                                          title: Text("Sales Group"),
                                          content: SingleChildScrollView(
                                            child: Container(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  DefaultDropdown(
                                                      label: "Group",
                                                      selectedItem: data
                                                          .modelSalesGroup!
                                                          .data![0]
                                                          .arraySalesGroup![i]
                                                          .groupNama!,
                                                      onChanged:
                                                          (String? item) => data
                                                              .groupId = item,
                                                      items: [
                                                        "Cafe dan Resto",
                                                        "Retail Bakery"
                                                      ]),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  GeneralTextField(
                                                    label: "Sales Group Name",
                                                    controller:
                                                        _salesGroupNameController,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  GeneralTextField(
                                                    label: "Description",
                                                    maxLines: 3,
                                                    controller:
                                                        _salesGroupDescController,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey.shade300,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Active Status",
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
                                                  data.getListSalesGroup(
                                                      context);
                                                  data.postEditSalesGroup(
                                                      context: context,
                                                      salesGroupName:
                                                          _salesGroupNameController
                                                              .text,
                                                      salesGroupDesc:
                                                          _salesGroupDescController
                                                              .text,
                                                      groupId: (data.groupId ==
                                                              "Cafe dan Resto")
                                                          ? "3"
                                                          : "4",
                                                      activeStatus:
                                                          (data.isStatusActive ==
                                                                  true)
                                                              ? "1"
                                                              : "0",
                                                      salesGroupId: data
                                                          .modelSalesGroup!
                                                          .data![0]
                                                          .arraySalesGroup![i]
                                                          .salesGroupId
                                                          .toString());
                                                  _salesGroupNameController
                                                      .clear();
                                                  _salesGroupDescController
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
                                                  data.getListSalesGroup(
                                                      context);
                                                  data.postDeleteSalesGroup(
                                                      context: context,
                                                      salesGroupId: data
                                                          .modelSalesGroup!
                                                          .data![0]
                                                          .arraySalesGroup![i]
                                                          .salesGroupId
                                                          .toString());
                                                  _salesGroupNameController
                                                      .clear();
                                                  _salesGroupDescController
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
                                                  _salesGroupNameController
                                                      .clear();
                                                  _salesGroupDescController
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
                                          // leading: Icon(Icons.group),
                                          title: Text(
                                            data
                                                    .modelSalesGroup!
                                                    .data![0]
                                                    .arraySalesGroup![i]
                                                    .salesGroupNama ??
                                                "-",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          subtitle: Text(
                                            data
                                                    .modelSalesGroup!
                                                    .data![0]
                                                    .arraySalesGroup![i]
                                                    .groupNama ??
                                                "-",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                          trailing: Container(
                                            width: 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: (data
                                                            .modelSalesGroup!
                                                            .data![0]
                                                            .arraySalesGroup![i]
                                                            .aktifSt ==
                                                        "1")
                                                    ? Colors.green
                                                    : Colors.red,
                                                shape: BoxShape.circle),
                                          ))),
                                )),
                      ),
      ),
    );
  }
}
