import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_discount.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/currency_formatters.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DetailDiscountScreen extends StatefulWidget {
  const DetailDiscountScreen({Key? key, required this.discountId})
      : super(key: key);

  final String discountId;

  @override
  _DetailDiscountScreenState createState() => _DetailDiscountScreenState();
}

class _DetailDiscountScreenState extends State<DetailDiscountScreen> {
  TextEditingController _discountNameController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  TextEditingController _minPurchaseController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _percentController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();
  String minPurchase = "";

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderDiscount>(context, listen: false);
      data.getDataEdit(context, widget.discountId);
    });
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   var data = Provider.of<ProviderDiscount>(context, listen: false);
    //   data.getDataGroup(context, "3");
    // });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderDiscount>(context, listen: false);
      data.groupId = null;
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderDiscount>(context, listen: false);
      data.salesGroupId = null;
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderDiscount>(context, listen: false);
      data.produkId = null;
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderDiscount>(context, listen: false);
      data.startDate = null;
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderDiscount>(context, listen: false);
      data.endDate = null;
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderDiscount>(context, listen: false);
      data.fileImgDiscount = null;
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderDiscount>(context, listen: false);
      data.imgDiscount = null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Discount"),
      ),
      body: Consumer<ProviderDiscount>(
        builder: (context, data, _) => (data.modelDataEdit == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelDataGroup == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (data.modelDataEdit!.data == null)
                    ? Container()
                    : (data.modelDataGroup!.data == null)
                        ? Container()
                        : (data.modelDataEdit!.data!.result == null)
                            ? Container()
                            : (data.modelDataEdit!.data!.arrayGroup!.length ==
                                    0)
                                ? EmptyData()
                                : SingleChildScrollView(
                                    child: Container(
                                      margin: EdgeInsets.all(kDefaultPadding),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              data.getImageDiscount();
                                            },
                                            child: (data.fileImgDiscount ==
                                                    null)
                                                ? Container(
                                                    width:
                                                        SizeConfig.screenWidth *
                                                            0.7,
                                                    height: SizeConfig
                                                            .screenHeight *
                                                        0.23,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                            BaseUrl.imageUrl +
                                                                data
                                                                    .modelDataEdit!
                                                                    .data!
                                                                    .result!
                                                                    .diskonPath! +
                                                                data
                                                                    .modelDataEdit!
                                                                    .data!
                                                                    .result!
                                                                    .diskonFile!,
                                                          )),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                  )
                                                : Container(
                                                    width:
                                                        SizeConfig.screenWidth *
                                                            0.7,
                                                    height: SizeConfig
                                                            .screenHeight *
                                                        0.23,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Image.file(
                                                      data.fileImgDiscount!,
                                                      fit: BoxFit.cover,
                                                    )),
                                          ),
                                          SizedBox(
                                            height: kDefaultPadding,
                                          ),
                                          GeneralTextField(
                                            label: "Discount Name",
                                            hintText: data.modelDataEdit!.data!
                                                .result!.diskonNama,
                                            colorHint: Colors.black,
                                            onChanged: (value) {
                                              _discountNameController.text =
                                                  value;
                                            },
                                          ),
                                          SizedBox(
                                            height: kDefaultPadding / 2,
                                          ),
                                          GeneralTextField(
                                            label: "Description",
                                            maxLines: 3,
                                            hintText: data.modelDataEdit!.data!
                                                .result!.diskonDesc,
                                            colorHint: Colors.black,
                                            onChanged: (value) {
                                              _descController.text = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: kDefaultPadding / 2,
                                          ),
                                          // FindDropdown<String?>(
                                          //   label: "Group *",
                                          //   selectedItem: data.modelDataEdit!
                                          //       .data!.result!.groupNama,
                                          //   labelStyle: TextStyle(
                                          //       fontSize: 12),
                                          //   onChanged: (value) {
                                          //     var groupNama = data
                                          //         .modelDataEdit!
                                          //         .data!
                                          //         .arrayGroup!
                                          //         .where((element) =>
                                          //             element.groupNama ==
                                          //             value);
                                          //     groupNama.forEach((element) {
                                          //       data.groupId = element.groupId;
                                          //     });
                                          //     data.getDataGroup(
                                          //         context, data.groupId!);
                                          //   },
                                          //   items: data.modelDataEdit!.data!
                                          //       .arrayGroup!
                                          //       .map((e) => e.groupNama)
                                          //       .toList(),
                                          // ),
                                          // SizedBox(
                                          //   height: kDefaultPadding / 2,
                                          // ),
                                          // Column(
                                          //   mainAxisSize: MainAxisSize.min,
                                          //   children: [
                                          //     FindDropdown<String?>(
                                          //       label: "Sales Group",
                                          //       selectedItem: (data
                                          //                   .modelDataEdit!
                                          //                   .data!
                                          //                   .result!
                                          //                   .salesGroupNama ==
                                          //               null)
                                          //           ? "Choose"
                                          //           : data.modelDataEdit!.data!
                                          //               .result!.salesGroupNama,
                                          //       labelStyle: TextStyle(
                                          //           fontSize: 12),
                                          //       onChanged: (value) {
                                          //         var namaSalesGroup = data
                                          //             .modelDataGroup!
                                          //             .data!
                                          //             .arraySalesGroup!
                                          //             .where((element) =>
                                          //                 element
                                          //                     .salesGroupNama ==
                                          //                 value);
                                          //         namaSalesGroup
                                          //             .forEach((element) {
                                          //           data.salesGroupId = element
                                          //               .salesGroupId
                                          //               .toString();
                                          //         });
                                          //       },
                                          //       items: data.modelDataGroup!
                                          //           .data!.arraySalesGroup!
                                          //           .map(
                                          //               (e) => e.salesGroupNama)
                                          //           .toList(),
                                          //     ),
                                          //     SizedBox(
                                          //       height: kDefaultPadding / 2,
                                          //     ),
                                          //     FindDropdown<String?>(
                                          //       label: "Produk",
                                          //       selectedItem: (data
                                          //                   .modelDataEdit!
                                          //                   .data!
                                          //                   .result!
                                          //                   .produkNama ==
                                          //               null)
                                          //           ? "Choose"
                                          //           : data.modelDataEdit!.data!
                                          //               .result!.produkNama,
                                          //       labelStyle: TextStyle(
                                          //           fontSize: 12),
                                          //       onChanged: (value) {
                                          //         var produkName = data
                                          //             .modelDataGroup!
                                          //             .data!
                                          //             .arrayProduk!
                                          //             .where((element) =>
                                          //                 element.produkNama ==
                                          //                 value);
                                          //         produkName.forEach((element) {
                                          //           data.produkId = element
                                          //               .produkId
                                          //               .toString();
                                          //         });
                                          //       },
                                          //       items: data.modelDataGroup!
                                          //           .data!.arrayProduk!
                                          //           .map((e) => e.produkNama)
                                          //           .toList(),
                                          //     ),
                                          //     SizedBox(
                                          //       height: kDefaultPadding / 2,
                                          //     ),
                                          //   ],
                                          // ),
                                          GeneralTextField(
                                            label: "Min. Purchase",
                                            hintText: NumberFormat.currency(
                                                    locale: 'id',
                                                    decimalDigits: 0,
                                                    symbol: 'Rp ')
                                                .format(data
                                                    .modelDataEdit!
                                                    .data!
                                                    .result!
                                                    .diskonSyaratJmlPembelian),
                                            colorHint: Colors.black,
                                            onChanged: (value) {
                                              _minPurchaseController.text =
                                                  value;
                                            },
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              CurrencyFormatters(maxDigits: 12)
                                            ],
                                            inputType: TextInputType.number,
                                          ),
                                          SizedBox(
                                            height: kDefaultPadding / 2,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: DefaultTextInput(
                                                    controller:
                                                        _startDateController,
                                                    hintText: data
                                                        .modelDataEdit!
                                                        .data!
                                                        .result!
                                                        .diskonTglMulai!
                                                        .substring(0, 10),
                                                    onChanged: (value) {
                                                      _startDateController
                                                          .text = value;
                                                    },
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    labelText: "Start date *",
                                                    suffixIcon: Icon(
                                                      Icons.calendar_today,
                                                      color: Colors.grey,
                                                      size: 20,
                                                    ),
                                                    onTap: () async {
                                                      await NDialog(
                                                        content: Container(
                                                          width: SizeConfig
                                                                  .screenWidth *
                                                              0.8,
                                                          height: SizeConfig
                                                                  .screenHeight *
                                                              0.5,
                                                          padding: EdgeInsets.only(
                                                              top:
                                                                  kDefaultPadding),
                                                          child:
                                                              SfDateRangePicker(
                                                            onSelectionChanged:
                                                                data.getStartDate,
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                                _startDateController
                                                                        .text =
                                                                    data.startDate!;
                                                              },
                                                              child: Text(
                                                                "OK",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue),
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
                                                                          .black)))
                                                        ],
                                                      ).show(context);
                                                    },
                                                    readOnly: true,
                                                    obscureText: false,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: DefaultTextInput(
                                                    controller:
                                                        _endDateController,
                                                    hintText: data
                                                        .modelDataEdit!
                                                        .data!
                                                        .result!
                                                        .diskonTglExp!
                                                        .substring(0, 10),
                                                    onChanged: (value) {
                                                      _endDateController.text =
                                                          value;
                                                    },
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    labelText: "End date *",
                                                    suffixIcon: Icon(
                                                      Icons.calendar_today,
                                                      color: Colors.grey,
                                                      size: 20,
                                                    ),
                                                    onTap: () async {
                                                      await NDialog(
                                                        content: Container(
                                                          width: SizeConfig
                                                                  .screenWidth *
                                                              0.8,
                                                          height: SizeConfig
                                                                  .screenHeight *
                                                              0.5,
                                                          padding: EdgeInsets.only(
                                                              top:
                                                                  kDefaultPadding),
                                                          child:
                                                              SfDateRangePicker(
                                                            onSelectionChanged:
                                                                data.getEndDate,
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                                _endDateController
                                                                        .text =
                                                                    data.endDate!;
                                                              },
                                                              child: Text(
                                                                "OK",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue),
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
                                                                          .black)))
                                                        ],
                                                      ).show(context);
                                                    },
                                                    readOnly: true,
                                                    obscureText: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: kDefaultPadding / 2,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: DefaultTextInput(
                                                      initialValue: (data
                                                                  .modelDataEdit!
                                                                  .data!
                                                                  .result!
                                                                  .diskonJamMulai!
                                                                  .substring(
                                                                      0, 5) ==
                                                              "00:00")
                                                          ? ""
                                                          : data
                                                              .modelDataEdit!
                                                              .data!
                                                              .result!
                                                              .diskonJamMulai!
                                                              .substring(0, 5),
                                                      onChanged: (value) {
                                                        _startTimeController
                                                            .text = value;
                                                      },
                                                      labelText: "Start time",
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .always,
                                                      hintText: "e.g 08:00",
                                                      suffixIcon: Icon(
                                                        Icons.access_time,
                                                        color: Colors.grey,
                                                        size: 20,
                                                      ),
                                                      readOnly: false,
                                                      obscureText: false),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: DefaultTextInput(
                                                      initialValue: (data
                                                                  .modelDataEdit!
                                                                  .data!
                                                                  .result!
                                                                  .diskonJamExp!
                                                                  .substring(
                                                                      0, 5) ==
                                                              "00:00")
                                                          ? ""
                                                          : data
                                                              .modelDataEdit!
                                                              .data!
                                                              .result!
                                                              .diskonJamExp!
                                                              .substring(0, 5),
                                                      onChanged: (value) {
                                                        _endTimeController
                                                            .text = value;
                                                      },
                                                      labelText: "End time",
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .always,
                                                      hintText: "e.g 16:00",
                                                      suffixIcon: Icon(
                                                        Icons.access_time,
                                                        color: Colors.grey,
                                                        size: 20,
                                                      ),
                                                      readOnly: false,
                                                      obscureText: false),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: kDefaultPadding / 2,
                                          ),
                                          DefaultTextInput(
                                            labelText: "Percent (%)",
                                            initialValue: data.modelDataEdit!
                                                .data!.result!.diskonPresentase
                                                .toString(),
                                            onChanged: (value) {
                                              _percentController.text = value;
                                            },
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            hintText: "e.g 50 (without %)",
                                            readOnly: false,
                                            obscureText: false,
                                            keyboardType: TextInputType.number,
                                          ),
                                          SizedBox(
                                            height: kDefaultPadding,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                width: SizeConfig.screenWidth *
                                                    0.42,
                                                child: DefaultButton(
                                                    backgroundColor: Colors.red,
                                                    buttonText: "Delete",
                                                    onPressed: () {
                                                      data.postDeleteDiscount(
                                                          context: context,
                                                          discountId: widget
                                                              .discountId);
                                                    }),
                                              ),
                                              Container(
                                                width: SizeConfig.screenWidth *
                                                    0.42,
                                                child: DefaultButton(
                                                    backgroundColor:
                                                        kButtonColor,
                                                    buttonText: "Save",
                                                    onPressed: () {
                                                      minPurchase =
                                                          _minPurchaseController
                                                              .text
                                                              .replaceAll(
                                                                  ".", "");

                                                      // print((data
                                                      //             .groupId ==
                                                      //         null)
                                                      //     ? data
                                                      //         .modelDataEdit!
                                                      //         .data!
                                                      //         .result!
                                                      //         .groupId!
                                                      //     : data.groupId!);
                                                      // print((_discountNameController
                                                      //             .text ==
                                                      //         "")
                                                      //     ? data
                                                      //         .modelDataEdit!
                                                      //         .data!
                                                      //         .result!
                                                      //         .diskonNama!
                                                      //     : _discountNameController
                                                      //         .text);
                                                      // print((_descController
                                                      //             .text ==
                                                      //         "")
                                                      //     ? data
                                                      //         .modelDataEdit!
                                                      //         .data!
                                                      //         .result!
                                                      //         .diskonDesc!
                                                      //     : _descController
                                                      //         .text);
                                                      // print((data.salesGroupId ==
                                                      //         null)
                                                      //     ? (data
                                                      //                 .modelDataEdit!
                                                      //                 .data!
                                                      //                 .result!
                                                      //                 .salesGroupId ==
                                                      //             null)
                                                      //         ? ""
                                                      //         : data
                                                      //             .modelDataEdit!
                                                      //             .data!
                                                      //             .result!
                                                      //             .salesGroupId
                                                      //             .toString()
                                                      //     : data.salesGroupId!);
                                                      // print((data.produkId ==
                                                      //         null)
                                                      //     ? (data
                                                      //                 .modelDataEdit!
                                                      //                 .data!
                                                      //                 .result!
                                                      //                 .produkId ==
                                                      //             null)
                                                      //         ? ""
                                                      //         : data
                                                      //             .modelDataEdit!
                                                      //             .data!
                                                      //             .result!
                                                      //             .produkId
                                                      //     : data.produkId!);
                                                      // print((minPurchase == "")
                                                      //     ? data
                                                      //         .modelDataEdit!
                                                      //         .data!
                                                      //         .result!
                                                      //         .diskonSyaratJmlPembelian
                                                      //         .toString()
                                                      //     : minPurchase);
                                                      // print((_startDateController
                                                      //             .text ==
                                                      //         "")
                                                      //     ? data
                                                      //         .modelDataEdit!
                                                      //         .data!
                                                      //         .result!
                                                      //         .diskonTglMulai!
                                                      //         .substring(0, 10)
                                                      //     : _startDateController
                                                      //         .text);
                                                      // print((_endDateController
                                                      //             .text ==
                                                      //         "")
                                                      //     ? data
                                                      //         .modelDataEdit!
                                                      //         .data!
                                                      //         .result!
                                                      //         .diskonTglExp!
                                                      //         .substring(0, 10)
                                                      //     : _endDateController
                                                      //         .text);
                                                      // print((_startTimeController
                                                      //             .text ==
                                                      //         "")
                                                      //     ? data
                                                      //         .modelDataEdit!
                                                      //         .data!
                                                      //         .result!
                                                      //         .diskonJamMulai!
                                                      //     : _startTimeController
                                                      //         .text);
                                                      // print((_endTimeController
                                                      //             .text ==
                                                      //         "")
                                                      //     ? data
                                                      //         .modelDataEdit!
                                                      //         .data!
                                                      //         .result!
                                                      //         .diskonJamExp!
                                                      //     : _endTimeController
                                                      //         .text);
                                                      // print((_percentController
                                                      //             .text ==
                                                      //         "")
                                                      //     ? data
                                                      //         .modelDataEdit!
                                                      //         .data!
                                                      //         .result!
                                                      //         .diskonPresentase
                                                      //         .toString()
                                                      //     : _percentController
                                                      //         .text);
                                                      // print(data
                                                      //     .modelDataEdit!
                                                      //     .data!
                                                      //     .result!
                                                      //     .diskonFile!);
                                                      // print((data.imgDiscount ==
                                                      //         null)
                                                      //     ? ""
                                                      //     : data.imgDiscount!);
                                                      // print(widget.discountId);

                                                      data.postEditDiscount(
                                                          context,
                                                          (data.groupId == null)
                                                              ? data
                                                                  .modelDataEdit!
                                                                  .data!
                                                                  .result!
                                                                  .groupId!
                                                              : data.groupId!,
                                                          (_discountNameController.text == "")
                                                              ? data
                                                                  .modelDataEdit!
                                                                  .data!
                                                                  .result!
                                                                  .diskonNama!
                                                              : _discountNameController
                                                                  .text,
                                                          (_descController.text == "")
                                                              ? data
                                                                  .modelDataEdit!
                                                                  .data!
                                                                  .result!
                                                                  .diskonDesc!
                                                              : _descController
                                                                  .text,
                                                          (data.salesGroupId ==
                                                                  null)
                                                              ? (data.modelDataEdit!.data!.result!.salesGroupId ==
                                                                      null)
                                                                  ? ""
                                                                  : data
                                                                      .modelDataEdit!
                                                                      .data!
                                                                      .result!
                                                                      .salesGroupId
                                                                      .toString()
                                                              : data
                                                                  .salesGroupId!,
                                                          (data.produkId ==
                                                                  null)
                                                              ? (data.modelDataEdit!.data!.result!.produkId ==
                                                                      null)
                                                                  ? ""
                                                                  : data
                                                                      .modelDataEdit!
                                                                      .data!
                                                                      .result!
                                                                      .produkId
                                                              : data.produkId!,
                                                          (minPurchase == "")
                                                              ? data
                                                                  .modelDataEdit!
                                                                  .data!
                                                                  .result!
                                                                  .diskonSyaratJmlPembelian
                                                                  .toString()
                                                              : minPurchase,
                                                          (_startDateController.text == "") ? data.modelDataEdit!.data!.result!.diskonTglMulai!.substring(0, 10) : _startDateController.text,
                                                          (_endDateController.text == "") ? data.modelDataEdit!.data!.result!.diskonTglExp!.substring(0, 10) : _endDateController.text,
                                                          (_startTimeController.text == "") ? data.modelDataEdit!.data!.result!.diskonJamMulai! : _startTimeController.text,
                                                          (_endTimeController.text == "") ? data.modelDataEdit!.data!.result!.diskonJamExp! : _endTimeController.text,
                                                          (_percentController.text == "") ? data.modelDataEdit!.data!.result!.diskonPresentase.toString() : _percentController.text,
                                                          data.modelDataEdit!.data!.result!.diskonFile!,
                                                          (data.imgDiscount == null) ? "" : data.imgDiscount!,
                                                          widget.discountId);
                                                    }),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
      ),
    );
  }
}
