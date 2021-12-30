import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/transaction/p_stock_opname.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddStockOpname extends StatefulWidget {
  const AddStockOpname({Key? key}) : super(key: key);

  @override
  _AddStockOpnameState createState() => _AddStockOpnameState();
}

class _AddStockOpnameState extends State<AddStockOpname> {
  TextEditingController _controllerDate = TextEditingController();
  TextEditingController _controllerDesc = TextEditingController();
  String date = "";
  String roleId = "";

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderStockOpname>(context, listen: false)
        .getGudangSO(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    DateTime now = DateTime.now();
    String currentDate = DateFormat('yyyy-MM-dd').format(now);
    return Consumer<ProviderStockOpname>(
      builder: (context, data, _) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Add Stock Opname"),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: GeneralTextField(
                controller: _controllerDate,
                label: "Date *",
                readOnly: true,
                hintText: currentDate,
                colorHint: Colors.black,
                suffixIcon: Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                  size: 20,
                ),
                onTap: () async {
                  await NDialog(
                    content: Container(
                      width: SizeConfig.screenWidth * 0.8,
                      height: SizeConfig.screenHeight * 0.5,
                      padding: EdgeInsets.only(top: kDefaultPadding),
                      child: SfDateRangePicker(
                        onSelectionChanged: data.getDate,
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _controllerDate.text = data.dateNow!;
                          },
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.blue),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel",
                              style: TextStyle(color: Colors.black)))
                    ],
                  ).show(context);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Consumer<ProviderStockOpname>(
                builder: (context, data, _) => (data.modelAddStep1 == null)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : (data.modelAddStep1!.data == null)
                        ? Container()
                        : (data.modelAddStep1!.data!.arrayGudang!.length == 0)
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: DefaultDropdown(
                                    label: "Warehouse *",
                                    selectedItem: "Data is empty!",
                                    onChanged: (value) {},
                                    items: data
                                        .modelAddStep1!.data!.arrayGudang!
                                        .map((e) => e.roleNm)
                                        .toList()),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: DefaultDropdown(
                                    label: "Warehouse *",
                                    selectedItem: "Choose",
                                    onChanged: (value) {
                                      var name = data
                                          .modelAddStep1!.data!.arrayGudang!
                                          .where((element) =>
                                              element.roleNm == value);
                                      name.forEach((element) {
                                        roleId = element.roleId.toString();
                                      });
                                      data.getProductSO(
                                          context: context,
                                          inputRoleId: roleId);
                                    },
                                    items: data
                                        .modelAddStep1!.data!.arrayGudang!
                                        .map((e) => e.roleNm)
                                        .toList()),
                              )),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: GeneralTextField(
                controller: _controllerDesc,
                label: "Description",
                hintText: 'Enter description',
                maxLines: 3,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            (roleId == "")
                ? Container()
                : Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "List Items",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Consumer<ProviderStockOpname>(
                          builder: (context, data, _) =>
                              (data.modelAddStep2 == null)
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : (data.modelAddStep2!.data == null)
                                      ? Container()
                                      : (data.modelAddStep2!.data!.arrayProduk!
                                                  .length ==
                                              0)
                                          ? Expanded(
                                              child: Center(
                                                child: Text("Empty data!"),
                                              ),
                                            )
                                          : Expanded(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: ListView.builder(
                                                  itemCount: data
                                                      .modelAddStep2!
                                                      .data!
                                                      .arrayProduk!
                                                      .length,
                                                  itemBuilder: (c, i) =>
                                                      Container(
                                                    padding: EdgeInsets.all(10),
                                                    margin:
                                                        EdgeInsets.only(top: 5),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(data
                                                                    .modelAddStep2!
                                                                    .data!
                                                                    .arrayProduk![
                                                                        i]
                                                                    .produkNama ??
                                                                "-"),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "(${data.modelAddStep2!.data!.arrayProduk![i].satuanNama ?? '-'})",
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(data
                                                                .modelAddStep2!
                                                                .data!
                                                                .arrayProduk![i]
                                                                .stok
                                                                .toString()),
                                                            SizedBox(
                                                              width: 50,
                                                            ),
                                                            Container(
                                                              width: 25,
                                                              height: 25,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape: BoxShape
                                                                    .circle,
                                                                border: Border.all(
                                                                    color:
                                                                        kPrimaryColor),
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  data.updateStock(
                                                                      i: i,
                                                                      isMinus:
                                                                          true);
                                                                },
                                                                child: Center(
                                                                  child: Text(
                                                                    "-",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color:
                                                                            kPrimaryColor),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            InkWell(
                                                              onTap: () async {
                                                                TextEditingController
                                                                    _controllerQty =
                                                                    TextEditingController();
                                                                _controllerQty.text = data
                                                                    .modelAddStep2!
                                                                    .data!
                                                                    .arrayProduk![
                                                                        i]
                                                                    .stok
                                                                    .toString();
                                                                await NDialog(
                                                                  content:
                                                                      Container(
                                                                    width: SizeConfig
                                                                            .screenWidth *
                                                                        0.4,
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                kDefaultPadding),
                                                                    child:
                                                                        GeneralTextField(
                                                                      label:
                                                                          "Quantity",
                                                                      controller:
                                                                          _controllerQty,
                                                                      inputType:
                                                                          TextInputType
                                                                              .number,
                                                                      onSubmitted:
                                                                          (value) {
                                                                        data.updateStock(
                                                                            i: i,
                                                                            quantity: int.parse(_controllerQty.text),
                                                                            isDialog: true);
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    ),
                                                                  ),
                                                                  actions: <
                                                                      Widget>[
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          data.updateStock(
                                                                              i: i,
                                                                              quantity: int.parse(_controllerQty.text),
                                                                              isDialog: true);
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          "OK",
                                                                          style:
                                                                              TextStyle(color: Colors.blue),
                                                                        )),
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: Text(
                                                                            "Cancel",
                                                                            style:
                                                                                TextStyle(color: Colors.black)))
                                                                  ],
                                                                ).show(context);
                                                              },
                                                              child: Container(
                                                                width: 30,
                                                                child: Center(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Text(
                                                                        "${data.modelAddStep2!.data!.arrayProduk![i].stok}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      Divider(
                                                                        color: Colors
                                                                            .grey,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                              width: 25,
                                                              height: 25,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape: BoxShape
                                                                    .circle,
                                                                border: Border.all(
                                                                    color:
                                                                        kPrimaryColor),
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  data.updateStock(
                                                                      i: i,
                                                                      isMinus:
                                                                          false);
                                                                },
                                                                child: Center(
                                                                  child: Text(
                                                                    "+",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color:
                                                                            kPrimaryColor),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                        ),
                      ],
                    ),
                  ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: DefaultButton(
                  backgroundColor: kButtonColor,
                  buttonText: "Submit",
                  onPressed: () {
                    // print(
                    //     jsonEncode(data.modelAddStep2!.data!.arrayProduk));
                    data.postSubmitSO(
                        context: context,
                        inputRoleId: roleId,
                        keterangan: _controllerDesc.text,
                        itemsOpname:
                            jsonEncode(data.modelAddStep2!.data!.arrayProduk));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
