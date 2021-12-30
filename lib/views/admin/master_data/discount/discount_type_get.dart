import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pointofsales/providers/admin/p_discount.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/admin/master_data/discount/add_discount_get/add_discount_get_screen.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DiscountTypeGet extends StatefulWidget {
  const DiscountTypeGet({Key? key}) : super(key: key);

  @override
  _DiscountTypeGetState createState() => _DiscountTypeGetState();
}

class _DiscountTypeGetState extends State<DiscountTypeGet> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderDiscount>(context, listen: false)
        .getListDiscountGet(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderDiscount>(context, listen: false)
        .getListDiscountGet(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String currentDate = DateFormat('yyyyMMdd').format(now);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddDiscountGet()));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderDiscount>(
        builder: (context, data, _) => (data.modelListDiscountGet == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelListDiscountGet!.data!.length == 0)
                ? Container()
                : (data.modelListDiscountGet!.data![0].arrayDiskon!.length == 0)
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
                        child: ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: data.modelListDiscountGet!.data![0]
                              .arrayDiskon!.length,
                          itemBuilder: (BuildContext context, int i) => Card(
                            elevation: 0.4,
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             DetailDiscountScreen(
                                //                 discountId: data
                                //                     .modelListDiscount!
                                //                     .data![0]
                                //                     .arrayDiskon![i]
                                //                     .diskonId
                                //                     .toString())));
                              },
                              child: Container(
                                width: double.infinity,
                                height: 84,
                                margin: EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding,
                                    vertical: kDefaultPadding / 2),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    BaseUrl.imageUrl +
                                                        data
                                                            .modelListDiscountGet!
                                                            .data![0]
                                                            .arrayDiskon![i]
                                                            .diskonPath! +
                                                        data
                                                            .modelListDiscountGet!
                                                            .data![0]
                                                            .arrayDiskon![i]
                                                            .diskonFile!)),
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
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data
                                                      .modelListDiscountGet!
                                                      .data![0]
                                                      .arrayDiskon![i]
                                                      .diskonNama
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  data
                                                      .modelListDiscountGet!
                                                      .data![0]
                                                      .arrayDiskon![i]
                                                      .diskonDesc
                                                      .toString(),
                                                  style:
                                                  TextStyle(fontSize: 12),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Min. Purchase : ",
                                                      style:
                                                          TextStyle(fontSize: 12),
                                                    ),
                                                    Text(
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              decimalDigits: 0,
                                                              symbol: 'Rp ')
                                                          .format(data
                                                              .modelListDiscountGet!
                                                              .data![0]
                                                              .arrayDiskon![i]
                                                              .diskonSyaratJmlPembelian),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600, fontSize: 12),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  data
                                                      .modelListDiscountGet!
                                                      .data![0]
                                                      .arrayDiskon![i]
                                                      .tglMulaiReformat
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 11),
                                                ),
                                                Text(
                                                  " - ",
                                                  style: TextStyle(fontSize: 11),
                                                ),
                                                Text(
                                                  data
                                                      .modelListDiscountGet!
                                                      .data![0]
                                                      .arrayDiskon![i]
                                                      .tglExpReformat!,
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 11),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                          color: (int.parse(data
                                                      .modelListDiscountGet!
                                                      .data![0]
                                                      .arrayDiskon![i]
                                                      .diskonTanggalExpReformat!) <
                                                  int.parse(currentDate)
                                              ? Colors.red
                                              : Colors.green),
                                          shape: BoxShape.circle),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
      ),
    );
  }
}
