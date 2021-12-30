import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pointofsales/providers/admin/transaction/p_pos.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/admin/transaction/POS/pos_retail/search_product/search_product.dart';
import 'package:pointofsales/views/components/general_widgets/search_widget.dart';
import 'package:provider/provider.dart';

import 'components/cart_retail.dart';
import 'components/general_product_retail.dart';
import 'components/product_fav_retail.dart';

class PosRetail extends StatefulWidget {
  const PosRetail({Key? key}) : super(key: key);

  @override
  _PosRetailState createState() => _PosRetailState();
}

class _PosRetailState extends State<PosRetail> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderPos>(context, listen: false)
        .getListIndex(context: context);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderPos>(context, listen: false);
      data.isCartClick = false;
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderPos>(context, listen: false);
      data.isAllClick = true;
    });
    super.initState();
  }

  bool isCategoryClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderPos>(
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
                (data.modelIndex == null)
                    ? Container()
                    : (data.modelIndex!.data == null)
                        ? Container()
                        : (data.modelIndex!.data!.arraySalesGroup!.length == 0)
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
                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 6.0,
                                                ),
                                              ],
                                              color: (data.isAllClick == true)
                                                  ? kPrimaryColor
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                  color:
                                                      (data.isAllClick == true)
                                                          ? kPrimaryColor
                                                          : Colors.grey)),
                                          child: InkWell(
                                            onTap: () {
                                              data.getListIndex(context: context);
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
                                          itemCount: data.modelIndex!.data!
                                              .arraySalesGroup!.length,
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
                                                            .modelIndex!
                                                            .data!
                                                            .arraySalesGroup![i]
                                                            .activeColor ==
                                                        false)
                                                    ? Colors.white
                                                    : kPrimaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                    color: (data
                                                                .modelIndex!
                                                                .data!
                                                                .arraySalesGroup![
                                                                    i]
                                                                .activeColor ==
                                                            false)
                                                        ? Colors.grey
                                                        : kPrimaryColor)),
                                            child: InkWell(
                                              onTap: () {
                                                data.isAllClick = false;
                                                data.getActiveColor(i);
                                                data.getCategory(
                                                    context: context,
                                                    i: i,
                                                    salesGroupId: data
                                                        .modelIndex!
                                                        .data!
                                                        .arraySalesGroup![i]
                                                        .salesGroupId
                                                        .toString());
                                              },
                                              child: Center(
                                                child: Text(
                                                  data
                                                      .modelIndex!
                                                      .data!
                                                      .arraySalesGroup![i]
                                                      .salesGroupNama!,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: (data
                                                                  .modelIndex!
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
                (data.modelIndex == null)
                    ? Container()
                    : (data.modelIndex!.data == null)
                        ? Container()
                        : (data.modelIndex!.data!.arrayProdukFavorite!.length ==
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
                (data.modelIndex == null)
                    ? Container()
                    : (data.modelIndex!.data == null)
                        ? Container()
                        : (data.modelIndex!.data!.arrayProdukFavorite!.length ==
                                0)
                            ? Container()
                            : ProducFavRetail(
                                data: data,
                              ),
                (data.modelIndex == null)
                    ? Container()
                    : (data.modelIndex!.data == null)
                        ? Container()
                        : (data.modelIndex!.data!.arrayProduk!.length == 0)
                            ? Container()
                            : Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "General Product",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
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
                            ? Container()
                            : GeneralProductRetail(
                                data: data,

                              ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.3,
                )
              ],
            ),
            (data.isCartNull == false)
                ? Container()
                : CartRetail(
                    data: data,
                  ),
          ],
        ),
      ),
    );
  }
}
