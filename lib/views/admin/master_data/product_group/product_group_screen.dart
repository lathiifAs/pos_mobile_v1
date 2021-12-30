import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_product_group.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_switch.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductGroupScreen extends StatefulWidget {
  const ProductGroupScreen({Key? key}) : super(key: key);

  @override
  _ProductGroupScreenState createState() => _ProductGroupScreenState();
}

class _ProductGroupScreenState extends State<ProductGroupScreen> {
  TextEditingController _productGroupNameController = TextEditingController();
  TextEditingController _productGroupDescController = TextEditingController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderProductGroup>(context, listen: false)
        .getListProductGroup(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderProductGroup>(context, listen: false)
        .getListProductGroup(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Group"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () async {
          await NDialog(
            dialogStyle: DialogStyle(titleDivider: true),
            title: Text("Product Group"),
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GeneralTextField(
                      label: "Product Group Name *",
                      hintText: 'Enter Product Group Name',
                      controller: _productGroupNameController,
                    ),
                    SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    GeneralTextField(
                      label: "Description",
                      hintText: 'Enter description',
                      maxLines: 3,
                      controller: _productGroupDescController,
                    ),
                    SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    // DefaultDropdown(
                    //     label: "Group *",
                    //     selectedItem: "Choose",
                    //     onChanged: (String? item) => _groupId = item,
                    //     items: ["Gudang", "Cafe dan Resto", "Retail Bakery"]),
                    // SizedBox(
                    //   height: kDefaultPadding / 2,
                    // ),
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
                        Provider.of<ProviderProductGroup>(context,
                                listen: false)
                            .getListProductGroup(context);
                        Provider.of<ProviderProductGroup>(context,
                                listen: false)
                            .postAddProductGroup(
                                context,
                                _productGroupNameController.text,
                                _productGroupDescController.text);
                        _productGroupNameController.clear();
                        _productGroupDescController.clear();
                      }))
            ],
          ).show(context);
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderProductGroup>(
        builder: (context, data, _) => (data.modelProductGroup == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelProductGroup!.data!.length == 0)
                ? Container()
                : (data.modelProductGroup!.data![0].arrayProdukGroup!.length ==
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
                          itemCount: data.modelProductGroup!.data![0]
                              .arrayProdukGroup!.length,
                          itemBuilder: (BuildContext context, int i) => Card(
                            elevation: 0.4,
                            child: InkWell(
                              onTap: () async {
                                data.isStatusActive = (data
                                            .modelProductGroup!
                                            .data![0]
                                            .arrayProdukGroup![i]
                                            .aktifSt ==
                                        "1")
                                    ? true
                                    : false;
                                _productGroupNameController.text = data
                                    .modelProductGroup!
                                    .data![0]
                                    .arrayProdukGroup![i]
                                    .produkGroupNama!;
                                _productGroupDescController.text = data
                                    .modelProductGroup!
                                    .data![0]
                                    .arrayProdukGroup![i]
                                    .produkGroupDesc!;
                                await NAlertDialog(
                                  dialogStyle: DialogStyle(titleDivider: true),
                                  title: Text("Product Group"),
                                  content: SingleChildScrollView(
                                    child: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GeneralTextField(
                                            label: "Product Group Name",
                                            controller:
                                                _productGroupNameController,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          GeneralTextField(
                                            label: "Description",
                                            maxLines: 3,
                                            controller:
                                                _productGroupDescController,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          StatefulBuilder(
                                            builder: (context,
                                                setState) =>
                                                GeneralSwitch(
                                                    label:
                                                    'Active Status',
                                                    value:
                                                    data.isStatusActive,
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
                                          data.getListProductGroup(context);
                                          data.postEditProductGroup(
                                              context: context,
                                              productGroupName:
                                                  _productGroupNameController
                                                      .text,
                                              productGroupDesc:
                                                  _productGroupDescController
                                                      .text,
                                              activeStatus:
                                                  (data.isStatusActive == true)
                                                      ? "1"
                                                      : "0",
                                              productGroupId: data
                                                  .modelProductGroup!
                                                  .data![0]
                                                  .arrayProdukGroup![i]
                                                  .produkGroupId
                                                  .toString());
                                          _productGroupNameController.clear();
                                          _productGroupDescController.clear();
                                        },
                                        child: Text(
                                          "Save",
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Provider.of<ProviderProductGroup>(
                                                  context,
                                                  listen: false)
                                              .getListProductGroup(context);
                                          data.postDeleteProductGroup(
                                              context: context,
                                              productGroupId: data
                                                  .modelProductGroup!
                                                  .data![0]
                                                  .arrayProdukGroup![i]
                                                  .produkGroupId
                                                  .toString());
                                          _productGroupNameController.clear();
                                          _productGroupDescController.clear();
                                        },
                                        child: Text(
                                          "Delete",
                                          style: TextStyle(color: Colors.red),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          _productGroupNameController.clear();
                                          _productGroupDescController.clear();
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.blue),
                                        )),
                                  ],
                                ).show(context);
                              },
                              child: ListTile(
                                // leading: Image.asset("assets/images/product.png", width: 25, height: 25,),
                                title: Text(
                                  data
                                          .modelProductGroup!
                                          .data![0]
                                          .arrayProdukGroup![i]
                                          .produkGroupNama ??
                                      "-",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                subtitle: Text(
                                  data.modelProductGroup!.data![0]
                                          .arrayProdukGroup![i].groupNama ??
                                      "-",
                                  style: TextStyle(fontSize: 13),
                                ),
                                trailing: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: (data
                                                  .modelProductGroup!
                                                  .data![0]
                                                  .arrayProdukGroup![i]
                                                  .aktifSt ==
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
