import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pointofsales/providers/admin/transaction/p_pos.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:provider/provider.dart';

class ProducFavRetail extends StatelessWidget {
  const ProducFavRetail({
    Key? key,
    this.data,
  }) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 155,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 3),
      itemCount: data.modelIndex!.data!.arrayProdukFavorite!.length,
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
                              data.modelIndex!.data!.arrayProdukFavorite![i]
                                  .produkGambarPath! +
                              data.modelIndex!.data!.arrayProdukFavorite![i]
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
                          data.modelIndex!.data!.arrayProdukFavorite![i]
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
                              .format(data.modelIndex!.data!
                                      .arrayProdukFavorite![i].produkHarga ??
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
              (data.modelIndex!.data!.arrayProdukFavorite![i].ranking == null)
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
                              "${data.modelIndex!.data!.arrayProdukFavorite![i].ranking}",
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
                      Provider.of<ProviderPos>(context, listen: false).addCart(
                          produkId: data.modelIndex!.data!
                              .arrayProdukFavorite![i].produkId,
                          productName: data.modelIndex!.data!
                              .arrayProdukFavorite![i].produkNama!,
                          quantity: 1,
                          catatan: "",
                          productPrice: data.modelIndex!.data!
                              .arrayProdukFavorite![i].produkHarga);
                      data.isCartNull = true;
                      data.qtyItems = data.listDataCart.length.toString();
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
                    ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
