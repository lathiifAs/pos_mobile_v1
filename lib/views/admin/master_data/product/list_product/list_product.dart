import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pointofsales/providers/admin/p_product.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/currency_formatters.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/admin/master_data/product/add_bahan_baku/add_bahan_baku.dart';
import 'package:pointofsales/views/admin/master_data/product/add_hasil_produksi/add_hasil_produksi.dart';
import 'package:pointofsales/views/admin/master_data/product/add_siap_jual/add_siap_jual.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListProduct extends StatefulWidget {
  const ListProduct(
      {Key? key, required this.productGroupId, required this.productGroupName})
      : super(key: key);

  final String productGroupId;
  final String productGroupName;

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderProduct>(context, listen: false);
      data.getListProduct(context, widget.productGroupId);
    });
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderProduct>(context, listen: false);
      data.getListProduct(context, widget.productGroupId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productGroupName),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "addProduct",
        backgroundColor: kButtonColor,
        onPressed: () {
          if (widget.productGroupId == "1") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddBahanBaku(productGroupId: widget.productGroupId)));
          } else if (widget.productGroupId == "2") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddHasilProduksi(
                        productGroupId: widget.productGroupId)));
          } else if (widget.productGroupId == "3") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddSiapJual()));
          }
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderProduct>(
        builder: (context, data, _) => (data.modelListProduct == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelListProduct!.data == null)
                ? Container()
                : (data.modelListProduct!.data!.arrayProduk!.length == 0)
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
                          padding: EdgeInsets.all(20),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 175,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  crossAxisCount: 2),
                          itemCount:
                              data.modelListProduct!.data!.arrayProduk!.length,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  BaseUrl.imageUrl +
                                                      data
                                                          .modelListProduct!
                                                          .data!
                                                          .arrayProduk![i]
                                                          .produkGambarPath! +
                                                      data
                                                          .modelListProduct!
                                                          .data!
                                                          .arrayProduk![i]
                                                          .produkGambarNama!)),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              data.modelListProduct!.data!
                                                  .arrayProduk![i].produkNama!,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            // Text(
                                            //   data.modelListProduct!.data!
                                            //       .arrayProduk![i].produkGroupNama!,
                                            //   maxLines: 1,
                                            //   overflow: TextOverflow.ellipsis,
                                            //   style: TextStyle(fontSize: 10),
                                            // ),
                                            Text(
                                              "Stock : ${data.modelListProduct!.data!.arrayProduk![i].stok}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            Text(
                                              NumberFormat.currency(
                                                      locale: 'id',
                                                      decimalDigits: 0,
                                                      symbol: 'Rp ')
                                                  .format(data
                                                          .modelListProduct!
                                                          .data!
                                                          .arrayProduk![i]
                                                          .produkHarga ??
                                                      0),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  (data.modelListProduct!.data!.arrayProduk![i]
                                              .ranking ==
                                          null)
                                      ? Container()
                                      : Positioned(
                                          right: 0,
                                          bottom: 65,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2, horizontal: 6),
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 3.0,
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 15,
                                                ),
                                                Text(
                                                  "${data.modelListProduct!.data!.arrayProduk![i].ranking}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13),
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
      ),
    );
  }
}
