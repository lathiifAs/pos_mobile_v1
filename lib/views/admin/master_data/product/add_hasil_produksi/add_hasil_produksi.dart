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

class AddHasilProduksi extends StatefulWidget {
  const AddHasilProduksi({Key? key, required this.productGroupId})
      : super(key: key);

  final String productGroupId;

  @override
  _AddHasilProduksiState createState() => _AddHasilProduksiState();
}

class _AddHasilProduksiState extends State<AddHasilProduksi> {
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _aliasContr = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();
  TextEditingController _rankingController = TextEditingController();
  TextEditingController _minStockCont = TextEditingController();
  TextEditingController _maxStockCont = TextEditingController();

  String salesGroupId = "";
  String productPrice = "";
  String groupId = "";
  String kitchenId = "";
  String satuanDasarId = "";

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderProduct>(context, listen: false);
      data.getDataAdd(context, "2");
      data.listDataFormResep = [];
      data.fileImgCoverHasilProduksi = null;
      data.imgCoverHasilProduksi = "";
      data.fileImgHasilProduksi1 = null;
      data.imgHasilProduksi1 = "";
      data.fileImgHasilProduksi2 = null;
      data.imgHasilProduksi2 = "";
      data.fileImgHasilProduksi3 = null;
      data.imgHasilProduksi3 = "";
      data.fileImgHasilProduksi4 = null;
      data.imgHasilProduksi4 = "";
      data.fileImgHasilProduksi5 = null;
      data.imgHasilProduksi5 = "";
      data.favStatus = false;
    });
    if (Provider.of<ProviderProduct>(context, listen: false)
        .formResep
        .isNotEmpty) {
      Provider.of<ProviderProduct>(context, listen: false).formResep.clear();
    }
    Provider.of<ProviderProduct>(context, listen: false).addFormResep();

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
                    data.getImgCoverHasilProduksi();
                  },
                  child: (data.fileImgCoverHasilProduksi == null)
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
                            data.fileImgCoverHasilProduksi!,
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
                      data.getImgHasilProduksi1();
                    },
                    child: (data.fileImgHasilProduksi1 == null)
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
                              data.fileImgHasilProduksi1!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      data.getImgHasilProduksi2();
                    },
                    child: (data.fileImgHasilProduksi2 == null)
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
                              data.fileImgHasilProduksi2!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      data.getImgHasilProduksi3();
                    },
                    child: (data.fileImgHasilProduksi3 == null)
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
                              data.fileImgHasilProduksi3!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      data.getImgHasilProduksi4();
                    },
                    child: (data.fileImgHasilProduksi4 == null)
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
                              data.fileImgHasilProduksi4!,
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
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              GeneralTextField(
                label: "Ranking *",
                controller: _rankingController,
                inputType: TextInputType.number,
              ),
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
              // Consumer<ProviderProduct>(
              //     builder: (context, data, _) => (data.modelDataAdd == null)
              //         ? Center(
              //             child: CircularProgressIndicator(),
              //           )
              //         : (data.modelDataAdd!.data == null)
              //             ? Container()
              //             : (data.modelDataAdd!.data!.arraySatuan!.length == 0)
              //                 ? DefaultDropdown(
              //                     label: "Unit *",
              //                     selectedItem: "Unit is empty!",
              //                     onChanged: (value) {},
              //                     items: data.modelDataAdd!.data!.arraySatuan!
              //                         .map((e) => e.satuanNama)
              //                         .toList())
              //                 : DefaultDropdown(
              //                     label: "Unit *",
              //                     selectedItem: "Choose",
              //                     onChanged: (value) {
              //                       var name = data
              //                           .modelDataAdd!.data!.arraySatuan!
              //                           .where((element) =>
              //                               element.satuanNama == value);
              //                       name.forEach((element) {
              //                         satuanDasarId =
              //                             element.satuanId.toString();
              //                       });
              //                     },
              //                     items: data.modelDataAdd!.data!.arraySatuan!
              //                         .map((e) => e.satuanNama)
              //                         .toList())),
              // SizedBox(
              //   height: kDefaultPadding / 2,
              // ),
              DefaultDropdown(
                label: "Group *",
                selectedItem: "Choose",
                onChanged: (String? item) => groupId = item!,
                items: ["Cafe & Resto", "Retail Bakery"],
              ),
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
                        : (data.modelDataAdd!.data!.arraySales!.length == 0)
                            ? DefaultDropdown(
                                label: "Sales Group Name *",
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
                height: kDefaultPadding / 2,
              ),
              Consumer<ProviderProduct>(
                  builder: (context, data, _) => (data.modelDataAdd == null)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : (data.modelDataAdd!.data == null)
                          ? Container()
                          : (data.modelDataAdd!.data!.arrayBahanBaku!.length ==
                                  0)
                              ? Text(
                                  "array_bahan_baku null | array_satuan null")
                              : (data.modelDataAdd!.data!.arraySatuan!.length ==
                                      0)
                                  ? Text(
                                      "array_bahan_baku null | array_satuan null")
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      itemCount: data.formResep.length,
                                      itemBuilder: (c, i) => Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: DefaultDropdown(
                                                label: (i == 0)
                                                    ? "Bahan Baku *"
                                                    : "",
                                                selectedItem: data.formResep[i]
                                                        .selectedItemBahanBaku ??
                                                    "Choose",
                                                onChanged: (value) {
                                                  var name = data.modelDataAdd!
                                                      .data!.arrayBahanBaku!
                                                      .where((element) =>
                                                          element.produkNama ==
                                                          value)
                                                      .toList();
                                                  data.formResep[i]
                                                          .selectedItemBahanBaku =
                                                      name[0]
                                                          .produkId
                                                          .toString();
                                                },
                                                items: data.modelDataAdd!.data!
                                                    .arrayBahanBaku!
                                                    .map((e) => e.produkNama)
                                                    .toList(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    (i == 0)
                                                        ? Text(
                                                            "Qty *",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        : Container(),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      height: 60,
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .shade300)),
                                                      child: Center(
                                                        child: TextField(
                                                          controller: data
                                                              .formResep[i]
                                                              .qtyController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: DefaultDropdown(
                                                label: (i == 0) ? "UOM *" : "",
                                                selectedItem: data.formResep[i]
                                                        .selectedItemUnit ??
                                                    "Choose",
                                                onChanged: (value) {
                                                  var name = data.modelDataAdd!
                                                      .data!.arraySatuan!
                                                      .where((element) =>
                                                          element.satuanNama ==
                                                          value)
                                                      .toList();
                                                  data.formResep[i]
                                                          .selectedItemUnit =
                                                      name[0]
                                                          .satuanId
                                                          .toString();

                                                  int add = 0;
                                                  data.formResep
                                                      .forEach((element) {
                                                    setState(() {
                                                      if (element.selectedItemUnit !=
                                                              null &&
                                                          element
                                                              .qtyController
                                                              .text
                                                              .isNotEmpty &&
                                                          element.selectedItemBahanBaku !=
                                                              null) {
                                                        add = 1;
                                                      } else {
                                                        add = 0;
                                                      }
                                                    });
                                                  });

                                                  setState(() {
                                                    data.addFormResep();
                                                  });
                                                },
                                                items: data.modelDataAdd!.data!
                                                    .arraySatuan!
                                                    .map((e) => e.satuanNama)
                                                    .toList(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: i == 0
                                                    ? Container()
                                                    : FloatingActionButton(
                                                        heroTag: "deleteRecipe",
                                                        onPressed: () {
                                                          setState(() {
                                                            data.deleteFormResep(
                                                                i);
                                                          });
                                                        },
                                                        mini: true,
                                                        backgroundColor:
                                                            Colors.red,
                                                        child:
                                                            Icon(Icons.delete),
                                                      ))
                                          ],
                                        ),
                                      ),
                                    )),
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
                      data.onSubmittedFormResep();
                      data.postAddHasilProduksi(
                          context,
                          _productNameController.text,
                          productPrice,
                          "2",
                          salesGroupId,
                          data.imgCoverHasilProduksi!,
                          data.imgHasilProduksi1!,
                          data.imgHasilProduksi2!,
                          data.imgHasilProduksi3!,
                          data.imgHasilProduksi4!,
                          kitchenId,
                          _rankingController.text,
                          jsonEncode(data.listDataFormResep),
                          data.listDataFormResep.length.toString(),
                          _minStockCont.text,
                          _maxStockCont.text,
                          (data.favStatus == false) ? '0' : '1',
                          _aliasContr.text);
                      // print(jsonEncode(data.listDataFormResep));
                      // print(data.listDataFormResep.length);
                    }),
              )
            ],
          )),
    );
  }
}
