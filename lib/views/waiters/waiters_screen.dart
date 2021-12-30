import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_auth.dart';
import 'package:pointofsales/providers/waiters/p_waiters.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:pointofsales/views/components/general_widgets/search_widget.dart';
import 'package:provider/provider.dart';

import 'checkout/checkout.dart';
import 'components/search_product.dart';

class WaitersScreen extends StatefulWidget {
  const WaitersScreen({Key? key}) : super(key: key);

  @override
  _WaitersScreenState createState() => _WaitersScreenState();
}

class _WaitersScreenState extends State<WaitersScreen> {
  @override
  void initState() {
    Provider.of<ProviderWaiters>(context, listen: false)
        .getIndexWaiters(context);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderWaiters>(context, listen: false);
      data.isCartClick = false;
      data.isAllClick = true;
    });
    super.initState();
  }

  bool isCategoryClick = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          var data = Provider.of<ProviderWaiters>(context, listen: false);
          data.typeService = 'dine in';
          data.customerNameCont.clear();
          data.mejaId = '';
          data.numberOfPersonCont.clear();
        });
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Waiters"),
          actions: [
            InkWell(
              onTap: () {
                Provider.of<ProviderAuth>(context, listen: false).logout();
              },
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Consumer<ProviderWaiters>(
          builder: (context, data, _) => Stack(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  SearchWidget(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchProduct()));
                    },
                    readOnly: true,
                    onChanged: (value) {},
                  ),
                  (data.modelIndexWaiters == null)
                      ? Container()
                      : (data.modelIndexWaiters!.data == null)
                          ? Container()
                          : (data.modelIndexWaiters!.data!.arraySalesGroup!
                                      .length ==
                                  0)
                              ? Container()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Category",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 27,
                                      width: double.infinity,
                                      margin: EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 18, vertical: 3),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(
                                                        0.0, 1.0), //(x,y)
                                                    blurRadius: 6.0,
                                                  ),
                                                ],
                                                color: (data.isAllClick == true)
                                                    ? kPrimaryColor
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                    color: (data.isAllClick ==
                                                            true)
                                                        ? kPrimaryColor
                                                        : Colors.grey)),
                                            child: InkWell(
                                              onTap: () {
                                                data.getIndexWaiters(context);
                                                data.isAllClick = true;
                                              },
                                              child: Center(
                                                child: Text(
                                                  "All",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: (data.isAllClick ==
                                                              false)
                                                          ? Colors.black
                                                          : Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListView.builder(
                                            itemCount: data.modelIndexWaiters!
                                                .data!.arraySalesGroup!.length,
                                            shrinkWrap: true,
                                            physics: ClampingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (c, i) => Container(
                                              margin: EdgeInsets.only(left: 5),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 3),
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      offset: Offset(
                                                          0.0, 1.0), //(x,y)
                                                      blurRadius: 6.0,
                                                    ),
                                                  ],
                                                  color: (data
                                                              .modelIndexWaiters!
                                                              .data!
                                                              .arraySalesGroup![
                                                                  i]
                                                              .activeColor ==
                                                          false)
                                                      ? Colors.white
                                                      : kPrimaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      color: (data
                                                                  .modelIndexWaiters!
                                                                  .data!
                                                                  .arraySalesGroup![
                                                                      i]
                                                                  .activeColor ==
                                                              false)
                                                          ? Colors.grey
                                                          : kPrimaryColor)),
                                              child: InkWell(
                                                onTap: () {
                                                  // setState(() {
                                                  //   data.modelIndexWaiters!.data!
                                                  //       .arraySalesGroup!
                                                  //       .forEach((element) {
                                                  //     if (element.salesGroupId ==
                                                  //         data
                                                  //             .modelIndexWaiters!
                                                  //             .data!
                                                  //             .arraySalesGroup![i]
                                                  //             .salesGroupId) {
                                                  //       element.activeColor =
                                                  //           !element.activeColor!;
                                                  //     } else {
                                                  //       element.activeColor = false;
                                                  //     }
                                                  //   });
                                                  // });
                                                  data.isAllClick = false;
                                                  data.getActiveColor(i);
                                                  data.getCategoryWaiters(
                                                      context: context,
                                                      i: i,
                                                      salesGroupId: data
                                                          .modelIndexWaiters!
                                                          .data!
                                                          .arraySalesGroup![i]
                                                          .salesGroupId
                                                          .toString());
                                                },
                                                child: Center(
                                                  child: Text(
                                                    data
                                                        .modelIndexWaiters!
                                                        .data!
                                                        .arraySalesGroup![i]
                                                        .salesGroupNama!,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: (data
                                                                    .modelIndexWaiters!
                                                                    .data!
                                                                    .arraySalesGroup![
                                                                        i]
                                                                    .activeColor ==
                                                                false)
                                                            ? Colors.black
                                                            : Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                  (data.modelIndexWaiters == null)
                      ? Container()
                      : (data.modelIndexWaiters!.data == null)
                          ? Container()
                          : (data.modelIndexWaiters!.data!.arrayProdukFavorite!
                                      .length ==
                                  0)
                              ? Container()
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Favorite Product",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                  ],
                                ),
                  (data.modelIndexWaiters == null)
                      ? Container()
                      : (data.modelIndexWaiters!.data == null)
                          ? Container()
                          : (data.modelIndexWaiters!.data!.arrayProdukFavorite!
                                      .length ==
                                  0)
                              ? Container()
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
                                  itemCount: data.modelIndexWaiters!.data!
                                      .arrayProdukFavorite!.length,
                                  itemBuilder: (BuildContext context, int i) =>
                                      InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
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
                                                              .modelIndexWaiters!
                                                              .data!
                                                              .arrayProdukFavorite![
                                                                  i]
                                                              .produkGambarPath! +
                                                          data
                                                              .modelIndexWaiters!
                                                              .data!
                                                              .arrayProdukFavorite![
                                                                  i]
                                                              .produkGambarNama!)),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      data
                                                              .modelIndexWaiters!
                                                              .data!
                                                              .arrayProdukFavorite![
                                                                  i]
                                                              .produkNama ??
                                                          "-",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              decimalDigits: 0,
                                                              symbol: 'Rp ')
                                                          .format(data
                                                                  .modelIndexWaiters!
                                                                  .data!
                                                                  .arrayProdukFavorite![
                                                                      i]
                                                                  .produkHarga ??
                                                              0),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          (data
                                                      .modelIndexWaiters!
                                                      .data!
                                                      .arrayProdukFavorite![i]
                                                      .ranking ==
                                                  null)
                                              ? Container()
                                              : Positioned(
                                                  right: 0,
                                                  bottom: 65,
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2,
                                                            horizontal: 6),
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(5),
                                                              bottomLeft: Radius
                                                                  .circular(5)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          offset: Offset(
                                                              0.0, 1.0), //(x,y)
                                                          blurRadius: 3.0,
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
                                                          color: Colors.amber,
                                                          size: 15,
                                                        ),
                                                        Text(
                                                          "${data.modelIndexWaiters!.data!.arrayProdukFavorite![i].ranking}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: InkWell(
                                              onTap: () {
                                                Provider.of<ProviderWaiters>(
                                                        context,
                                                        listen: false)
                                                    .addCart(
                                                        produkId: data
                                                            .modelIndexWaiters!
                                                            .data!
                                                            .arrayProdukFavorite![
                                                                i]
                                                            .produkId,
                                                        productName: data
                                                            .modelIndexWaiters!
                                                            .data!
                                                            .arrayProdukFavorite![
                                                                i]
                                                            .produkNama!,
                                                        quantity: 1,
                                                        catatan: "",
                                                        productPrice: data
                                                            .modelIndexWaiters!
                                                            .data!
                                                            .arrayProdukFavorite![
                                                                i]
                                                            .produkHarga);
                                                data.isCartNull = true;

                                                data.qtyItems = data
                                                    .listDataCart.length
                                                    .toString();
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    right: 5, bottom: 5),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 3),
                                                decoration: BoxDecoration(
                                                    color: kButtonColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
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
                  (data.modelIndexWaiters == null)
                      ? Container()
                      : (data.modelIndexWaiters!.data == null)
                          ? Container()
                          : (data.modelIndexWaiters!.data!.arrayProduk!
                                      .length ==
                                  0)
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "General Product",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                  (data.modelIndexWaiters == null)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : (data.modelIndexWaiters!.data == null)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : (data.modelIndexWaiters!.data!.arrayProduk!
                                      .length ==
                                  0)
                              ? Container()
                              : buildGeneralProduct(data),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.3,
                  )
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
                                mainAxisSize: MainAxisSize.min,
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
                                  // Container(
                                  //   margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  //   child: DefaultDropdown(
                                  //       label: 'Type of Service *',
                                  //       selectedItem: data.typeService!,
                                  //       onChanged: (val) =>
                                  //           data.typeService = val!,
                                  //       items: [
                                  //         "Dine In",
                                  //         "Take Away",
                                  //         "Delivery"
                                  //       ]),
                                  // ),
                                  // Container(
                                  //     margin:
                                  //         EdgeInsets.symmetric(horizontal: 10),
                                  //     child:
                                  //         (data.typeService!.toLowerCase() ==
                                  //                 "dine in")
                                  //             ? Consumer<ProviderWaiters>(
                                  //                 builder: (context, data, _) => (data
                                  //                             .modelIndexWaiters ==
                                  //                         null)
                                  //                     ? Center(
                                  //                         child:
                                  //                             CircularProgressIndicator(),
                                  //                       )
                                  //                     : (data.modelIndexWaiters!
                                  //                                 .data ==
                                  //                             null)
                                  //                         ? Container()
                                  //                         : (data
                                  //                                     .modelIndexWaiters!
                                  //                                     .data!
                                  //                                     .arrayMeja!
                                  //                                     .length ==
                                  //                                 0)
                                  //                             ? Row(
                                  //                                 children: [
                                  //                                   Expanded(
                                  //                                     child: DefaultDropdown(
                                  //                                         label:
                                  //                                             "Table *",
                                  //                                         selectedItem:
                                  //                                             "Empty Data!",
                                  //                                         onChanged:
                                  //                                             (value) {},
                                  //                                         items: data
                                  //                                             .modelIndexWaiters!
                                  //                                             .data!
                                  //                                             .arrayMeja!
                                  //                                             .map((e) =>
                                  //                                                 e.mejaNomor)
                                  //                                             .toList()),
                                  //                                   ),
                                  //                                   SizedBox(
                                  //                                     width: 10,
                                  //                                   ),
                                  //                                   Expanded(
                                  //                                     child:
                                  //                                         GeneralTextField(
                                  //                                       label:
                                  //                                           "Number of Person *",
                                  //                                       controller:
                                  //                                           data.numberOfPersonCont,
                                  //                                       inputType:
                                  //                                           TextInputType
                                  //                                               .number,
                                  //                                     ),
                                  //                                   ),
                                  //                                 ],
                                  //                               )
                                  //                             : Row(
                                  //                                 children: [
                                  //                                   DefaultDropdown(
                                  //                                       label:
                                  //                                           "Table *",
                                  //                                       selectedItem:
                                  //                                           "Choose",
                                  //                                       onChanged:
                                  //                                           (value) {
                                  //                                         var nama = data
                                  //                                             .modelIndexWaiters!
                                  //                                             .data!
                                  //                                             .arrayMeja!
                                  //                                             .where((element) =>
                                  //                                                 element.mejaNomor ==
                                  //                                                 value);
                                  //                                         nama.forEach(
                                  //                                             (element) {
                                  //                                           data.mejaId = element
                                  //                                               .mejaId
                                  //                                               .toString();
                                  //                                           data.tableName = element
                                  //                                               .mejaNomor
                                  //                                               .toString();
                                  //                                         });
                                  //                                       },
                                  //                                       items: data
                                  //                                           .modelIndexWaiters!
                                  //                                           .data!
                                  //                                           .arrayMeja!
                                  //                                           .map((e) =>
                                  //                                               e.mejaNomor)
                                  //                                           .toList()),
                                  //                                   SizedBox(
                                  //                                     width: 10,
                                  //                                   ),
                                  //                                   GeneralTextField(
                                  //                                     label:
                                  //                                         "Person *",
                                  //                                     controller:
                                  //                                         data.numberOfPersonCont,
                                  //                                     inputType:
                                  //                                         TextInputType
                                  //                                             .number,
                                  //                                   ),
                                  //                                 ],
                                  //                               ),
                                  //               )
                                  //             : Column(
                                  //                 children: [
                                  //                   GeneralTextField(
                                  //                     label: "Customer Name *",
                                  //                     controller:
                                  //                         data.customerNameCont,
                                  //                   ),
                                  //                 ],
                                  //               )),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  for (var produk in data.listDataCart)
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                          _controllerNotes
                                                                  .text =
                                                              produk['catatan'];
                                                          await NDialog(
                                                            content: Container(
                                                              width: SizeConfig
                                                                      .screenWidth *
                                                                  0.8,
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top:
                                                                          kDefaultPadding),
                                                              child:
                                                                  GeneralTextField(
                                                                label: "Notes",
                                                                controller:
                                                                    _controllerNotes,
                                                                hintText:
                                                                    "e.g extra pedas ya",
                                                                onSubmitted:
                                                                    (value) {
                                                                  Provider.of<ProviderWaiters>(context, listen: false).addCart(
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
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Provider.of<ProviderWaiters>(context, listen: false).addCart(
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
                                                                        color: Colors
                                                                            .blue),
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
                                                                  ? Colors.grey
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 25,
                                                      height: 25,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color:
                                                                kPrimaryColor),
                                                      ),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Provider.of<ProviderWaiters>(
                                                                  context,
                                                                  listen: false)
                                                              .addCart(
                                                                  produkId: produk[
                                                                      'produk_id'],
                                                                  productName:
                                                                      produk[
                                                                          'produk_nama'],
                                                                  quantity: 1,
                                                                  catatan: produk[
                                                                      'catatan'],
                                                                  productPrice:
                                                                      produk[
                                                                          'total_harga'],
                                                                  minus: true);
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
                                                            textAlign: TextAlign
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
                                                        _controllerQty.text =
                                                            produk['qty']
                                                                .toString();
                                                        await NDialog(
                                                          content: Container(
                                                              width: SizeConfig
                                                                      .screenWidth *
                                                                  0.4,
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top:
                                                                          kDefaultPadding),
                                                              child:
                                                                  GeneralTextField(
                                                                label:
                                                                    "Quantity",
                                                                controller:
                                                                    _controllerQty,
                                                                inputType:
                                                                    TextInputType
                                                                        .number,
                                                                onSubmitted:
                                                                    (value) {
                                                                  Provider.of<ProviderWaiters>(context, listen: false).addCart(
                                                                      produkId:
                                                                          produk[
                                                                              'produk_id'],
                                                                      productName:
                                                                          produk[
                                                                              'produk_nama'],
                                                                      quantity:
                                                                          int.parse(_controllerQty
                                                                              .text),
                                                                      catatan:
                                                                          produk[
                                                                              'catatan'],
                                                                      productPrice:
                                                                          produk[
                                                                              'total_harga'],
                                                                      onDialog:
                                                                          true);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              )),
                                                          actions: <Widget>[
                                                            TextButton(
                                                                onPressed: () {
                                                                  Provider.of<ProviderWaiters>(context, listen: false).addCart(
                                                                      produkId:
                                                                          produk[
                                                                              'produk_id'],
                                                                      productName:
                                                                          produk[
                                                                              'produk_nama'],
                                                                      quantity:
                                                                          int.parse(_controllerQty
                                                                              .text),
                                                                      catatan:
                                                                          produk[
                                                                              'catatan'],
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
                                                            color:
                                                                kPrimaryColor),
                                                      ),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Provider.of<ProviderWaiters>(
                                                                  context,
                                                                  listen: false)
                                                              .addCart(
                                                                  produkId: produk[
                                                                      'produk_id'],
                                                                  productName:
                                                                      produk[
                                                                          'produk_nama'],
                                                                  quantity: 1,
                                                                  catatan: produk[
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
                                                            textAlign: TextAlign
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
                                                  style:
                                                      TextStyle(fontSize: 13),
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
                                  data.isCartClick = !data.isCartClick!;
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
                                                data.qtyItems ?? "0",
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
                                                    data.totalHargaProduk ?? 0),
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
                                  // if (data.typeService!.toLowerCase() ==
                                  //     'dine in') {
                                  //   if (data.mejaId.isEmpty ||
                                  //       data.numberOfPersonCont.text.isEmpty) {
                                  //     showSnackBar(
                                  //         snackBarType: SnackBarType.WARNING,
                                  //         title: 'Warning',
                                  //         message:
                                  //             'Table and Number of Person is required!');
                                  //   } else {
                                  //     (data.totalHargaProduk == 0)
                                  //         ? showSnackBar(
                                  //             snackBarType:
                                  //                 SnackBarType.WARNING,
                                  //             title: 'Warning',
                                  //             message:
                                  //                 'Please select the menu first')
                                  //         : Navigator.push(
                                  //             context,
                                  //             MaterialPageRoute(
                                  //                 builder: (context) =>
                                  //                     Checkout()));
                                  //   }
                                  // }
                                  // if (data.typeService!.toLowerCase() ==
                                  //         'take away' ||
                                  //     data.typeService!.toLowerCase() ==
                                  //         'delivery') {
                                  //   if (data.customerNameCont.text.isEmpty) {
                                  //     showSnackBar(
                                  //         snackBarType: SnackBarType.WARNING,
                                  //         title: 'Warning',
                                  //         message:
                                  //             'Customer Name is required!');
                                  //   } else {
                                  (data.totalHargaProduk == 0)
                                      ? showSnackBar(
                                          snackBarType: SnackBarType.WARNING,
                                          title: 'Warning',
                                          message:
                                              'Please select the menu first')
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Checkout()));
                                  // }
                                  // }
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  GridView buildGeneralProduct(ProviderWaiters data) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 155,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 3),
      itemCount: data.modelIndexWaiters!.data!.arrayProduk!.length,
      itemBuilder: (BuildContext context, int i) => InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(BaseUrl.baseImage +
                              data.modelIndexWaiters!.data!.arrayProduk![i]
                                  .produkGambarPath! +
                              data.modelIndexWaiters!.data!.arrayProduk![i]
                                  .produkGambarNama!)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data.modelIndexWaiters!.data!.arrayProduk![i]
                                  .produkNama ??
                              "-",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id', decimalDigits: 0, symbol: 'Rp ')
                              .format(data.modelIndexWaiters!.data!
                                      .arrayProduk![i].produkHarga ??
                                  0),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              (data.modelIndexWaiters!.data!.arrayProduk![i].ranking == null)
                  ? Container()
                  : Positioned(
                      right: 0,
                      bottom: 65,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                            Text(
                              "${data.modelIndexWaiters!.data!.arrayProduk![i].ranking}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    Provider.of<ProviderWaiters>(context, listen: false)
                        .addCart(
                            produkId: data.modelIndexWaiters!.data!
                                .arrayProduk![i].produkId,
                            productName: data.modelIndexWaiters!.data!
                                .arrayProduk![i].produkNama!,
                            quantity: 1,
                            catatan: "",
                            productPrice: data.modelIndexWaiters!.data!
                                .arrayProduk![i].produkHarga);
                    data.isCartNull = true;
                    data.qtyItems = data.listDataCart.length.toString();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 5, bottom: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                        color: kButtonColor,
                        borderRadius: BorderRadius.circular(4)),
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
    );
  }
}
