import 'dart:convert';

import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pointofsales/providers/admin/p_product.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/currency_formatters.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_switch.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';

class AddSiapJual extends StatefulWidget {
  const AddSiapJual({Key? key}) : super(key: key);

  @override
  _AddSiapJualState createState() => _AddSiapJualState();
}

class _AddSiapJualState extends State<AddSiapJual> {
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _aliasContr = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();
  TextEditingController _rankingController = TextEditingController();
  TextEditingController _minStockCont = TextEditingController();
  TextEditingController _maxStockCont = TextEditingController();

  String salesGroupId = "";
  String productPrice = "";
  String kitchenId = "";
  String satuanDasarId = "";

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderProduct>(context, listen: false);
      data.getDataAdd(context, "3");
      data.favStatus = false;
      data.listDataRetail = [];
      data.fileImgCoverAddSiapJual = null;
      data.imgCoverAddSiapJual = "";
      data.fileImgSiapJual1 = null;
      data.imgSiapJual1 = "";
      data.fileImgSiapJual2 = null;
      data.fileImgSiapJual3 = null;
      data.imgSiapJual2 = "";
      data.imgSiapJual3 = "";
      data.fileImgSiapJual4 = null;
      data.imgSiapJual4 = "";
      data.fileImgSiapJual5 = null;
      data.imgSiapJual5 = "";
    });
    if (Provider.of<ProviderProduct>(context, listen: false)
        .formRetail
        .isNotEmpty) {
      Provider.of<ProviderProduct>(context, listen: false).formRetail.clear();
    }

    Provider.of<ProviderProduct>(context, listen: false).addForm();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<ProviderProduct>(
      builder: (context, data, _) => Scaffold(
          appBar: AppBar(
            title: Text("Add Data"),
          ),
          body: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(kDefaultPadding),
            children: [
              Text(
                "Product Cover Image *",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                  onTap: () {
                    data.getImgCoverAddSiapJual();
                  },
                  child: (data.fileImgCoverAddSiapJual == null)
                      ? Container(
                          width: double.infinity,
                          height: SizeConfig.screenHeight * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            color: Colors.white,
                            size: 50,
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          height: SizeConfig.screenHeight * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Image.file(
                            data.fileImgCoverAddSiapJual!,
                            fit: BoxFit.cover,
                          ),
                        )),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Text(
                "Product Image",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      data.getImgSiapJual1();
                    },
                    child: (data.fileImgSiapJual1 == null)
                        ? Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              color: Colors.white,
                            ),
                          )
                        : Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Image.file(
                              data.fileImgSiapJual1!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      data.getImgSiapJual2();
                    },
                    child: (data.fileImgSiapJual2 == null)
                        ? Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              color: Colors.white,
                            ),
                          )
                        : Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Image.file(
                              data.fileImgSiapJual2!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      data.getImgSiapJual3();
                    },
                    child: (data.fileImgSiapJual3 == null)
                        ? Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              color: Colors.white,
                            ),
                          )
                        : Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Image.file(
                              data.fileImgSiapJual3!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      data.getImgSiapJual4();
                    },
                    child: (data.fileImgSiapJual4 == null)
                        ? Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              color: Colors.white,
                            ),
                          )
                        : Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Image.file(
                              data.fileImgSiapJual4!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ],
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              GeneralTextField(
                label: "Product Name *",
                controller: _productNameController,
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              GeneralTextField(
                label: "Alias *",
                controller: _aliasContr,
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              GeneralTextField(
                label: "Sales Price *",
                controller: _productPriceController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CurrencyFormatters(maxDigits: 12)
                ],
                inputType: TextInputType.number,
              ),
              // Consumer<ProviderProduct>(
              //     builder: (context, data, _) => (data.modelGetDataParams ==
              //             null)
              //         ? Center(
              //             child: CircularProgressIndicator(),
              //           )
              //         : (data.modelGetDataParams!.data == null)
              //             ? Container()
              //             : (data.modelGetDataParams!.data!.arrayRetail!
              //                         .length ==
              //                     0)
              //                 ? FindDropdown<String?>(
              //                     label: "Retail *",
              //                     selectedItem: "Data retail is empty!",
              //                     labelStyle: TextStyle(
              //                         fontSize: 12,
              //                         fontWeight: FontWeight.bold),
              //                     onChanged: (value) {
              //                       var retailName = data
              //                           .modelGetDataParams!.data!.arrayRetail!
              //                           .where((element) =>
              //                               element.roleNm == value);
              //                       retailName.forEach((element) {});
              //                     },
              //                     items: data
              //                         .modelGetDataParams!.data!.arrayRetail!
              //                         .map((e) => e.roleNm)
              //                         .toList(),
              //                     dropdownBuilder: (c, v) {
              //                       return Container(
              //                           width: double.infinity,
              //                           padding: EdgeInsets.all(10),
              //                           decoration: BoxDecoration(
              //                             color: Colors.white,
              //                             borderRadius:
              //                                 BorderRadius.circular(6),
              //                             boxShadow: [
              //                               BoxShadow(
              //                                 color: Colors.grey,
              //                                 offset: Offset(0.0, 1.0),
              //                                 //(x,y)
              //                                 blurRadius: 4.0,
              //                               ),
              //                             ],
              //                           ),
              //                           child: Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.spaceBetween,
              //                             children: [
              //                               Expanded(
              //                                 child: Text(
              //                                   "$v",
              //                                   overflow: TextOverflow.ellipsis,
              //                                 ),
              //                               ),
              //                               Icon(Icons.arrow_drop_down_outlined)
              //                             ],
              //                           ));
              //                     },
              //                   )
              //                 : ListView.builder(
              //                     shrinkWrap: true,
              //                     physics: ClampingScrollPhysics(),
              //                     itemCount: data.formRetail.length,
              //                     itemBuilder: (c, i) => Container(
              //                       margin: EdgeInsets.only(bottom: 10),
              //                       child: Row(
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.spaceBetween,
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.end,
              //                         children: [
              //                           Flexible(
              //                             flex: 4,
              //                             child: FindDropdown<String?>(
              //                               label: "Retail *",
              //                               selectedItem: data.formRetail[i]
              //                                       .selectedItem ??
              //                                   "Choose",
              //                               labelStyle: TextStyle(
              //                                   fontSize: 12,
              //                                   fontWeight: FontWeight.bold),
              //                               onChanged: (value) {
              //                                 var roleName = data
              //                                     .modelDataAdd!
              //                                     .data!
              //                                     .arrayRetail!
              //                                     .where((element) =>
              //                                         element.roleNm == value)
              //                                     .toList();
              //                                 data.formRetail[i].selectedItem =
              //                                     roleName[0].roleId.toString();
              //
              //                                 int add = 0;
              //                                 data.formRetail
              //                                     .forEach((element) {
              //                                   setState(() {
              //                                     if (element.selectedItem !=
              //                                         null) {
              //                                       add = 1;
              //                                     } else {
              //                                       add = 0;
              //                                     }
              //                                   });
              //                                 });
              //
              //                                 setState(() {
              //                                   data.addForm();
              //                                 });
              //                               },
              //                               items: data.modelDataAdd!
              //                                   .data!.arrayRetail!
              //                                   .map((e) => e.roleNm)
              //                                   .toList(),
              //                               dropdownBuilder: (c, v) {
              //                                 return Container(
              //                                     width: double.infinity,
              //                                     padding: EdgeInsets.all(10),
              //                                     decoration: BoxDecoration(
              //                                       color: Colors.white,
              //                                       borderRadius:
              //                                           BorderRadius.circular(
              //                                               6),
              //                                       boxShadow: [
              //                                         BoxShadow(
              //                                           color: Colors.grey,
              //                                           offset:
              //                                               Offset(0.0, 1.0),
              //                                           //(x,y)
              //                                           blurRadius: 4.0,
              //                                         ),
              //                                       ],
              //                                     ),
              //                                     child: Row(
              //                                       mainAxisAlignment:
              //                                           MainAxisAlignment
              //                                               .spaceBetween,
              //                                       children: [
              //                                         Expanded(
              //                                           child: Text(
              //                                             "$v",
              //                                             overflow: TextOverflow
              //                                                 .ellipsis,
              //                                           ),
              //                                         ),
              //                                         Icon(Icons
              //                                             .arrow_drop_down_outlined)
              //                                       ],
              //                                     ));
              //                               },
              //                             ),
              //                           ),
              //                           Flexible(
              //                               flex: 1,
              //                               child: i == 0
              //                                   ? Container()
              //                                   : FloatingActionButton(
              //                                       backgroundColor: Colors.red,
              //                                       onPressed: () {
              //                                         setState(() {
              //                                           data.deleteForm(i);
              //                                         });
              //                                       },
              //                                       child: Icon(Icons.delete),
              //                                       mini: true,
              //                                     ))
              //                         ],
              //                       ),
              //                     ),
              //                   )),
              SizedBox(
                height: 10,
              ),
              Consumer<ProviderProduct>(
                builder: (context, data, _) => (data.modelDataAdd == null)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : (data.modelDataAdd!.data == null)
                        ? Container()
                        : (data.modelDataAdd!.data!.arraySales!.length == 0)
                            ? DefaultDropdown(
                                label: "Sales Group Name",
                                selectedItem: "Data is empty!",
                                onChanged: (value) {},
                                items: data.modelDataAdd!.data!.arraySales!
                                    .map((e) => e.salesGroupNama)
                                    .toList())
                            : DefaultDropdown(
                                label: "Sales Group Name *",
                                selectedItem: "Choose",
                                onChanged: (value) {
                                  var salesGroupName = data
                                      .modelDataAdd!.data!.arraySales!
                                      .where((element) =>
                                          element.salesGroupNama == value);
                                  salesGroupName.forEach((element) {
                                    salesGroupId =
                                        element.salesGroupId.toString();
                                  });
                                },
                                items: data.modelDataAdd!.data!.arraySales!
                                    .map((e) => e.salesGroupNama)
                                    .toList(),
                              ),
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<ProviderProduct>(
                  builder: (context, data, _) => (data.modelDataAdd == null)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : (data.modelDataAdd!.data == null)
                          ? Container()
                          : (data.modelDataAdd!.data!.arrayKitchen!.length == 0)
                              ? DefaultDropdown(
                                  label: "Kitchen *",
                                  selectedItem: "Data is empty!",
                                  onChanged: (value) {},
                                  items: data.modelDataAdd!.data!.arrayKitchen!
                                      .map((e) => e.kitchenNama)
                                      .toList())
                              : DefaultDropdown(
                                  label: "Kitchen *",
                                  selectedItem: "Choose",
                                  onChanged: (value) {
                                    var name = data
                                        .modelDataAdd!.data!.arrayKitchen!
                                        .where((element) =>
                                            element.kitchenNama == value);
                                    name.forEach((element) {
                                      kitchenId = element.kitchenId.toString();
                                    });
                                  },
                                  items: data.modelDataAdd!.data!.arrayKitchen!
                                      .map((e) => e.kitchenNama)
                                      .toList())),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Consumer<ProviderProduct>(
                  builder: (context, data, _) => (data.modelDataAdd == null)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : (data.modelDataAdd!.data == null)
                          ? Container()
                          : (data.modelDataAdd!.data!.arraySatuan!.length == 0)
                              ? DefaultDropdown(
                                  label: "UOM *",
                                  selectedItem: "UOM is empty!",
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
                                      satuanDasarId =
                                          element.satuanId.toString();
                                    });
                                  },
                                  items: data.modelDataAdd!.data!.arraySatuan!
                                      .map((e) => e.satuanNama)
                                      .toList())),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              GeneralTextField(
                label: "Ranking *",
                controller: _rankingController,
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: GeneralTextField(
                      label: "Min. Stock *",
                      controller: _minStockCont,
                      inputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Expanded(
                    child: GeneralTextField(
                      label: "Max. Stock *",
                      controller: _maxStockCont,
                      inputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              GeneralSwitch(
                  label: 'Favorite Status',
                  value: data.favStatus,
                  onChange: (value) {
                    data.favStatus = value;
                  }),
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
                      productPrice =
                          _productPriceController.text.replaceAll(".", "");
                      data.onSubmitted();
                      // print(salesGroupId);
                      // print(data.imgCoverAddSiapJual);
                      // print(data.imgSiapJual1);
                      // print(data.imgSiapJual2);
                      // print(data.imgSiapJual3);
                      // print(data.imgSiapJual4);
                      // print(_productNameController.text);
                      // print(productPrice);
                      // print(jsonEncode(data.listDataRetail));
                      // print(salesGroupId);
                      data.postAddSiapJual(
                          context,
                          _productNameController.text,
                          productPrice,
                          "3",
                          // jsonEncode(data.listDataRetail),
                          salesGroupId,
                          data.imgCoverAddSiapJual!,
                          data.imgSiapJual1!,
                          data.imgSiapJual2!,
                          data.imgSiapJual3!,
                          data.imgSiapJual4!,
                          kitchenId,
                          _rankingController.text,
                          satuanDasarId,
                          _minStockCont.text,
                          _maxStockCont.text,
                          (data.favStatus == false) ? '0' : '1',
                          _aliasContr.text);
                    }),
              )
            ],
          )),
    );
  }
}
