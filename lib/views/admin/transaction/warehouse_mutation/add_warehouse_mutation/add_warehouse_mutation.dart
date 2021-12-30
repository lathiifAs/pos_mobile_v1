import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/transaction/p_warehouse_mutation.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';

class AddWarehouseMutation extends StatefulWidget {
  const AddWarehouseMutation({Key? key}) : super(key: key);

  @override
  _AddWarehouseMutationState createState() => _AddWarehouseMutationState();
}

class _AddWarehouseMutationState extends State<AddWarehouseMutation> {
  TextEditingController _qtyController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderWarehouseMutation>(context, listen: false)
        .getDataAdd(context);
    super.initState();
  }

  String gudangAsalId = "";
  String gudangTujuanId = "";
  String produkId = "";
  String satuanId = "";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Warehouse Mutation"),
      ),
      body: Consumer<ProviderWarehouseMutation>(
        builder: (context, data, _) => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<ProviderWarehouseMutation>(
                    builder: (context, data, _) => (data.modelDataAdd == null)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : (data.modelDataAdd!.data == null)
                            ? Container()
                            : (data.modelDataAdd!.data!.arrayGudang!.length ==
                                    0)
                                ? DefaultDropdown(
                                    label: "Origin Warehouse *",
                                    selectedItem: "Data is empty!",
                                    onChanged: (value) {},
                                    items: data.modelDataAdd!.data!.arrayGudang!
                                        .map((e) => e.roleNm)
                                        .toList())
                                : DefaultDropdown(
                                    label: "Origin Warehouse *",
                                    selectedItem: "Choose",
                                    onChanged: (value) {
                                      var name = data
                                          .modelDataAdd!.data!.arrayGudang!
                                          .where((element) =>
                                              element.roleNm == value);
                                      name.forEach((element) {
                                        gudangAsalId =
                                            element.roleId.toString();
                                      });
                                    },
                                    items: data.modelDataAdd!.data!.arrayGudang!
                                        .map((e) => e.roleNm)
                                        .toList())),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Consumer<ProviderWarehouseMutation>(
                    builder: (context, data, _) => (data.modelDataAdd == null)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : (data.modelDataAdd!.data == null)
                            ? Container()
                            : (data.modelDataAdd!.data!.arrayGudang!.length ==
                                    0)
                                ? DefaultDropdown(
                                    label: "Warehouse Destination *",
                                    selectedItem: "Data is empty!",
                                    onChanged: (value) {},
                                    items: data.modelDataAdd!.data!.arrayGudang!
                                        .map((e) => e.roleNm)
                                        .toList())
                                : DefaultDropdown(
                                    label: "Warehouse Destination *",
                                    selectedItem: "Choose",
                                    onChanged: (value) {
                                      var name = data
                                          .modelDataAdd!.data!.arrayGudang!
                                          .where((element) =>
                                              element.roleNm == value);
                                      name.forEach((element) {
                                        gudangTujuanId =
                                            element.roleId.toString();
                                      });
                                    },
                                    items: data.modelDataAdd!.data!.arrayGudang!
                                        .map((e) => e.roleNm)
                                        .toList())),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Consumer<ProviderWarehouseMutation>(
                    builder: (context, data, _) => (data.modelDataAdd == null)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : (data.modelDataAdd!.data == null)
                            ? Container()
                            : (data.modelDataAdd!.data!.arrayGudang!.length ==
                                    0)
                                ? DefaultDropdown(
                                    label: "Product *",
                                    selectedItem: "Data is empty!",
                                    onChanged: (value) {},
                                    items: data.modelDataAdd!.data!.arrayItem!
                                        .map((e) => e.produkNama)
                                        .toList())
                                : DefaultDropdown(
                                    label: "Product *",
                                    selectedItem: "Choose",
                                    onChanged: (value) {
                                      var name = data
                                          .modelDataAdd!.data!.arrayItem!
                                          .where((element) =>
                                              element.produkNama == value);
                                      name.forEach((element) {
                                        produkId = element.produkId.toString();
                                      });
                                    },
                                    items: data.modelDataAdd!.data!.arrayItem!
                                        .map((e) => e.produkNama)
                                        .toList())),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                    label: "Quantity *",
                    controller: _qtyController,
                    inputType: TextInputType.number),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Consumer<ProviderWarehouseMutation>(
                    builder: (context, data, _) => (data.modelDataAdd == null)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : (data.modelDataAdd!.data == null)
                            ? Container()
                            : (data.modelDataAdd!.data!.arrayGudang!.length ==
                                    0)
                                ? DefaultDropdown(
                                    label: "UOM *",
                                    selectedItem: "Data is empty!",
                                    onChanged: (value) {},
                                    items: data.modelDataAdd!.data!.arraySatuan!
                                        .map((e) => e.satuanNama)
                                        .toList())
                                : DefaultDropdown(
                                    label: "UOM *",
                                    selectedItem: "Choose",
                                    onChanged: (value) {
                                      var name = data
                                          .modelDataAdd!.data!.arraySatuan!
                                          .where((element) =>
                                              element.satuanNama == value);
                                      name.forEach((element) {
                                        satuanId = element.satuanId.toString();
                                      });
                                    },
                                    items: data.modelDataAdd!.data!.arraySatuan!
                                        .map((e) => e.satuanNama)
                                        .toList())),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: DefaultButton(
                      backgroundColor: kButtonColor,
                      buttonText: "Save",
                      onPressed: () {
                        data.postAdd(context, gudangAsalId, gudangTujuanId,
                            produkId, _qtyController.text, satuanId);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
