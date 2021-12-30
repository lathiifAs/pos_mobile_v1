import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_table.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/admin/master_data/table/add_master_table.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListOutletScreen extends StatelessWidget {
  const ListOutletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _tableNameController = TextEditingController();
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);

    void _onRefresh() async {
      Provider.of<ProviderTable>(context, listen: false).getListMeja(context);
      _refreshController.refreshCompleted();
    }

    Provider.of<ProviderTable>(context, listen: false).getListMeja(context);
    Provider.of<ProviderTable>(context, listen: false).getAddDataMeja(context);
    String roleId = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Master Table'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () {
          Get.to(AddMasterTable());
          // await NDialog(
          //   dialogStyle: DialogStyle(titleDivider: true),
          //   title: Text("Table"),
          //   content: SingleChildScrollView(
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Consumer<ProviderTable>(
          //           builder: (context, data, _) => (data.modelAddMeja == null)
          //               ? Center(
          //                   child: CircularProgressIndicator(),
          //                 )
          //               : (data.modelAddMeja!.data == null)
          //                   ? Container()
          //                   : (data.modelAddMeja!.data!.outlet!.length == 0)
          //                       ? DefaultDropdown(
          //                           label: "Outlet *",
          //                           selectedItem: "Data is empty!",
          //                           onChanged: (value) {},
          //                           items: data.modelAddMeja!.data!.outlet!
          //                               .map((e) => e.roleNm)
          //                               .toList())
          //                       : DefaultDropdown(
          //                           label: "Outlet *",
          //                           selectedItem: "Choose",
          //                           onChanged: (value) {
          //                             var name = data
          //                                 .modelAddMeja!.data!.outlet!
          //                                 .where((element) =>
          //                                     element.roleNm == value);
          //                             name.forEach((element) {
          //                               roleId = element.roleId.toString();
          //                               data.inisialMeja =
          //                                   element.inisialMeja.toString();
          //                             });
          //                           },
          //                           items: data.modelAddMeja!.data!.outlet!
          //                               .map((e) => e.roleNm)
          //                               .toList(),
          //                         ),
          //         ),
          //         SizedBox(
          //           height: 10,
          //         ),
          //         Consumer<ProviderTable>(
          //           builder: (context, data, _) => GeneralTextField(
          //             label: "Table Name *",
          //             controller: _tableNameController,
          //             prefixText: data.inisialMeja,
          //             // prefixText: ,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          //   actions: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          //       child: Consumer<ProviderTable>(
          //         builder: (context, data, _) => DefaultButton(
          //             backgroundColor: kButtonColor,
          //             buttonText: "Save",
          //             onPressed: () {
          //               Navigator.pop(context);
          //               data.postAddMeja(context, _tableNameController.text,
          //                   roleId, data.inisialMeja);
          //               data.getListMeja(context);
          //               _tableNameController.clear();
          //               roleId = '';
          //               data.inisialMeja = '';
          //             }),
          //       ),
          //     )
          //   ],
          // ).show(context);
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderTable>(
        builder: (context, data, _) => (data.modelListMeja == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelListMeja!.data!.length == 0)
                ? Container()
                : (data.modelListMeja!.data![0].listOutlet!.length == 0)
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
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount:
                              data.modelListMeja!.data![0].listOutlet!.length,
                          itemBuilder: (BuildContext context, int i) => Card(
                            elevation: 0.4,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data.modelListMeja!.data![0].listOutlet![i].roleNm ?? "-"}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  Divider(),
                                  (data.modelListMeja!.data![0].listOutlet![i]
                                              .listMeja!.length ==
                                          0)
                                      ? Container()
                                      : Container(
                                          // height: 100,
                                          child: GridView.builder(
                                              padding: EdgeInsets.all(10),
                                              shrinkWrap: true,
                                              physics: ScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      mainAxisExtent:
                                                          kDefaultPadding * 3,
                                                      mainAxisSpacing:
                                                          kDefaultPadding,
                                                      crossAxisSpacing:
                                                          kDefaultPadding,
                                                      crossAxisCount: 3),
                                              itemCount: data
                                                  .modelListMeja!
                                                  .data![0]
                                                  .listOutlet![i]
                                                  .listMeja!
                                                  .length,
                                              itemBuilder: (c, index) {
                                                return Card(
                                                  elevation: 4,
                                                  child: InkWell(
                                                    onTap: () async {
                                                      data.tableNameCont.text =
                                                          data
                                                              .modelListMeja!
                                                              .data![0]
                                                              .listOutlet![i]
                                                              .listMeja![index]
                                                              .mejaNomor
                                                              .toString();
                                                      await NDialog(
                                                        dialogStyle:
                                                            DialogStyle(
                                                                titleDivider:
                                                                    true),
                                                        title: Text("Table"),
                                                        content:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Consumer<
                                                                  ProviderTable>(
                                                                builder: (context,
                                                                        data,
                                                                        _) =>
                                                                    GeneralTextField(
                                                                  label:
                                                                      "Table Name",
                                                                  controller: data
                                                                      .tableNameCont,
                                                                  prefixText: data
                                                                      .inisialMeja,
                                                                  // prefixText: ,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                "Save",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .orange),
                                                              )),
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                                data.postDeleteMeja(
                                                                    context:
                                                                        context,
                                                                    mejaId: data
                                                                        .modelListMeja!
                                                                        .data![
                                                                            0]
                                                                        .listOutlet![
                                                                            i]
                                                                        .listMeja![
                                                                            index]
                                                                        .mejaId
                                                                        .toString());
                                                              },
                                                              child: Text(
                                                                "Delete",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                              )),
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                "Cancel",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue),
                                                              )),
                                                        ],
                                                      ).show(context);
                                                    },
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 3,
                                                                    right: 3),
                                                            width: 10,
                                                            height: 10,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                color: (data.modelListMeja!.data![0].listOutlet![i].listMeja![index].aktifSt == 'non_active')
                                                                    ? Colors.red
                                                                    : (data.modelListMeja!.data![0].listOutlet![i].listMeja![index].aktifSt == 'stand_by')
                                                                        ? Colors.amber
                                                                        : (data.modelListMeja!.data![0].listOutlet![i].listMeja![index].aktifSt == 'used')
                                                                            ? Colors.green
                                                                            : Colors.lightBlue),
                                                          ),
                                                        ),
                                                        Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                data
                                                                        .modelListMeja!
                                                                        .data![
                                                                            0]
                                                                        .listOutlet![
                                                                            i]
                                                                        .listMeja![
                                                                            index]
                                                                        .mejaNomor ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              Text(
                                                                (data
                                                                            .modelListMeja!
                                                                            .data![
                                                                                0]
                                                                            .listOutlet![
                                                                                i]
                                                                            .listMeja![
                                                                                index]
                                                                            .aktifSt ==
                                                                        'non_active')
                                                                    ? 'non active'
                                                                    : (data.modelListMeja!.data![0].listOutlet![i].listMeja![index].aktifSt ==
                                                                            'stand_by')
                                                                        ? 'stand by'
                                                                        : (data.modelListMeja!.data![0].listOutlet![i].listMeja![index].aktifSt ==
                                                                                'used')
                                                                            ? 'used'
                                                                            : 'reserved',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
      ),
    );
  }
}
