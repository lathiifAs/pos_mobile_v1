import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_retail_bakery.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RetailBakeryScreen extends StatefulWidget {
  const RetailBakeryScreen({Key? key}) : super(key: key);

  @override
  _RetailBakeryScreenState createState() => _RetailBakeryScreenState();
}

class _RetailBakeryScreenState extends State<RetailBakeryScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  TextEditingController _retailBakeryController = TextEditingController();
  TextEditingController _descretailBakeryController = TextEditingController();

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
        title: Text("Retail Bakery"),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: kButtonColor,
          child: Icon(Icons.add),
          onPressed: () async {
            await NDialog(
              dialogStyle: DialogStyle(titleDivider: true),
              title: Text("Master Retail Bakery"),
              content: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GeneralTextField(
                        label: "Retail Name *",
                        controller: _retailBakeryController,
                      ),
                      SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      GeneralTextField(
                        label: "Description",
                        maxLines: 3,
                        controller: _descretailBakeryController,
                      ),
                      SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: DefaultButton(
                    backgroundColor: kButtonColor,
                    buttonText: "Save",
                    onPressed: () {
                      Navigator.pop(context);
                      Provider.of<ProviderRetailBakery>(context, listen: false)
                          .postAddRetailBakery(
                              context,
                              _retailBakeryController.text,
                              _descretailBakeryController.text);
                      Provider.of<ProviderRetailBakery>(context, listen: false)
                          .getListRetailBakery(context);
                      _retailBakeryController.clear();
                      _descretailBakeryController.clear();
                    },
                  ),
                ),
              ],
            ).show(context);
          }),
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
                                data.isStatusActive = data.modelRetailBakery!
                                            .data!.arrayRetail![i].aktifSt ==
                                        "1"
                                    ? true
                                    : false;
                                await NAlertDialog(
                                  dialogStyle: DialogStyle(titleDivider: true),
                                  title: Text("Master Retail Bakery"),
                                  content: SingleChildScrollView(
                                    child: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GeneralTextField(
                                            label: "Retail Name",
                                            hintText: data.modelRetailBakery!
                                                .data!.arrayRetail![i].roleNm,
                                            colorHint: Colors.black,
                                            onChanged: (value) {
                                              _retailBakeryController.text =
                                                  value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          GeneralTextField(
                                            label: "Description",
                                            maxLines: 3,
                                            hintText: data.modelRetailBakery!
                                                .data!.arrayRetail![i].roleDesc,
                                            colorHint: Colors.black,
                                            onChanged: (value) {
                                              _descretailBakeryController.text =
                                                  value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.grey.shade300,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Active Retail",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                StatefulBuilder(
                                                    builder: (context,
                                                            setState) =>
                                                        Switch(
                                                            inactiveThumbColor:
                                                                Colors.red,
                                                            inactiveTrackColor:
                                                                Colors.red[100],
                                                            value: data
                                                                .isStatusActive,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                data.isStatusActive =
                                                                    value;
                                                              });
                                                            }))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Provider.of<ProviderRetailBakery>(context, listen: false).postEditRetailBakery(
                                            context: context,
                                            namaRetail: (_retailBakeryController
                                                        .text ==
                                                    "")
                                                ? data.modelRetailBakery!.data!
                                                    .arrayRetail![i].roleNm
                                                    .toString()
                                                : _retailBakeryController.text,
                                            keterangan:
                                                (_descretailBakeryController.text ==
                                                        "")
                                                    ? data
                                                        .modelRetailBakery!
                                                        .data!
                                                        .arrayRetail![i]
                                                        .roleDesc
                                                        .toString()
                                                    : _descretailBakeryController
                                                        .text,
                                            aktifStatus:
                                                (data.isStatusActive == true)
                                                    ? "1"
                                                    : "0",
                                            inputRoleId: data.modelRetailBakery!
                                                .data!.arrayRetail![i].roleId
                                                .toString());

                                        Provider.of<ProviderRetailBakery>(context,
                                                listen: false)
                                            .getListRetailBakery(context);
                                        _retailBakeryController.clear();
                                        _descretailBakeryController.clear();
                                      },
                                      child: Text(
                                        "Save",
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Provider.of<ProviderRetailBakery>(
                                                  context,
                                                  listen: false)
                                              .postDeleteRetail(
                                                  context: context,
                                                  inputRoleId: data
                                                      .modelRetailBakery!
                                                      .data!
                                                      .arrayRetail![i]
                                                      .roleId
                                                      .toString());
                                          Provider.of<ProviderRetailBakery>(
                                                  context,
                                                  listen: false)
                                              .getListRetailBakery(context);
                                          _retailBakeryController.clear();
                                          _descretailBakeryController.clear();
                                        },
                                        child: Text(
                                          "Delete",
                                          style: TextStyle(color: Colors.red),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          _retailBakeryController.clear();
                                          _descretailBakeryController.clear();
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.blue),
                                        )),
                                  ],
                                ).show(context);
                              },
                              child: ListTile(
                                leading: Image.asset("assets/images/roti-bakery.png", width: 25, height: 25,),
                                title: Text(
                                  data.modelRetailBakery!.data!.arrayRetail![i]
                                          .roleNm ??
                                      "-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                  ),
                                ),
                                subtitle: Text(data.modelRetailBakery!.data!
                                        .arrayRetail![i].roleDesc ??
                                    "-", style: TextStyle(fontSize: 13)),
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
