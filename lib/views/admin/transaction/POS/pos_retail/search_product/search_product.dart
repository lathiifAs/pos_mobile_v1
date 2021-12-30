import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/transaction/p_pos.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/admin/transaction/POS/pos_retail/checkout/checkout_retail.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/search_widget.dart';
import 'package:provider/provider.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderPos>(context, listen: false)
        .getListIndex(context: context);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderPos>(context, listen: false);
      data.isCartClick = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderPos>(
        builder: (context, data, _) => SafeArea(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.white,
                          mini: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                            child: SearchWidget(
                          onTap: () {},
                          readOnly: false,
                          onChanged: (value) {
                            data.getSearchProduct(
                                context: context, produkNama: value);
                          },
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    (data.modelIndex == null)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : (data.modelIndex!.data == null)
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : (data.modelIndex!.data!.arrayProduk!.length == 0)
                                ? Center(child: Text("Empty data!"))
                                : GridView.builder(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    padding: EdgeInsets.all(10),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisExtent: 155,
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10,
                                            crossAxisCount: 3),
                                    itemCount: data
                                        .modelIndex!.data!.arrayProduk!.length,
                                    itemBuilder:
                                        (BuildContext context, int i) =>
                                            InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0.0, 1.0), //(x,y)
                                              blurRadius: 6.0,
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(BaseUrl
                                                                .baseImage +
                                                            data
                                                                .modelIndex!
                                                                .data!
                                                                .arrayProduk![i]
                                                                .produkGambarPath! +
                                                            data
                                                                .modelIndex!
                                                                .data!
                                                                .arrayProduk![i]
                                                                .produkGambarNama!)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        data
                                                                .modelIndex!
                                                                .data!
                                                                .arrayProduk![i]
                                                                .produkNama ??
                                                            "-",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        NumberFormat.currency(
                                                                locale: 'id',
                                                                decimalDigits:
                                                                    0,
                                                                symbol: 'Rp ')
                                                            .format(data
                                                                    .modelIndex!
                                                                    .data!
                                                                    .arrayProduk![
                                                                        i]
                                                                    .produkHarga ??
                                                                0),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: InkWell(
                                                onTap: () {
                                                  data.addCart(
                                                      produkId: data
                                                          .modelIndex!
                                                          .data!
                                                          .arrayProduk![i]
                                                          .produkId,
                                                      productName: data
                                                          .modelIndex!
                                                          .data!
                                                          .arrayProduk![i]
                                                          .produkNama!,
                                                      quantity: 1,
                                                      catatan: "",
                                                      productPrice: data
                                                          .modelIndex!
                                                          .data!
                                                          .arrayProduk![i]
                                                          .produkHarga);
                                                  data.isCartNull = true;
                                                  data.qtyItems = data
                                                      .listDataCart.length
                                                      .toString();
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(right: 5, bottom: 5),
                                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                                  decoration: BoxDecoration(
                                                      color: kButtonColor, borderRadius: BorderRadius.circular(4)),
                                                  child: Text(
                                                    'Add',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                  ],
                ),
              ),
              (data.isCartNull == false)
                  ? Container()
                  : Align(
                      alignment: Alignment.bottomCenter,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                child: Center(
                                                    child: Text(
                                                  "My Cart",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                          padding: EdgeInsets.fromLTRB(
                                              10, 0, 10, 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${produk['produk_nama']}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                              _controllerNotes
                                                                      .text =
                                                                  produk[
                                                                      'catatan'];
                                                              await NDialog(
                                                                content: Container(
                                                                    width: SizeConfig
                                                                            .screenWidth *
                                                                        0.8,
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                kDefaultPadding),
                                                                    child: DefaultTextInput(
                                                                        controller:
                                                                            _controllerNotes,
                                                                        labelText:
                                                                            "Notes",
                                                                        readOnly:
                                                                            false,
                                                                        obscureText:
                                                                            false)
                                                                    // TextField(
                                                                    //   controller:
                                                                    //       _controllerNotes,
                                                                    //   textAlign:
                                                                    //       TextAlign.center,
                                                                    //   onSubmitted: (value) {},
                                                                    // ),
                                                                    ),
                                                                actions: <
                                                                    Widget>[
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Provider.of<ProviderPos>(context, listen: false).addCart(
                                                                            produkId:
                                                                                produk['produk_id'],
                                                                            productName: produk['produk_nama'],
                                                                            quantity: produk['qty'],
                                                                            catatan: _controllerNotes.text,
                                                                            productPrice: produk['total_harga'],
                                                                            onDialog: true);
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        "OK",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.blue),
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
                                                            child: Text(
                                                              (produk['catatan'] ==
                                                                      "")
                                                                  ? "Notes..."
                                                                  : "${produk['catatan']}",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: (produk[
                                                                              'catatan'] ==
                                                                          "")
                                                                      ? Colors
                                                                          .grey
                                                                          .shade500
                                                                      : Colors
                                                                          .black),
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 25,
                                                          height: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color:
                                                                    kPrimaryColor),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () {
                                                              Provider.of<ProviderPos>(
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
                                                                          1,
                                                                      catatan:
                                                                          produk[
                                                                              'catatan'],
                                                                      productPrice:
                                                                          produk[
                                                                              'total_harga'],
                                                                      minus:
                                                                          true);
                                                              data.qtyItems = data
                                                                  .listDataCart
                                                                  .length
                                                                  .toString();
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
                                                        InkWell(
                                                          onTap: () async {
                                                            TextEditingController
                                                                _controllerQty =
                                                                TextEditingController();
                                                            _controllerQty
                                                                    .text =
                                                                produk['qty']
                                                                    .toString();
                                                            await NDialog(
                                                              content:
                                                                  Container(
                                                                      width: SizeConfig
                                                                              .screenWidth *
                                                                          0.4,
                                                                      padding: EdgeInsets.only(
                                                                          top:
                                                                              kDefaultPadding),
                                                                      child:
                                                                          TextField(
                                                                        controller:
                                                                            _controllerQty,
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        onSubmitted:
                                                                            (value) {
                                                                          Provider.of<ProviderPos>(context, listen: false).addCart(
                                                                              produkId: produk['produk_id'],
                                                                              productName: produk['produk_nama'],
                                                                              quantity: int.parse(_controllerQty.text),
                                                                              catatan: produk['catatan'],
                                                                              productPrice: produk['total_harga'],
                                                                              onDialog: true);
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                      )),
                                                              actions: <Widget>[
                                                                TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Provider.of<ProviderPos>(context, listen: false).addCart(
                                                                          produkId: produk[
                                                                              'produk_id'],
                                                                          productName: produk[
                                                                              'produk_nama'],
                                                                          quantity: int.parse(_controllerQty
                                                                              .text),
                                                                          catatan: produk[
                                                                              'catatan'],
                                                                          productPrice: produk[
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
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Text(
                                                                        "Cancel",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black)))
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
                                                                    "${produk['qty']}",
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
                                                        Container(
                                                          width: 25,
                                                          height: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color:
                                                                    kPrimaryColor),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () {
                                                              Provider.of<ProviderPos>(
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
                                                                          1,
                                                                      catatan:
                                                                          produk[
                                                                              'catatan'],
                                                                      productPrice:
                                                                          produk[
                                                                              'total_harga']);
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
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Center(
                                                        child: Text(
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              decimalDigits: 0,
                                                              symbol: '')
                                                          .format(produk[
                                                              'total_harga']),
                                                      style: TextStyle(
                                                          fontSize: 13),
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
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.add_shopping_cart,
                                            color: kPrimaryColor,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                    .format(
                                                        data.totalHargaProduk),
                                                style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                              builder: (context) =>
                                                  CheckoutRetail()));
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
            ],
          ),
        ),
      ),
    );
  }
}
