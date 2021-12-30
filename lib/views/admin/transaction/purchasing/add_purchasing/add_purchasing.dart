import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/transaction/p_purchasing.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/currency_formatters.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';

class AddPurchasing extends StatefulWidget {
  const AddPurchasing({Key? key}) : super(key: key);

  @override
  _AddPurchasingState createState() => _AddPurchasingState();
}

class _AddPurchasingState extends State<AddPurchasing> {
  TextEditingController _noSupplierCont = TextEditingController();
  TextEditingController _descCont = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderPurchasing>(context, listen: false).getDataAdd(context);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderPurchasing>(context, listen: false);
      data.isCartClick = false;
      data.qtyItems = '0';
      data.listProduct = [];
    });
    super.initState();
  }

  String supplierId = "";
  String warehouseId = "";
  String harga = "";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String currentDate = formatter.format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Purchasing"),
      ),
      body: Consumer<ProviderPurchasing>(
        builder: (context, data, _) => Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GeneralTextField(
                            label: 'Date *',
                            hintText: currentDate,
                            colorHint: Colors.black,
                            readOnly: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GeneralTextField(
                            label: 'No. Supplier *',
                            hintText: 'Enter no. supplier',
                            inputType: TextInputType.number,
                            controller: _noSupplierCont,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Consumer<ProviderPurchasing>(
                              builder: (context, data, _) => (data
                                          .modelDataAdd ==
                                      null)
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : (data.modelDataAdd!.data == null)
                                      ? Container()
                                      : (data.modelDataAdd!.data!.arrayProduk!
                                                  .length ==
                                              0)
                                          ? DefaultDropdown(
                                              label: "Supplier *",
                                              selectedItem: "Data is empty!",
                                              onChanged: (value) {},
                                              items: data.modelDataAdd!.data!
                                                  .arraySupplier!
                                                  .map((e) => e.supplierNama)
                                                  .toList())
                                          : DefaultDropdown(
                                              label: "Supplier *",
                                              selectedItem: "Choose",
                                              onChanged: (value) {
                                                var name = data.modelDataAdd!
                                                    .data!.arraySupplier!
                                                    .where((element) =>
                                                        element.supplierNama ==
                                                        value);
                                                name.forEach((element) {
                                                  supplierId = element
                                                      .supplierId
                                                      .toString();
                                                });
                                              },
                                              items: data.modelDataAdd!.data!
                                                  .arraySupplier!
                                                  .map((e) => e.supplierNama)
                                                  .toList())),
                          SizedBox(
                            height: 10,
                          ),
                          Consumer<ProviderPurchasing>(
                              builder: (context, data, _) => (data
                                          .modelDataAdd ==
                                      null)
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : (data.modelDataAdd!.data == null)
                                      ? Container()
                                      : (data.modelDataAdd!.data!.arrayProduk!
                                                  .length ==
                                              0)
                                          ? DefaultDropdown(
                                              label: "Warehouse *",
                                              selectedItem: "Data is empty!",
                                              onChanged: (value) {},
                                              items: data.modelDataAdd!.data!
                                                  .arrayGudang!
                                                  .map((e) => e.roleNm)
                                                  .toList())
                                          : DefaultDropdown(
                                              label: "Warehouse *",
                                              selectedItem: "Choose",
                                              onChanged: (value) {
                                                var name = data.modelDataAdd!
                                                    .data!.arrayGudang!
                                                    .where((element) =>
                                                        element.roleNm ==
                                                        value);
                                                name.forEach((element) {
                                                  warehouseId =
                                                      element.roleId.toString();
                                                });
                                              },
                                              items: data.modelDataAdd!.data!
                                                  .arrayGudang!
                                                  .map((e) => e.roleNm)
                                                  .toList())),
                          SizedBox(
                            height: 10,
                          ),
                          GeneralTextField(
                            label: 'Description',
                            hintText: 'Enter description',
                            controller: _descCont,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 60),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text(
                            'Product *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Consumer<ProviderPurchasing>(
                          builder: (context, data, _) => (data.modelDataAdd ==
                                  null)
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : (data.modelDataAdd!.data == null)
                                  ? Container()
                                  : (data.modelDataAdd!.data!.arrayProduk!
                                              .length ==
                                          0)
                                      ? Center(
                                          child: EmptyData(),
                                        )
                                      : GridView.builder(
                                          padding: EdgeInsets.fromLTRB(
                                              10, 0, 10, 10),
                                          shrinkWrap: true,
                                          physics: ClampingScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  mainAxisExtent: 175,
                                                  mainAxisSpacing: 20,
                                                  crossAxisSpacing: 20,
                                                  crossAxisCount: 2),
                                          itemCount: data.modelDataAdd!.data!
                                              .arrayProduk!.length,
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
                                                    offset: Offset(
                                                        0.0, 1.0), //(x,y)
                                                    blurRadius: 6.0,
                                                  ),
                                                ],
                                              ),
                                              child: Stack(
                                                children: [
                                                  buildButtonAddProduct(
                                                      data, i),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(BaseUrl
                                                                      .imageUrl +
                                                                  data
                                                                      .modelDataAdd!
                                                                      .data!
                                                                      .arrayProduk![
                                                                          i]
                                                                      .produkGambarPath! +
                                                                  data
                                                                      .modelDataAdd!
                                                                      .data!
                                                                      .arrayProduk![
                                                                          i]
                                                                      .produkGambarNama!)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(10),
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
                                                                  .modelDataAdd!
                                                                  .data!
                                                                  .arrayProduk![
                                                                      i]
                                                                  .produkNama!,
                                                              maxLines: 3,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            // Text(
                                                            //   data.modelDataAdd!.data!
                                                            //       .arrayProduk![i].produkGroupNama!,
                                                            //   maxLines: 1,
                                                            //   overflow: TextOverflow.ellipsis,
                                                            //   style: TextStyle(fontSize: 10),
                                                            // ),
                                                            Text(
                                                              "Stock : ${data.modelDataAdd!.data!.arrayProduk![i].stok}",
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            ),
                                                            Text(
                                                              NumberFormat.currency(
                                                                      locale:
                                                                          'id',
                                                                      decimalDigits:
                                                                          0,
                                                                      symbol:
                                                                          'Rp ')
                                                                  .format(data
                                                                          .modelDataAdd!
                                                                          .data!
                                                                          .arrayProduk![
                                                                              i]
                                                                          .produkHarga ??
                                                                      0),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  (data
                                                              .modelDataAdd!
                                                              .data!
                                                              .arrayProduk![i]
                                                              .ranking ==
                                                          null)
                                                      ? Container()
                                                      : Positioned(
                                                          right: 0,
                                                          bottom: 65,
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 2,
                                                                    horizontal:
                                                                        6),
                                                            height: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          5),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          5)),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey,
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          1.0),
                                                                  //(x,y)
                                                                  blurRadius:
                                                                      3.0,
                                                                ),
                                                              ],
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amber,
                                                                  size: 15,
                                                                ),
                                                                Text(
                                                                  "${data.modelDataAdd!.data!.arrayProduk![i].ranking}",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          13),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // CART
            Align(
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
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6)),
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
                                                fontWeight: FontWeight.bold),
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
                                Divider(
                                  color: Colors.grey,
                                ),
                                for (var produk in data.listProduct)
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            "${produk['produk_nama']}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
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
                                                        Provider.of<ProviderPurchasing>(
                                                                context,
                                                                listen: false)
                                                            .addCart(
                                                                produkId: produk[
                                                                    'produk_id'],
                                                                productName: produk[
                                                                    'produk_nama'],
                                                                quantity: 1,
                                                                catatan: produk[
                                                                    'catatan'],
                                                                productPrice:
                                                                    produk[
                                                                        'total'],
                                                                minus: true);
                                                        data.qtyItems = data
                                                            .listProduct.length
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
                                                              TextAlign.center,
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
                                                          produk['jumlah']
                                                              .toString();
                                                      await NDialog(
                                                        content: Container(
                                                            width: SizeConfig
                                                                    .screenWidth *
                                                                0.4,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        kDefaultPadding),
                                                            child:
                                                                GeneralTextField(
                                                              label: "Quantity",
                                                              controller:
                                                                  _controllerQty,
                                                              inputType:
                                                                  TextInputType
                                                                      .number,
                                                              onSubmitted:
                                                                  (value) {
                                                                Provider.of<ProviderPurchasing>(context, listen: false).addCart(
                                                                    produkId:
                                                                        produk[
                                                                            'produk_id'],
                                                                    productName:
                                                                        produk[
                                                                            'produk_nama'],
                                                                    quantity: int.parse(
                                                                        _controllerQty
                                                                            .text),
                                                                    catatan: produk[
                                                                        'catatan'],
                                                                    productPrice:
                                                                        produk[
                                                                            'total'],
                                                                    onDialog:
                                                                        true);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            )),
                                                        actions: <Widget>[
                                                          TextButton(
                                                              onPressed: () {
                                                                Provider.of<ProviderPurchasing>(context, listen: false).addCart(
                                                                    produkId:
                                                                        produk[
                                                                            'produk_id'],
                                                                    productName:
                                                                        produk[
                                                                            'produk_nama'],
                                                                    quantity: int.parse(
                                                                        _controllerQty
                                                                            .text),
                                                                    catatan: produk[
                                                                        'catatan'],
                                                                    productPrice:
                                                                        produk[
                                                                            'total'],
                                                                    onDialog:
                                                                        true);
                                                                Navigator.pop(
                                                                    context);
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
                                                    child: Container(
                                                      width: 30,
                                                      child: Center(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              "${produk['jumlah']}",
                                                              style: TextStyle(
                                                                  fontSize: 13),
                                                            ),
                                                            Divider(
                                                              color:
                                                                  Colors.grey,
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
                                                        Provider.of<ProviderPurchasing>(
                                                                context,
                                                                listen: false)
                                                            .addCart(
                                                                produkId: produk[
                                                                    'produk_id'],
                                                                productName: produk[
                                                                    'produk_nama'],
                                                                quantity: 1,
                                                                catatan: produk[
                                                                    'catatan'],
                                                                productPrice:
                                                                    produk[
                                                                        'total']);
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
                                                              TextAlign.center,
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
                                                    .format(produk['total']),
                                                style: TextStyle(fontSize: 13),
                                              )),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
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
                                data.isCartClick = !data.isCartClick;
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
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
                                              data.qtyItems,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              " items",
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Text(
                                        //   NumberFormat.currency(
                                        //           locale: 'id',
                                        //           decimalDigits: 0,
                                        //           symbol: 'Rp ')
                                        //       .format(
                                        //           data.totalHargaProduk ?? 0),
                                        //   style: TextStyle(
                                        //       color: kPrimaryColor,
                                        //       fontWeight: FontWeight.bold),
                                        // )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: () {
                                print(currentDate);
                                print(_noSupplierCont.text);
                                print(warehouseId);
                                print(supplierId);
                                print(_descCont.text);
                                print(jsonEncode(data.listProduct));
                                data.postAddPurchasing(
                                    context: context,
                                    tglPembelian: currentDate,
                                    noSupplier: _noSupplierCont.text,
                                    warehouseId: warehouseId,
                                    supplierId: supplierId,
                                    catatan: _descCont.text,
                                    produkPurchasing:
                                        jsonEncode(data.listProduct));
                              },
                              child: Container(
                                height: 50,
                                color: kButtonColor,
                                child: Center(
                                  child: Text(
                                    "Save",
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
            ),
          ],
        ),
      ),
    );
  }

  Align buildButtonAddProduct(ProviderPurchasing data, int i) {
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        onTap: () {
          data.addCart(
              produkId: data.modelDataAdd!.data!.arrayProduk![i].produkId,
              productName: data.modelDataAdd!.data!.arrayProduk![i].produkNama!,
              quantity: 1,
              catatan: "",
              productPrice:
                  data.modelDataAdd!.data!.arrayProduk![i].produkHarga);
          data.isCartNull = true;
          data.qtyItems = data.listProduct.length.toString();
          data.modelDataAdd!.data!.arrayProduk![i].isChoose = true;
        },
        child: Container(
          margin: const EdgeInsets.only(right: 5, bottom: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
              color: (data.modelDataAdd!.data!.arrayProduk![i].isChoose == true)
                  ? Colors.blue
                  : kButtonColor,
              borderRadius: BorderRadius.circular(4)),
          child: Text(
            (data.modelDataAdd!.data!.arrayProduk![i].isChoose == true)
                ? 'Added'
                : 'Add',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
