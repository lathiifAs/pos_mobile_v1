import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_discount.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/utils/currency_formatters.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddDiscountScreen extends StatefulWidget {
  const AddDiscountScreen({Key? key}) : super(key: key);

  @override
  _AddDiscountScreenState createState() => _AddDiscountScreenState();
}

class _AddDiscountScreenState extends State<AddDiscountScreen> {
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
    Provider.of<ProviderDiscount>(context, listen: false)
        .getAddDiscount(context);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderDiscount>(context, listen: false);
      data.groupId = null;
    });
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   var data = Provider.of<ProviderDiscount>(context, listen: false);
    //   data.getDataGroup(context, "3");
    // });
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
        title: Text("Create Discount"),
      ),
      body: Consumer<ProviderDiscount>(
        builder: (context, data, _) => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    data.getImageDiscount();
                  },
                  child: (data.fileImgDiscount == null)
                      ? Container(
                          width: SizeConfig.screenWidth * 0.7,
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
                          width: SizeConfig.screenWidth * 0.7,
                          height: SizeConfig.screenHeight * 0.23,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4),
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
                  label: "Discount Name *",
                  controller: _discountNameController,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "Description",
                  controller: _descController,
                  maxLines: 3,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                // Consumer<ProviderDiscount>(
                //   builder: (context, data, _) => (data.modelDataAdd == null)
                //       ? Center(
                //           child: CircularProgressIndicator(),
                //         )
                //       : (data.modelDataAdd!.data == null)
                //           ? Container()
                //           : (data.modelDataAdd!.data!.arrayGroup!.length == 0)
                //               ? FindDropdown<String?>(
                //                   label: "Group *",
                //                   selectedItem: "Choose",
                //                   labelStyle: TextStyle(fontSize: 12),
                //                   onChanged: (value) {
                //                     var groupNama = data
                //                         .modelDataAdd!.data!.arrayGroup!
                //                         .where((element) =>
                //                             element.groupNama == value);
                //                     groupNama.forEach((element) {
                //                       data.groupId = element.groupId;
                //                     });
                //                     data.getDataGroup(context, data.groupId!);
                //                   },
                //                   items: data.modelDataAdd!.data!.arrayGroup!
                //                       .map((e) => e.groupNama)
                //                       .toList(),
                //                 )
                //               : FindDropdown<String?>(
                //                   label: "Group *",
                //                   selectedItem: "Choose",
                //                   labelStyle: TextStyle(fontSize: 12),
                //                   onChanged: (value) {
                //                     var groupNama = data
                //                         .modelDataAdd!.data!.arrayGroup!
                //                         .where((element) =>
                //                             element.groupNama == value);
                //                     groupNama.forEach((element) {
                //                       data.groupId = element.groupId;
                //                     });
                //                     data.getDataGroup(context, data.groupId!);
                //                   },
                //                   items: data.modelDataAdd!.data!.arrayGroup!
                //                       .map((e) => e.groupNama)
                //                       .toList(),
                //                 ),
                // ),
                // SizedBox(
                //   height: kDefaultPadding / 2,
                // ),
                // (data.groupId == null)
                //     ? Container()
                //     : Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           FindDropdown<String?>(
                //             label: "Sales Group",
                //             selectedItem: "Choose",
                //             labelStyle: TextStyle(fontSize: 12),
                //             onChanged: (value) {
                //               var namaSalesGroup = data
                //                   .modelDataGroup!.data!.arraySalesGroup!
                //                   .where((element) =>
                //                       element.salesGroupNama == value);
                //               namaSalesGroup.forEach((element) {
                //                 data.salesGroupId =
                //                     element.salesGroupId.toString();
                //               });
                //             },
                //             items: data.modelDataGroup!.data!.arraySalesGroup!
                //                 .map((e) => e.salesGroupNama)
                //                 .toList(),
                //           ),
                //           SizedBox(
                //             height: kDefaultPadding / 2,
                //           ),
                //           FindDropdown<String?>(
                //             label: "Produk",
                //             selectedItem: "Choose",
                //             labelStyle: TextStyle(fontSize: 12),
                //             onChanged: (value) {
                //               var produkName =
                //                   data.modelDataGroup!.data!.arrayProduk!.where(
                //                       (element) => element.produkNama == value);
                //               produkName.forEach((element) {
                //                 data.produkId = element.produkId.toString();
                //               });
                //             },
                //             items: data.modelDataGroup!.data!.arrayProduk!
                //                 .map((e) => e.produkNama)
                //                 .toList(),
                //           ),
                //           SizedBox(
                //             height: kDefaultPadding / 2,
                //           ),
                //         ],
                //       ),
                GeneralTextField(
                  label: "Min. Purchase *",
                  controller: _minPurchaseController,
                  inputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CurrencyFormatters(maxDigits: 12)
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
                          controller: _startDateController,
                          onChanged: (value) {
                            _startDateController.text = value;
                          },
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Start date *",
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
                                  onSelectionChanged: data.getStartDate,
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _startDateController.text =
                                          data.startDate!;
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
                          controller: _endDateController,
                          onChanged: (value) {
                            _endDateController.text = value;
                          },
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "End date *",
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
                                  onSelectionChanged: data.getEndDate,
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _endDateController.text = data.endDate!;
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
                            controller: _startTimeController,
                            labelText: "Start time",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
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
                            controller: _endTimeController,
                            labelText: "End time",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
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
                GeneralTextField(
                  label: "Percent (%)",
                  controller: _percentController,
                  inputType: TextInputType.number,
                  hintText: "e.g 50 (without %)",
                ),
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
                        minPurchase =
                            _minPurchaseController.text.replaceAll(".", "");
                        data.postAddDiscount(
                            context,
                            (data.groupId == null) ? "" : data.groupId!,
                            _discountNameController.text,
                            _descController.text,
                            (data.salesGroupId == null)
                                ? ""
                                : data.salesGroupId!,
                            (data.produkId == null) ? "" : data.produkId!,
                            minPurchase,
                            _startDateController.text,
                            _endDateController.text,
                            _startTimeController.text,
                            _endTimeController.text,
                            _percentController.text,
                            (data.imgDiscount == null)
                                ? ""
                                : data.imgDiscount!);
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
