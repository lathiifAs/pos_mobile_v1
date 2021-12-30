import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_printer.dart';
import 'package:pointofsales/providers/admin/transaction/p_pos.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/currency_formatters.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/bottom_dialog_device_printer.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/default_separator.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';

class CheckoutCafe extends StatefulWidget {
  const CheckoutCafe({Key? key, required this.transaksiId}) : super(key: key);

  final String transaksiId;

  @override
  _CheckoutCafeState createState() => _CheckoutCafeState();
}

class _CheckoutCafeState extends State<CheckoutCafe> {
  String? nama;
  String _paymentId = "";
  String _cash = "";
  int change = 0;
  int discPercent = 0;

  voidNama() async {
    nama = await getNama();
  }

  @override
  void initState() {
    // TODO: implement initState
    voidNama();
    Provider.of<ProviderPos>(context, listen: false)
        .getListIndex(context: context);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderPos>(context, listen: false);
      data.paymentName = null;
      data.discount = 0;
      data.totalDiscount = 0;
      data.dateCheckout = DateTime.now();
      data.getDetailOrder(context: context, transaksiId: widget.transaksiId);
    });
    discPercent = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Consumer<ProviderPos>(
        builder: (context, data, _) => ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                      width: SizeConfig.screenWidth * 0.3,
                      child: Text("Cashier Name")),
                  Text(" : "),
                  Text(nama ?? "")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                      width: SizeConfig.screenWidth * 0.3,
                      child: Text("Date & Time")),
                  Text(" : "),
                  (data.dateCheckout == null)
                      ? Container()
                      : Text(
                          "${DateFormat('dd MMMM yyyy H:mm:ss', 'id-ID').format(data.dateCheckout!)}")
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Customer Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            (data.modelDetailOrder == null)
                ? Container()
                : (data.modelDetailOrder!.data == null)
                    ? Container()
                    : (data.modelDetailOrder!.data!.dataPemesan!.length == 0)
                        ? Container()
                        : Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: SizeConfig.screenWidth * 0.3,
                                      child: Text(
                                        "Customer Name",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                    Text(" : "),
                                    Text(
                                      (data
                                                  .modelDetailOrder!
                                                  .data!
                                                  .dataPemesan![0]
                                                  .namaPemesan ==
                                              "")
                                          ? "-"
                                          : data.modelDetailOrder!.data!
                                              .dataPemesan![0].namaPemesan!,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: SizeConfig.screenWidth * 0.3,
                                      child: Text(
                                        "Table",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                    Text(" : "),
                                    Text(
                                      data.modelDetailOrder!.data!
                                              .dataPemesan![0].mejaNomor ??
                                          "-",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: SizeConfig.screenWidth * 0.3,
                                      child: Text(
                                        "Type Services",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                    Text(" : "),
                                    Text(
                                      (data.modelDetailOrder!.data!
                                                  .dataPemesan![0].jenisOrder ==
                                              "makan_ditempat")
                                          ? "Dine In"
                                          : (data
                                                      .modelDetailOrder!
                                                      .data!
                                                      .dataPemesan![0]
                                                      .jenisOrder ==
                                                  "take_away")
                                              ? "Take Away"
                                              : "Delivery",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Items",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            (data.modelDetailOrder == null)
                ? Center(child: CircularProgressIndicator())
                : (data.modelDetailOrder!.data == null)
                    ? Container()
                    : (data.modelDetailOrder!.data!.listItem!.length == 0)
                        ? Center(
                            child: Text("list items is empty"),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount:
                                data.modelDetailOrder!.data!.listItem!.length,
                            itemBuilder: (c, i) => Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.modelDetailOrder!.data!
                                                  .listItem![i].produkNama ??
                                              "-",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.event_note,
                                              size: 15,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                (data
                                                            .modelDetailOrder!
                                                            .data!
                                                            .listItem![i]
                                                            .catatan! ==
                                                        "")
                                                    ? "-"
                                                    : "${data.modelDetailOrder!.data!.listItem![i].catatan}",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Text(
                                          "( ${data.modelDetailOrder!.data!.listItem![i].jmlBeli} )",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Text(
                                          "  x  ",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Text(
                                          NumberFormat.currency(
                                                  locale: 'id',
                                                  decimalDigits: 0,
                                                  symbol: '')
                                              .format(data
                                                      .modelDetailOrder!
                                                      .data!
                                                      .listItem![i]
                                                      .harga ??
                                                  0),
                                          style: TextStyle(fontSize: 13),
                                        )
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      data.getSubtotal(i);
                                    },
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'id',
                                              decimalDigits: 0,
                                              symbol: '')
                                          .format(data
                                                  .modelDetailOrder!
                                                  .data!
                                                  .listItem![i]
                                                  .subTotalProduk ??
                                              0),
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
            SizedBox(
              height: 10,
            ),
            // Container(
            //     margin: EdgeInsets.symmetric(horizontal: 10),
            //     child: MySeparator()),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: TextStyle(fontSize: 12),
                      ),
                      (data.modelDetailOrder == null)
                          ? CircularProgressIndicator()
                          : (data.modelDetailOrder!.data == null)
                              ? Container()
                              : (data.modelDetailOrder!.data!.dataPemesan!
                                          .length ==
                                      0)
                                  ? Text("data API is null")
                                  : Text(
                                      NumberFormat.currency(
                                              locale: 'id',
                                              decimalDigits: 0,
                                              symbol: '')
                                          .format(data.modelDetailOrder!.data!
                                                  .dataPemesan![0].total ??
                                              0),
                                      style: TextStyle(fontSize: 12),
                                    ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: TextStyle(fontSize: 12),
                      ),
                      InkWell(
                        onTap: () async {
                          await NDialog(
                            dialogStyle: DialogStyle(titleDivider: true),
                            title: Text("Input Discount"),
                            content: SingleChildScrollView(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GeneralTextField(
                                      label: "Discount Percent (%)",
                                      onChanged: (value) {
                                        data.discount =
                                            double.parse(value ?? 0);
                                        data.isPercent = true;
                                        discPercent = int.parse(value);
                                      },
                                      hintText: "inputkan tanpa %",
                                      inputType: TextInputType.number,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Center(
                                      child: Text("or"),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    GeneralTextField(
                                      label: "Discount Value (Rupiah)",
                                      onChanged: (value) {
                                        value = value.replaceAll(".", "");
                                        data.discount =
                                            double.tryParse(value ?? 0)!;

                                        data.isPercent = false;
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        CurrencyFormatters(maxDigits: 12)
                                      ],
                                      hintText: "nilai diskon",
                                      inputType: TextInputType.number,
                                    ),
                                    SizedBox(
                                      height: kDefaultPadding / 2,
                                    ),
                                    Text(
                                      "* inputkan salah satu saja",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  child: DefaultButton(
                                      backgroundColor: kButtonColor,
                                      buttonText: "Save",
                                      onPressed: () {
                                        data.saveDiscountCafe(data
                                            .modelDetailOrder!
                                            .data!
                                            .dataPemesan![0]
                                            .total!);
                                        Navigator.pop(context);
                                      }))
                            ],
                          ).show(context);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                              child: Text(
                            data.isPercent
                                ? "${data.discount.toInt()} % (- ${formatCurrency.format(data.totalDiscount)})"
                                : "- ${formatCurrency.format(data.totalDiscount)}",
                            style: TextStyle(fontSize: 12),
                          )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MySeparator(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total After Discount",
                        style: TextStyle(fontSize: 12),
                      ),
                      (data.modelDetailOrder == null)
                          ? CircularProgressIndicator()
                          : (data.modelDetailOrder!.data == null)
                              ? Container()
                              : (data.modelDetailOrder!.data!.dataPemesan!
                                          .length ==
                                      0)
                                  ? Text(
                                      "data API is null",
                                      style: TextStyle(fontSize: 12),
                                    )
                                  : Text(
                                      formatCurrency.format(data
                                              .modelDetailOrder!
                                              .data!
                                              .dataPemesan![0]
                                              .total! -
                                          data.totalDiscount.toInt()),
                                      style: TextStyle(fontSize: 12),
                                    ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      (data.modelIndex == null)
                          ? Container()
                          : (data.modelIndex!.data == null)
                              ? Container()
                              : (data.modelIndex!.data!.arrayJenisPayment!
                                          .length ==
                                      0)
                                  ? Container()
                                  : (data.modelIndex!.data!.arrayPrefrences![0]
                                                  .prefValue ==
                                              "" ||
                                          data
                                                  .modelIndex!
                                                  .data!
                                                  .arrayPrefrences![0]
                                                  .prefValue ==
                                              "0")
                                      ? Container()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "PPN (${data.modelIndex!.data!.arrayPrefrences![0].prefValue!}%)",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              formatCurrency.format(
                                                  data.totalPPN.toInt()),
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      (data.modelIndex == null)
                          ? Container()
                          : (data.modelIndex!.data == null)
                              ? Container()
                              : (data.modelIndex!.data!.arrayPrefrences!
                                          .length ==
                                      0)
                                  ? Container()
                                  : (data.modelIndex!.data!.arrayPrefrences![1]
                                                  .prefValue ==
                                              "" ||
                                          data
                                                  .modelIndex!
                                                  .data!
                                                  .arrayPrefrences![1]
                                                  .prefValue ==
                                              "0")
                                      ? Container()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Services (${data.modelIndex!.data!.arrayPrefrences![1].prefValue!}%)",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              formatCurrency.format(
                                                  data.totalServices.toInt()),
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MySeparator(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      (data.modelDetailOrder == null)
                          ? Container()
                          : (data.modelDetailOrder!.data == null)
                              ? Container()
                              : (data.modelDetailOrder!.data!.dataPemesan!
                                          .length ==
                                      0)
                                  ? Container()
                                  : Text(
                                      NumberFormat.currency(
                                              locale: 'id',
                                              decimalDigits: 0,
                                              symbol: 'Rp ')
                                          .format(data.modelDetailOrder!.data!
                                                  .dataPemesan![0].total! -
                                              data.totalDiscount.toInt() +
                                              data.totalPPN.toInt() +
                                              data.totalServices.toInt()),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 1),
                    child: Image.asset(
                      "assets/images/payment-method.png",
                      width: 62,
                      height: 62,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: (data.modelIndex == null)
                        ? Container()
                        : (data.modelIndex!.data == null)
                            ? Container()
                            : (data.modelIndex!.data!.arrayJenisPayment!
                                        .length ==
                                    0)
                                ? DefaultDropdown(
                                    label: "Payment Method *",
                                    selectedItem: "Data is empty!",
                                    onChanged: (value) {},
                                    items: data
                                        .modelIndex!.data!.arrayJenisPayment!
                                        .map((e) => e.jenisPembayaranNama)
                                        .toList())
                                : DefaultDropdown(
                                    label: "Payment Method *",
                                    selectedItem: 'Cash',
                                    onChanged: (value) {
                                      var nama = data
                                          .modelIndex!.data!.arrayJenisPayment!
                                          .where((element) =>
                                              element.jenisPembayaranNama ==
                                              value);
                                      nama.forEach((element) {
                                        _paymentId = element.jenisPembayaranId
                                            .toString();
                                        data.paymentName =
                                            element.jenisPembayaranNama;
                                      });
                                    },
                                    items: data
                                        .modelIndex!.data!.arrayJenisPayment!
                                        .map((e) => e.jenisPembayaranNama)
                                        .toList()),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: GeneralTextField(
                            label: "Cash",
                            controller: data.controllerCash,
                            inputType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CurrencyFormatters(maxDigits: 12)
                            ],
                            onChanged: (val) {
                              setState(() {
                                _cash = data.controllerCash.text.isEmpty
                                    ? "0"
                                    : data.controllerCash.text
                                        .replaceAll(".", "");
                                if (data.controllerCash.text.isNotEmpty) {
                                  change = int.parse(_cash) -
                                      (data.modelDetailOrder!.data!
                                              .dataPemesan![0].total! -
                                          data.totalDiscount.toInt() +
                                          data.totalPPN.toInt() +
                                          data.totalServices.toInt());
                                  data.controllerChange.text =
                                      change.toString();
                                } else {
                                  data.controllerChange.text = "0";
                                }
                              });
                              // }
                            },
                            onSubmitted: (val) {
                              data.controllerCash.text = val;
                              _cash = data.controllerCash.text.isEmpty
                                  ? "0"
                                  : data.controllerCash.text
                                      .replaceAll(".", "");
                              if (data.controllerCash.text.isNotEmpty) {
                                change = int.parse(_cash) -
                                    (data.modelDetailOrder!.data!
                                            .dataPemesan![0].total! -
                                        data.totalDiscount.toInt() +
                                        data.totalPPN.toInt() +
                                        data.totalServices.toInt());
                                data.controllerChange.text = change.toString();
                              } else {
                                data.controllerChange.text = "0";
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Change",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 60,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: Colors.grey.shade300)),
                                child: Center(
                                    child: Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          decimalDigits: 0,
                                          symbol: '')
                                      .format(change),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 50,
              child: DefaultButton(
                  backgroundColor: kButtonColor,
                  buttonText: "Submit",
                  onPressed: () {
                    // print(_paymentId);
                    // print((data.paymentName == null) ? 'Cash' : 'Other');
                    Provider.of<ProviderPrinter>(context, listen: false)
                        .onInit();
                    Provider.of<ProviderPrinter>(context, listen: false)
                        .initPrinter();
                    (data.controllerCash.text == "" && data.paymentName == null)
                        ? showSnackBar(
                            snackBarType: SnackBarType.WARNING,
                            title: "Warning",
                            message: "Cash can't be empty!")
                        : Provider.of<ProviderPrinter>(context, listen: false)
                            .checkConnectedPrinter()
                            .then((value) {
                            if (!value) {
                              showBottomSheetDevicePrinter();
                            } else {
                              Provider.of<ProviderPrinter>(context, listen: false).printInvoice(context,
                                  cash: int.parse(data.controllerCash.text
                                      .replaceAll(".", "")),
                                  change: int.parse(data.controllerChange.text
                                      .replaceAll(".", "")),
                                  subTotal: data.modelDetailOrder!.data!
                                      .dataPemesan![0].total!,
                                  bill: data.modelDetailOrder!.data!
                                          .dataPemesan![0].total! -
                                      data.totalDiscount.toInt() +
                                      data.totalPPN.toInt() +
                                      data.totalServices.toInt(),
                                  customerName:
                                      (data.modelDetailOrder!.data!.dataPemesan![0].namaPemesan == "")
                                          ? "-"
                                          : data.modelDetailOrder!.data!
                                              .dataPemesan![0].namaPemesan!,
                                  table: data.modelDetailOrder!.data!.dataPemesan![0].mejaNomor ?? "-",
                                  listProduct: data.listDataCart,
                                  dateCheckout: data.dateCheckout!,
                                  paymentMethod: data.paymentName,
                                  discount: data.totalDiscount.toInt(),
                                  totalAfterDiscount: data.modelDetailOrder!.data!.dataPemesan![0].total! - data.totalDiscount.toInt(),
                                  percentDiscount: discPercent,
                                  ppnCash: data.totalPPN.toInt(),
                                  ppnPercent: int.parse(data.modelIndex!.data!.arrayPrefrences![0].prefValue!),
                                  serviceCash: data.totalServices.toInt(),
                                  maxDiscountPercent: 0,
                                  servicePercent: int.parse(data.modelIndex!.data!.arrayPrefrences![1].prefValue!));
                              data.postSubmitCashierCafe(
                                  context: context,
                                  paymentId: _paymentId,
                                  totalHarga:
                                      "${data.modelDetailOrder!.data!.dataPemesan![0].total! - data.totalDiscount.toInt() + data.totalPPN.toInt() + data.totalServices.toInt()}",
                                  ppnValue: "${data.totalPPN.toInt()}",
                                  discountValue:
                                      "${data.totalDiscount.toInt()}",
                                  servicesValue:
                                      "${data.totalServices.toInt()}",
                                  transaksiId: widget.transaksiId);
                              data.controllerCash.text = "0";
                              data.controllerChange.text = "0";
                              data.paymentName = "";
                              data.discount = 0;
                              data.totalDiscount = 0;
                            }
                          });
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future showBottomSheetDevicePrinter() {
    return Get.bottomSheet(BottomDialogDevicePrinter(),
        isScrollControlled: true, elevation: 3);
  }
}
