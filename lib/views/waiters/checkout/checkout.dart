import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/waiters/p_waiters.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/currency_formatters.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_separator.dart';
import 'package:pointofsales/views/components/general_widgets/general_button_border.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  // final String mejaId;

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  TextEditingController _productNameCont = TextEditingController();
  TextEditingController _hargaCont = TextEditingController();
  TextEditingController _totalHargaCont = TextEditingController();
  TextEditingController _notesCont = TextEditingController();
  TextEditingController _qtyCont = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderWaiters>(context, listen: false)
        .getIndexWaiters(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Consumer<ProviderWaiters>(
        builder: (context, data, _) => Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: DefaultButton(
                      backgroundColor: kPrimaryColor,
                      buttonText: "Send to Kitchen & Cashier",
                      onPressed: () {
                        // print(_mejaId);
                        // print(_controllerCusName.text);
                        // print(jsonEncode(data.listDataCart));
                        // print(data.typeService);
                        // print(_controllerPerson.text);

                        Provider.of<ProviderWaiters>(context, listen: false)
                            .postSubmit(
                                context: context,
                                idMeja: data.mejaId,
                                namaPemesan: data.customerNameCont.text,
                                person: data.numberOfPersonCont.text,
                                items: jsonEncode(data.listDataCart),
                                typeServices: data.typeService!,
                                total: data.totalHargaProduk.toString(),
                                itemManualProduct:
                                    jsonEncode(data.listManualProduct));

                        // print(jsonEncode(data.listDataCart));
                        // print(jsonEncode(data.listManualProduct));
                        // print(data.mejaId);
                        // print(data.numberOfPersonCont.text);
                        // print(data.customerNameCont.text);
                        // print(data.totalHargaProduk);
                        // print(data.totalHargaManual);
                      }),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    for (var produk in data.listDataCart)
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
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
                                        child: InkWell(
                                          onTap: () async {
                                            TextEditingController
                                                _controllerNotes =
                                                TextEditingController();
                                            _controllerNotes.text =
                                                produk['catatan'];
                                            await NDialog(
                                              content: Container(
                                                  width:
                                                      SizeConfig.screenWidth *
                                                          0.8,
                                                  padding: EdgeInsets.only(
                                                      top: kDefaultPadding),
                                                  child: GeneralTextField(
                                                    label: "Notes",
                                                    controller:
                                                        _controllerNotes,
                                                  )),
                                              actions: <Widget>[
                                                TextButton(
                                                    onPressed: () {
                                                      Provider.of<ProviderWaiters>(
                                                              context,
                                                              listen: false)
                                                          .addCart(
                                                              produkId: produk[
                                                                  'produk_id'],
                                                              productName: produk[
                                                                  'produk_nama'],
                                                              quantity:
                                                                  produk['qty'],
                                                              catatan:
                                                                  _controllerNotes
                                                                      .text,
                                                              productPrice: produk[
                                                                  'total_harga'],
                                                              onDialog: true);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "OK",
                                                      style: TextStyle(
                                                          color: Colors.blue),
                                                    )),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("Cancel",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black)))
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: kPrimaryColor),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Provider.of<ProviderWaiters>(
                                                    context,
                                                    listen: false)
                                                .addCart(
                                                    produkId:
                                                        produk['produk_id'],
                                                    productName:
                                                        produk['produk_nama'],
                                                    quantity: 1,
                                                    catatan: produk['catatan'],
                                                    productPrice:
                                                        produk['total_harga'],
                                                    minus: true);
                                            data.qtyItems = data
                                                .listDataCart.length
                                                .toString();
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
                                              width:
                                                  SizeConfig.screenWidth * 0.4,
                                              padding: EdgeInsets.only(
                                                  top: kDefaultPadding),
                                              child: GeneralTextField(
                                                label: "Quantity",
                                                controller: _controllerQty,
                                                inputType: TextInputType.number,
                                                onSubmitted: (value) {
                                                  Provider.of<ProviderWaiters>(
                                                          context,
                                                          listen: false)
                                                      .addCart(
                                                          produkId: produk[
                                                              'produk_id'],
                                                          productName: produk[
                                                              'produk_nama'],
                                                          quantity: int.parse(
                                                              _controllerQty
                                                                  .text),
                                                          catatan:
                                                              produk['catatan'],
                                                          productPrice: produk[
                                                              'total_harga'],
                                                          onDialog: true);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    Provider.of<ProviderWaiters>(
                                                            context,
                                                            listen: false)
                                                        .addCart(
                                                            produkId: produk[
                                                                'produk_id'],
                                                            productName: produk[
                                                                'produk_nama'],
                                                            quantity: int.parse(
                                                                _controllerQty
                                                                    .text),
                                                            catatan: produk[
                                                                'catatan'],
                                                            productPrice: produk[
                                                                'total_harga'],
                                                            onDialog: true);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                        color: Colors.blue),
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
                                              children: [
                                                Text(
                                                  "${produk['qty']}",
                                                  style:
                                                      TextStyle(fontSize: 13),
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
                                          border:
                                              Border.all(color: kPrimaryColor),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Provider.of<ProviderWaiters>(
                                                    context,
                                                    listen: false)
                                                .addCart(
                                                    produkId:
                                                        produk['produk_id'],
                                                    productName:
                                                        produk['produk_nama'],
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
                                            locale: 'id',
                                            decimalDigits: 0,
                                            symbol: '')
                                        .format(produk['total_harga']),
                                    style: TextStyle(fontSize: 13),
                                  )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    // INPUT MANUAL
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GeneralButtonBorder(
                        label: 'Input Manual Product',
                        onTap: () async {
                          await NAlertDialog(
                            dialogStyle: DialogStyle(titleDivider: true),
                            title: Text("Input Product Manual"),
                            content: SingleChildScrollView(
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GeneralTextField(
                                      label: 'Product Name *',
                                      colorHint: Colors.black,
                                      onChanged: (value) {
                                        _productNameCont.text = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GeneralTextField(
                                      label: 'Quantity *',
                                      colorHint: Colors.black,
                                      inputType: TextInputType.number,
                                      onChanged: (value) {
                                        _qtyCont.text = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GeneralTextField(
                                      label: 'Price *',
                                      colorHint: Colors.black,
                                      inputType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        CurrencyFormatters(maxDigits: 12)
                                      ],
                                      onChanged: (value) {
                                        _hargaCont.text = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GeneralTextField(
                                      label: 'Total Price *',
                                      colorHint: Colors.black,
                                      inputType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        CurrencyFormatters(maxDigits: 12)
                                      ],
                                      onChanged: (value) {
                                        _totalHargaCont.text = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GeneralTextField(
                                      label: 'Notes',
                                      maxLines: 3,
                                      colorHint: Colors.black,
                                      onChanged: (value) {
                                        _notesCont.text = value;
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                    (_productNameCont.text == '' ||
                                            _qtyCont.text == '' ||
                                            _hargaCont.text == '' ||
                                            _totalHargaCont.text == '')
                                        ? showSnackBar(
                                            snackBarType: SnackBarType.ERROR,
                                            title: 'Failed',
                                            message:
                                                'The required data cannot be empty!')
                                        : data.addManualProduct(
                                            productName: _productNameCont.text,
                                            quantity: int.parse(_qtyCont.text),
                                            price: int.parse(_hargaCont.text
                                                .replaceAll('.', '')),
                                            totalPrice: int.parse(
                                                _totalHargaCont.text
                                                    .replaceAll('.', '')),
                                            catatan: _notesCont.text);
                                    data.getTotalHargaManualProduct();
                                    data.getTotalHargaProduk();
                                    print(data.totalHargaManual);
                                    print(data.totalHargaProduk);
                                    _productNameCont.clear();
                                    _qtyCont.clear();
                                    _hargaCont.clear();
                                    _totalHargaCont.clear();
                                    _notesCont.clear();
                                  },
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ],
                          ).show(context);
                        },
                      ),
                    ),
                    // MANUAL PRODUCT
                    SizedBox(
                      height: 10,
                    ),
                    // Text(
                    //   'Manual Product',
                    //   style: TextStyle(color: kPrimaryColor),
                    // ),
                    for (var produk in data.listManualProduct)
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    "${produk['nama_item']}",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "( ${produk['qty']} )",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'id',
                                              decimalDigits: 0,
                                              symbol: '')
                                          .format(produk['total_harga']),
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    // IconButton(
                                    //   onPressed: () {},
                                    //   icon: Icon(
                                    //     Icons.delete,
                                    //     color: Colors.red,
                                    //   ),
                                    //   iconSize: 20,
                                    // )
                                    InkWell(
                                        onTap: () {
                                          data.deleteManualProduct(data
                                              .listManualProduct
                                              .indexOf(produk));
                                          data.getTotalHargaProduk();
                                          data.getTotalHargaManualProduct();
                                          print(data.totalHargaProduk);
                                          print(data.totalHargaManual);
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 20,
                                        ))
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id', decimalDigits: 0, symbol: 'Rp ')
                              .format(data.totalHargaProduk ?? 0),
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                    (data.typeService!.toLowerCase() == 'dine in')
                        ? Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Table : '),
                                  Text(data.tableName ?? '-')
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Number of Person : '),
                                  Text(data.numberOfPersonCont.text)
                                ],
                              )
                            ],
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Customer Name : '),
                              Text(data.customerNameCont.text)
                            ],
                          ),

                    SizedBox(
                      height: kDefaultPadding * 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
