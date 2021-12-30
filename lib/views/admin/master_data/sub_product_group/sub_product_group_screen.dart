import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_product_group.dart';
import 'package:pointofsales/providers/admin/p_sub_product_group.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/general_switch.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SubProductGroupScreen extends StatefulWidget {
  const SubProductGroupScreen({Key? key}) : super(key: key);

  @override
  _SubProductGroupScreenState createState() => _SubProductGroupScreenState();
}

class _SubProductGroupScreenState extends State<SubProductGroupScreen> {
  TextEditingController _subProductGroupNameController =
      TextEditingController();
  TextEditingController _subProductGroupDescController =
      TextEditingController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderSubProductGroup>(context, listen: false)
        .getListSubProductGroup(context);
    Provider.of<ProviderSubProductGroup>(context, listen: false)
        .getDataAdd(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderSubProductGroup>(context, listen: false)
        .getListSubProductGroup(context);
    Provider.of<ProviderSubProductGroup>(context, listen: false)
        .getDataAdd(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sub Product Group"),
      ),
      floatingActionButton: Consumer<ProviderSubProductGroup>(
        builder: (context, data, _) => FloatingActionButton(
          backgroundColor: kButtonColor,
          onPressed: () async {
            String? _produkGroupId;
            await NDialog(
              dialogStyle: DialogStyle(titleDivider: true),
              title: Text("Sub Product Group"),
              content: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultDropdown(
                          label: "Group",
                          selectedItem: "Choose",
                          onChanged: (value) {
                            var produkGroupNama = data.modelListSubProductGroup!
                                .data![0].arraySubProdukGroup!
                                .where((element) =>
                                    element.produkGroupNama == value);
                            produkGroupNama.forEach((element) {
                              _produkGroupId = element.produkGroupId.toString();
                            });
                          },
                          items: data.modelListSubProductGroup!.data![0]
                              .arraySubProdukGroup!
                              .map((e) => e.produkGroupNama)
                              .toList()),
                      const SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      GeneralTextField(
                        label: "Sub Product Group Name *",
                        controller: _subProductGroupNameController,
                      ),
                      const SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      GeneralTextField(
                        label: "Description",
                        maxLines: 3,
                        controller: _subProductGroupDescController,
                      ),
                      const SizedBox(
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
                          data.getListSubProductGroup(context);
                          data.postAddSubProductGroup(
                              context,
                              (_produkGroupId == null) ? "" : _produkGroupId!,
                              _subProductGroupNameController.text,
                              _subProductGroupDescController.text);
                          _subProductGroupNameController.clear();
                          _subProductGroupDescController.clear();
                        }))
              ],
            ).show(context);
          },
          child: Icon(Icons.add),
        ),
      ),
      body: Consumer<ProviderProductGroup>(
        builder: (context, dataProdukGroup, _) =>
            Consumer<ProviderSubProductGroup>(
          builder: (context, data, _) => (data.modelListSubProductGroup == null)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : (data.modelListSubProductGroup!.data!.length == 0)
                  ? Container()
                  : (data.modelListSubProductGroup!.data![0]
                              .arraySubProdukGroup!.length ==
                          0)
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
                              itemCount: data.modelListSubProductGroup!.data![0]
                                  .arraySubProdukGroup!.length,
                              itemBuilder: (BuildContext context, int i) =>
                                  Card(
                                    elevation: 0.4,
                                    child: InkWell(
                                        onTap: () async {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             DetailSubProductGroup(
                                          //                 subProdukGroupId: data
                                          //                     .modelListSubProductGroup!
                                          //                     .data![0]
                                          //                     .arraySubProdukGroup![
                                          //                         i]
                                          //                     .subProdukGroupId
                                          //                     .toString())));
                                          data.isStatusActive = (data
                                                      .modelListSubProductGroup!
                                                      .data![0]
                                                      .arraySubProdukGroup![i]
                                                      .aktifSt ==
                                                  "1")
                                              ? true
                                              : false;
                                          _subProductGroupNameController.text =
                                              data
                                                  .modelListSubProductGroup!
                                                  .data![0]
                                                  .arraySubProdukGroup![i]
                                                  .produkGroupNama!;
                                          _subProductGroupDescController.text =
                                              data
                                                  .modelListSubProductGroup!
                                                  .data![0]
                                                  .arraySubProdukGroup![i]
                                                  .subProdukGroupDesc!;
                                          await NAlertDialog(
                                            dialogStyle:
                                                DialogStyle(titleDivider: true),
                                            title: Text("Product Group"),
                                            content: SingleChildScrollView(
                                              child: Container(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    GeneralTextField(
                                                      label:
                                                          "Sub Product Group Name",
                                                      controller:
                                                          _subProductGroupNameController,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    GeneralTextField(
                                                      label: "Description",
                                                      maxLines: 3,
                                                      controller:
                                                          _subProductGroupDescController,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    StatefulBuilder(
                                                      builder: (context,
                                                              setState) =>
                                                          GeneralSwitch(
                                                              label:
                                                                  'Active Status',
                                                              value: data
                                                                  .isStatusActive,
                                                              onChange: (val) {
                                                                setState(() {
                                                                  data.isStatusActive =
                                                                      val;
                                                                });
                                                              }),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    data.getListSubProductGroup(
                                                        context);
                                                    data.postEditSubProductGroup(
                                                        context: context,
                                                        subProdukGroupNama:
                                                            _subProductGroupNameController
                                                                .text,
                                                        subProdukGroupDesc:
                                                            _subProductGroupDescController
                                                                .text,
                                                        produkGroupId: data
                                                            .modelListSubProductGroup!
                                                            .data![0]
                                                            .arraySubProdukGroup![
                                                                i]
                                                            .produkGroupId
                                                            .toString(),
                                                        activeStatus:
                                                            (data.isStatusActive ==
                                                                    true)
                                                                ? "1"
                                                                : "0",
                                                        subProdukGroupId: data
                                                            .modelListSubProductGroup!
                                                            .data![0]
                                                            .arraySubProdukGroup![
                                                                i]
                                                            .subProdukGroupId
                                                            .toString());
                                                    _subProductGroupNameController
                                                        .clear();
                                                    _subProductGroupDescController
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
                                                    data.getListSubProductGroup(
                                                        context);
                                                    data.postDeleteSubProductGroup(
                                                        context: context,
                                                        subProductGroupId: data
                                                            .modelListSubProductGroup!
                                                            .data![0]
                                                            .arraySubProdukGroup![
                                                                i]
                                                            .subProdukGroupId
                                                            .toString());
                                                    _subProductGroupNameController
                                                        .clear();
                                                    _subProductGroupDescController
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
                                                    _subProductGroupNameController
                                                        .clear();
                                                    _subProductGroupDescController
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
                                                      .modelListSubProductGroup!
                                                      .data![0]
                                                      .arraySubProdukGroup![i]
                                                      .subProdukGroupNama ??
                                                  "-",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            subtitle: Text(
                                                data
                                                        .modelListSubProductGroup!
                                                        .data![0]
                                                        .arraySubProdukGroup![i]
                                                        .produkGroupNama ??
                                                    "-",
                                                style: TextStyle(fontSize: 13)),
                                            trailing: Container(
                                              width: 8,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                  color: (data
                                                              .modelListSubProductGroup!
                                                              .data![0]
                                                              .arraySubProdukGroup![
                                                                  i]
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
