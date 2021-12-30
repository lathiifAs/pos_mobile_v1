import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/p_product.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/admin/master_data/product/list_product/list_product.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderProduct>(context, listen: false)
        .getListProductGroup(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderProduct>(context, listen: false)
        .getListProductGroup(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kButtonColor,
      //   onPressed: () async {},
      //   child: Icon(Icons.add),
      // ),
      body: Consumer<ProviderProduct>(
        builder: (context, data, _) => (data.modelListProductGroup == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelListProductGroup!.data == null)
                ? Container()
                : (data.modelListProductGroup!.data!.arrayGroupProduk!.length ==
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
                        child: ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: data.modelListProductGroup!.data!
                              .arrayGroupProduk!.length,
                          itemBuilder: (BuildContext context, int i) => Card(
                            elevation: 0.4,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListProduct(
                                            productGroupId: data
                                                .modelListProductGroup!
                                                .data!
                                                .arrayGroupProduk![i]
                                                .produkGroupId
                                                .toString(),
                                            productGroupName: data
                                                .modelListProductGroup!
                                                .data!
                                                .arrayGroupProduk![i]
                                                .produkGroupNama!)));
                              },
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/images/product.png",
                                  width: 25,
                                  height: 25,
                                ),
                                title: Text(
                                  data.modelListProductGroup!.data!
                                          .arrayGroupProduk![i].produkGroupNama ??
                                      "-",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                subtitle: Text(data.modelListProductGroup!.data!
                                        .arrayGroupProduk![i].produkGroupDesc ??
                                    "-", style: TextStyle(fontSize: 13),),
                                trailing: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: (data.modelListProductGroup!.data!
                                                  .arrayGroupProduk![i].aktifSt ==
                                              "1")
                                          ? Colors.green
                                          : Colors.red,
                                      shape: BoxShape.circle),
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
