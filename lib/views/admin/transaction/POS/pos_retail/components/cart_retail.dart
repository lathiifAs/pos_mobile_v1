import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/transaction/p_pos.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/admin/transaction/POS/pos_retail/checkout/checkout_retail.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CartRetail extends StatelessWidget {
  const CartRetail({
    Key? key,
    this.data,
  }) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            (data.isCartClick == false)
                ? Container()
                : Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  child: Center(
                                      child: Text(
                                    "My Cart",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  data.isCartClick = false;
                                },
                                child: Icon(
                                  Icons.cancel_sharp,
                                  color: Colors.red,
                                  size: 28,
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        for (var produk in data.listDataCart)
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Expanded(
                                //   flex: 2,
                                //   child: Text(
                                //     "${produk['produk_nama']}",
                                //     style: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 15),
                                //   ),
                                // ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                      width: SizeConfig
                                                              .screenWidth *
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
                                                          Provider
                                                                  .of<ProviderPos>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                              .addCart(
                                                                  produkId:
                                                                      produk[
                                                                          'produk_id'],
                                                                  productName:
                                                                      produk[
                                                                          'produk_nama'],
                                                                  quantity:
                                                                      produk[
                                                                          'qty'],
                                                                  catatan:
                                                                      _controllerNotes
                                                                          .text,
                                                                  productPrice:
                                                                      produk[
                                                                          'total_harga'],
                                                                  onDialog:
                                                                      true);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          "OK",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                        )),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text("Cancel",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black)))
                                                  ],
                                                ).show(context);
                                              },
                                              child: Text(
                                                (produk['catatan'] == "")
                                                    ? "Notes..."
                                                    : "${produk['catatan']}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: (produk['catatan'] ==
                                                            "")
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
                                              border: Border.all(
                                                  color: kPrimaryColor),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                Provider.of<ProviderPos>(
                                                        context,
                                                        listen: false)
                                                    .addCart(
                                                        produkId:
                                                            produk['produk_id'],
                                                        productName: produk[
                                                            'produk_nama'],
                                                        quantity: 1,
                                                        catatan:
                                                            produk['catatan'],
                                                        productPrice: produk[
                                                            'total_harga'],
                                                        minus: true);
                                                data.qtyItems = data
                                                    .listDataCart.length
                                                    .toString();
                                              },
                                              child: Center(
                                                child: Text(
                                                  "-",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: kPrimaryColor),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              TextEditingController
                                                  _controllerQty =
                                                  TextEditingController();
                                              _controllerQty.text =
                                                  produk['qty'].toString();
                                              await NDialog(
                                                content: Container(
                                                  width:
                                                      SizeConfig.screenWidth *
                                                          0.4,
                                                  padding: EdgeInsets.only(
                                                      top: kDefaultPadding),
                                                  child: GeneralTextField(
                                                    label: "Quantity",
                                                    controller: _controllerQty,
                                                    inputType:
                                                        TextInputType.number,
                                                    onSubmitted: (value) {
                                                      Provider.of<ProviderPos>(
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
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                      onPressed: () {
                                                        Provider.of<ProviderPos>(
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
                                                                productPrice:
                                                                    produk[
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
                                                              color: Colors
                                                                  .black)))
                                                ],
                                              ).show(context);
                                            },
                                            child: Container(
                                              width: 30,
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "${produk['qty']}",
                                                      style: TextStyle(
                                                          fontSize: 13),
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
                                              border: Border.all(
                                                  color: kPrimaryColor),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                Provider.of<ProviderPos>(
                                                        context,
                                                        listen: false)
                                                    .addCart(
                                                        produkId:
                                                            produk['produk_id'],
                                                        productName: produk[
                                                            'produk_nama'],
                                                        quantity: 1,
                                                        catatan:
                                                            produk['catatan'],
                                                        productPrice: produk[
                                                            'total_harga']);
                                              },
                                              child: Center(
                                                child: Text(
                                                  "+",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
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
                          )
                      ],
                    ),
                  ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        data.isCartClick = true;
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.add_shopping_cart,
                              color: kPrimaryColor,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      data.qtyItems!,
                                      style: TextStyle(
                                        fontSize: 11,
                                      ),
                                    ),
                                    Text(
                                      " items",
                                      style: TextStyle(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          decimalDigits: 0,
                                          symbol: 'Rp ')
                                      .format(data.totalHargaProduk),
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckoutRetail()));
                      },
                      child: Container(
                        height: 50,
                        color: kButtonColor,
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
