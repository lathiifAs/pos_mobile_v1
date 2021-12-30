import 'dart:convert';

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
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/default_separator.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutRetail extends StatefulWidget {
  const CheckoutRetail({Key? key}) : super(key: key);

  @override
  _CheckoutRetailState createState() => _CheckoutRetailState();
}

class _CheckoutRetailState extends State<CheckoutRetail> {
  // TextEditingController _controllerDiscPercent = TextEditingController();
  // TextEditingController _controllerDiscValue = TextEditingController();
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
                  Text(
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
                "Items *",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            for (var produk in data.listDataCart)
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Expanded(
                    //   flex: 2,
                    //   child: Text(
                    //     "${produk['produk_nama']}",
                    //     style: TextStyle(fontSize: 15),
                    //   ),
                    // ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${produk['produk_nama']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                child: InkWell(
                                  onTap: () async {
                                    TextEditingController _controllerNotes =
                                        TextEditingController();
                                    _controllerNotes.text = produk['catatan'];
                                    await NDialog(
                                      content: Container(
                                          width: SizeConfig.screenWidth * 0.8,
                                          padding: EdgeInsets.only(
                                              top: kDefaultPadding),
                                          child: GeneralTextField(
                                            label: "Notes",
                                            controller: _controllerNotes,
                                          )),
                                      actions: <Widget>[
                                        TextButton(
                                            onPressed: () {
                                              Provider.of<ProviderPos>(context,
                                                      listen: false)
                                                  .addCart(
                                                      produkId:
                                                          produk['produk_id'],
                                                      productName:
                                                          produk['produk_nama'],
                                                      quantity: produk['qty'],
                                                      catatan:
                                                          _controllerNotes.text,
                                                      productPrice:
                                                          produk['total_harga'],
                                                      onDialog: true);
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "OK",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Cancel",
                                                style: TextStyle(
                                                    color: Colors.black)))
                                      ],
                                    ).show(context);
                                  },
                                  child: Text(
                                    (produk['catatan'] == "")
                                        ? "Notes..."
                                        : "${produk['catatan']}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: (produk['catatan'] == "")
                                            ? Colors.grey.shade500
                                            : Colors.black),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: kPrimaryColor),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Provider.of<ProviderPos>(context,
                                            listen: false)
                                        .addCart(
                                            produkId: produk['produk_id'],
                                            productName: produk['produk_nama'],
                                            quantity: 1,
                                            catatan: produk['catatan'],
                                            productPrice: produk['total_harga'],
                                            minus: true);
                                    data.qtyItems =
                                        data.listDataCart.length.toString();
                                  },
                                  child: Center(
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: kPrimaryColor),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  TextEditingController _controllerQty =
                                      TextEditingController();
                                  _controllerQty.text =
                                      produk['qty'].toString();
                                  await NDialog(
                                    content: Container(
                                      width: SizeConfig.screenWidth * 0.4,
                                      padding:
                                          EdgeInsets.only(top: kDefaultPadding),
                                      child: GeneralTextField(
                                        label: "Quantity",
                                        controller: _controllerQty,
                                        inputType: TextInputType.number,
                                        onSubmitted: (value) {
                                          Provider.of<ProviderPos>(context,
                                                  listen: false)
                                              .addCart(
                                                  produkId: produk['produk_id'],
                                                  productName:
                                                      produk['produk_nama'],
                                                  quantity: int.parse(
                                                      _controllerQty.text),
                                                  catatan: produk['catatan'],
                                                  productPrice:
                                                      produk['total_harga'],
                                                  onDialog: true);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Provider.of<ProviderPos>(context,
                                                    listen: false)
                                                .addCart(
                                                    produkId:
                                                        produk['produk_id'],
                                                    productName:
                                                        produk['produk_nama'],
                                                    quantity: int.parse(
                                                        _controllerQty.text),
                                                    catatan: produk['catatan'],
                                                    productPrice:
                                                        produk['total_harga'],
                                                    onDialog: true);
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "OK",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel",
                                              style: TextStyle(
                                                  color: Colors.black)))
                                    ],
                                  ).show(context);
                                },
                                child: Container(
                                  width: 30,
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${produk['qty']}",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: kPrimaryColor),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Provider.of<ProviderPos>(context,
                                            listen: false)
                                        .addCart(
                                            produkId: produk['produk_id'],
                                            productName: produk['produk_nama'],
                                            quantity: 1,
                                            catatan: produk['catatan'],
                                            productPrice:
                                                produk['total_harga']);
                                  },
                                  child: Center(
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: kPrimaryColor),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                              child: Text(
                            NumberFormat.currency(
                                    locale: 'id', decimalDigits: 0, symbol: '')
                                .format(produk['total_harga']),
                            style: TextStyle(fontSize: 13),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            SizedBox(
              height: 10,
            ),
            MySeparator(),
            SizedBox(
              height: 10,
            ),
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
                      Text(
                        NumberFormat.currency(
                                locale: 'id', decimalDigits: 0, symbol: '')
                            .format(data.totalHargaProduk),
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
                                        data.saveDiscountRetail();
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
                      Text(
                        formatCurrency.format(data.totalHargaProduk! -
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
                      (data.modelIndex!.data!.arrayPrefrences![0].prefValue ==
                                  "" ||
                              data.modelIndex!.data!.arrayPrefrences![0]
                                      .prefValue ==
                                  "0")
                          ? Container()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "PPN (${data.modelIndex!.data!.arrayPrefrences![0].prefValue!}%)",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  formatCurrency.format(data.totalPPN.toInt()),
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
                      (data.modelIndex!.data!.arrayPrefrences![1].prefValue ==
                                  "" ||
                              data.modelIndex!.data!.arrayPrefrences![1]
                                      .prefValue ==
                                  "0")
                          ? Container()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Services (${data.modelIndex!.data!.arrayPrefrences![1].prefValue!}%)",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  formatCurrency
                                      .format(data.totalServices.toInt()),
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
                      Text(
                        NumberFormat.currency(
                                locale: 'id', decimalDigits: 0, symbol: 'Rp ')
                            .format(data.totalHargaProduk! -
                                data.totalDiscount.toInt() +
                                data.totalPPN.toInt() +
                                data.totalServices.toInt()),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MySeparator(),
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
                              // if(val.isNotEmpty){
                              //   data.controllerCash.text = val;
                              setState(() {
                                _cash = data.controllerCash.text.isEmpty
                                    ? "0"
                                    : data.controllerCash.text
                                        .replaceAll(".", "");
                                if (data.controllerCash.text.isNotEmpty) {
                                  change = int.parse(_cash) -
                                      (data.totalHargaProduk! -
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
                                    (data.totalHargaProduk! -
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
                    print(data.paymentName);
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
                            print(value);
                            if (!value) {
                              showBottomSheetDevicePrinter();
                            } else {
                              Provider.of<ProviderPrinter>(context, listen: false)
                                  .printInvoice(context,
                                      cash: int.parse(data.controllerCash.text
                                          .replaceAll(".", "")),
                                      change: int.parse(data
                                          .controllerChange.text
                                          .replaceAll(".", "")),
                                      subTotal: data.totalHargaProduk!,
                                      bill: data.totalHargaProduk! -
                                          data.totalDiscount.toInt() +
                                          data.totalPPN.toInt() +
                                          data.totalServices.toInt(),
                                      listProduct: data.listDataCart,
                                      dateCheckout: data.dateCheckout!,
                                      paymentMethod: data.paymentName,
                                      discount: data.totalDiscount.toInt(),
                                      totalAfterDiscount: data.totalHargaProduk! -
                                          data.totalDiscount.toInt(),
                                      percentDiscount: discPercent,
                                      ppnCash: data.totalPPN.toInt(),
                                      ppnPercent: int.parse(data
                                          .modelIndex!
                                          .data!
                                          .arrayPrefrences![0]
                                          .prefValue!),
                                      serviceCash: data.totalServices.toInt(),
                                      maxDiscountPercent: 0,
                                      servicePercent: int.parse(
                                          data.modelIndex!.data!.arrayPrefrences![1].prefValue!));
                              data.postSubmitCashier(
                                  context: context,
                                  paymentId: _paymentId,
                                  totalHarga:
                                      "${data.totalHargaProduk! - data.totalDiscount.toInt() + data.totalPPN.toInt() + data.totalServices.toInt()}",
                                  items: jsonEncode(data.listDataCart),
                                  ppnValue: "${data.totalPPN.toInt()}",
                                  discountValue:
                                      "${data.totalDiscount.toInt()}",
                                  servicesValue:
                                      "${data.totalServices.toInt()}");
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
