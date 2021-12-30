import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_konversi_satuan.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class KonversiSatuanScreen extends StatefulWidget {
  const KonversiSatuanScreen({Key? key}) : super(key: key);

  @override
  _KonversiSatuanScreenState createState() => _KonversiSatuanScreenState();
}

class _KonversiSatuanScreenState extends State<KonversiSatuanScreen> {
  TextEditingController _qtyBesarController = TextEditingController();
  TextEditingController _qtyKecilController = TextEditingController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderKonversiSatuan>(context, listen: false)
        .getListKonversi(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderKonversiSatuan>(context, listen: false)
        .getListKonversi(context);
    Provider.of<ProviderKonversiSatuan>(context, listen: false)
        .getAddKonversi(context);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderKonversiSatuan>(context, listen: false);
      data.satuanBesarId = null;
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderKonversiSatuan>(context, listen: false);
      data.satuanKecilId = null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UOM Conversion"),
      ),
      floatingActionButton: Consumer<ProviderKonversiSatuan>(
        builder: (context, data, _) => FloatingActionButton(
          backgroundColor: kButtonColor,
          onPressed: () async {
            await NAlertDialog(
              dialogStyle: DialogStyle(titleDivider: true),
              title: Text("UOM Conversion"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: DefaultDropdown(
                            label: "Satuan besar",
                            selectedItem: "Choose",
                            onChanged: (value) {
                              var namaSatuanBesar = data
                                  .modelDataAdd!.data![0].arraySatuan!
                                  .where(
                                      (element) => element.satuanNama == value);
                              namaSatuanBesar.forEach((element) {
                                data.satuanBesarId =
                                    element.satuanId.toString();
                              });
                            },
                            items: data.modelDataAdd!.data![0].arraySatuan!
                                .map((e) => e.satuanNama)
                                .toList()),
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // Expanded(
                      //   flex: 1,
                      //   child: Container(
                      //       margin: EdgeInsets.only(bottom: 1),
                      //       padding: EdgeInsets.symmetric(horizontal: 10),
                      //       height: 39,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(4),
                      //           border: Border.all(color: Colors.grey)),
                      //       child: TextField(
                      //         controller: _qtyBesarController,
                      //         style: TextStyle(
                      //           fontSize: 12,
                      //         ),
                      //         decoration: InputDecoration(
                      //             hintText: "Quantity",
                      //             hintStyle: TextStyle(
                      //               fontSize: 12,
                      //             )),
                      //         keyboardType: TextInputType.number,
                      //       )),
                      // )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: DefaultDropdown(
                            label: "Satuan kecil",
                            selectedItem: "Choose",
                            onChanged: (value) {
                              var namaSatuanKecil = data
                                  .modelDataAdd!.data![0].arraySatuan!
                                  .where(
                                      (element) => element.satuanNama == value);
                              namaSatuanKecil.forEach((element) {
                                data.satuanKecilId =
                                    element.satuanId.toString();
                              });
                            },
                            items: data.modelDataAdd!.data![0].arraySatuan!
                                .map((e) => e.satuanNama)
                                .toList()),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            margin: EdgeInsets.only(bottom: 1),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                            child: TextField(
                              controller: _qtyKecilController,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintText: "Quantity",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                  )),
                              keyboardType: TextInputType.number,
                            )),
                      )
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: DefaultButton(
                        backgroundColor: kButtonColor,
                        buttonText: "Save",
                        onPressed: () {
                          Navigator.pop(context);
                          data.getListKonversi(context);
                          data.postAddKonversi(
                              context,
                              (data.satuanBesarId == null)
                                  ? ""
                                  : data.satuanBesarId!,
                              _qtyBesarController.text,
                              (data.satuanKecilId == null)
                                  ? ""
                                  : data.satuanKecilId!,
                              _qtyKecilController.text);
                          _qtyBesarController.clear();
                          _qtyKecilController.clear();
                          data.satuanBesarId = null;
                          data.satuanKecilId = null;
                        }))
              ],
            ).show(context);
          },
          child: Icon(Icons.add),
        ),
      ),
      body: Consumer<ProviderKonversiSatuan>(
        builder: (context, data, _) => (data.modelListKonversi == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelDataAdd == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (data.modelListKonversi!.data!.length == 0)
                    ? Container()
                    : (data.modelDataAdd!.data!.length == 0)
                        ? Container()
                        : (data.modelListKonversi!.data![0].arrayKonversi!
                                    .length ==
                                0)
                            ? SmartRefresher(
                                enablePullDown: true,
                                header: WaterDropHeader(),
                                controller: _refreshController,
                                onRefresh: _onRefresh,
                                child: Center(
                                  child: EmptyData(),
                                ),
                              )
                            : SmartRefresher(
                                enablePullDown: true,
                                header: WaterDropHeader(),
                                controller: _refreshController,
                                onRefresh: _onRefresh,
                                child: GridView.builder(
                                    padding: EdgeInsets.all(kDefaultPadding),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisExtent: 57,
                                            mainAxisSpacing: 20,
                                            crossAxisSpacing: 20,
                                            crossAxisCount: 3),
                                    itemCount: data.modelListKonversi!.data![0]
                                        .arrayKonversi!.length,
                                    itemBuilder: (context, i) => Card(
                                          elevation: 0.4,
                                          child: InkWell(
                                            onTap: () async {
                                              _qtyKecilController.text = data
                                                  .modelListKonversi!
                                                  .data![0]
                                                  .arrayKonversi![i]
                                                  .satuanKecilQty
                                                  .toString();
                                              await NAlertDialog(
                                                dialogStyle: DialogStyle(
                                                    titleDivider: true),
                                                title: Text("UOM Conversion"),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child:
                                                              DefaultDropdown(
                                                                  label:
                                                                      "Satuan besar",
                                                                  selectedItem: data
                                                                      .modelListKonversi!
                                                                      .data![0]
                                                                      .arrayKonversi![
                                                                          i]
                                                                      .namaSatuanBesar
                                                                      .toString(),
                                                                  onChanged:
                                                                      (value) {
                                                                    var namaSatuanBesar = data
                                                                        .modelDataAdd!
                                                                        .data![
                                                                            0]
                                                                        .arraySatuan!
                                                                        .where((element) =>
                                                                            element.satuanNama ==
                                                                            value);
                                                                    namaSatuanBesar
                                                                        .forEach(
                                                                            (element) {
                                                                      data.satuanBesarId = element
                                                                          .satuanId
                                                                          .toString();
                                                                    });
                                                                  },
                                                                  items: data
                                                                      .modelDataAdd!
                                                                      .data![0]
                                                                      .arraySatuan!
                                                                      .map((e) =>
                                                                          e.satuanNama)
                                                                      .toList()),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child:
                                                              DefaultDropdown(
                                                                  label:
                                                                      "Satuan kecil",
                                                                  selectedItem: data
                                                                      .modelListKonversi!
                                                                      .data![0]
                                                                      .arrayKonversi![
                                                                          i]
                                                                      .namaSatuanKecil
                                                                      .toString(),
                                                                  onChanged:
                                                                      (value) {
                                                                    var namaSatuanKecil = data
                                                                        .modelDataAdd!
                                                                        .data![
                                                                            0]
                                                                        .arraySatuan!
                                                                        .where((element) =>
                                                                            element.satuanNama ==
                                                                            value);
                                                                    namaSatuanKecil
                                                                        .forEach(
                                                                            (element) {
                                                                      data.satuanKecilId = element
                                                                          .satuanId
                                                                          .toString();
                                                                    });
                                                                  },
                                                                  items: data
                                                                      .modelDataAdd!
                                                                      .data![0]
                                                                      .arraySatuan!
                                                                      .map((e) =>
                                                                          e.satuanNama)
                                                                      .toList()),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          1),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10),
                                                              height: 45,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade300)),
                                                              child: TextField(
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 13,
                                                                ),
                                                                controller:
                                                                    _qtyKecilController,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                decoration: InputDecoration(
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                    hintStyle: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        color: Colors
                                                                            .black)),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                              )),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        data.getListKonversi(
                                                            context);
                                                        data.postEditKonversi(
                                                            context,
                                                            (data.satuanBesarId ==
                                                                    null)
                                                                ? data
                                                                    .modelListKonversi!
                                                                    .data![0]
                                                                    .arrayKonversi![
                                                                        i]
                                                                    .satuanBesarId
                                                                    .toString()
                                                                : data
                                                                    .satuanBesarId!,
                                                            (_qtyBesarController
                                                                        .text ==
                                                                    "")
                                                                ? data
                                                                    .modelListKonversi!
                                                                    .data![0]
                                                                    .arrayKonversi![
                                                                        i]
                                                                    .satuanBesarQty
                                                                    .toString()
                                                                : _qtyBesarController
                                                                    .text,
                                                            (data.satuanKecilId ==
                                                                    null)
                                                                ? data
                                                                    .modelListKonversi!
                                                                    .data![0]
                                                                    .arrayKonversi![
                                                                        i]
                                                                    .satuanKecilId
                                                                    .toString()
                                                                : data
                                                                    .satuanKecilId!,
                                                            _qtyKecilController
                                                                .text,
                                                            data
                                                                .modelListKonversi!
                                                                .data![0]
                                                                .arrayKonversi![
                                                                    i]
                                                                .konversiId
                                                                .toString());
                                                        data.satuanBesarId =
                                                            null;
                                                        data.satuanKecilId =
                                                            null;
                                                        _qtyBesarController
                                                            .clear();
                                                        _qtyKecilController
                                                            .clear();
                                                      },
                                                      child: Text(
                                                        "Save",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        data.postDeleteJenisPembayaran(
                                                            context,
                                                            data
                                                                .modelListKonversi!
                                                                .data![0]
                                                                .arrayKonversi![
                                                                    i]
                                                                .konversiId
                                                                .toString());
                                                        data.satuanBesarId =
                                                            null;
                                                        data.satuanKecilId =
                                                            null;
                                                        _qtyBesarController
                                                            .clear();
                                                        _qtyKecilController
                                                            .clear();
                                                      },
                                                      child: Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        data.satuanBesarId =
                                                            null;
                                                        data.satuanKecilId =
                                                            null;
                                                        _qtyBesarController
                                                            .clear();
                                                        _qtyKecilController
                                                            .clear();
                                                      },
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      )),
                                                ],
                                              ).show(context);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      // Text(
                                                      //     data
                                                      //         .modelListKonversi!
                                                      //         .data![0]
                                                      //         .arrayKonversi![i]
                                                      //         .satuanBesarQty
                                                      //         .toString(),
                                                      //     style: TextStyle(
                                                      //         fontWeight:
                                                      //             FontWeight
                                                      //                 .bold)),
                                                      Text("1",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 13)),
                                                      Text(
                                                        data
                                                            .modelListKonversi!
                                                            .data![0]
                                                            .arrayKonversi![i]
                                                            .namaSatuanBesar!,
                                                        style: TextStyle(
                                                            fontSize: 13),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          data
                                                              .modelListKonversi!
                                                              .data![0]
                                                              .arrayKonversi![i]
                                                              .satuanKecilQty
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 13)),
                                                      Text(
                                                        data
                                                            .modelListKonversi!
                                                            .data![0]
                                                            .arrayKonversi![i]
                                                            .namaSatuanKecil!,
                                                        style: TextStyle(
                                                            fontSize: 13),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                              ),
      ),
    );
  }
}
