import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/p_auth.dart';
import 'package:pointofsales/providers/apps/p_app.dart';
import 'package:pointofsales/providers/apps/p_firebase.dart';
import 'package:pointofsales/providers/dapur/p_dapur.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/utils/general_button.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DapurScreen extends StatefulWidget {
  const DapurScreen({Key? key}) : super(key: key);

  @override
  State<DapurScreen> createState() => _DapurScreenState();
}

class _DapurScreenState extends State<DapurScreen> {
  FirebaseMessaging? firebaseMessaging;

  @override
  void initState() {
    // TODO: implement initState
    firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage((message) =>
        Provider.of<ProviderFirebase>(context, listen: false)
            .firebaseMessagingBackgroundHandler(message));
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      if (value != null) {
        print(value);
      }
    });

    Provider.of<ProviderFirebase>(context, listen: false).firebaseOnMessage();

    firebaseMessaging!.getToken().then((value) {
      print('--------- Token : $value');
      Provider.of<ProviderDapur>(context, listen: false)
          .postTokenFirebase(context: context, tokenDevice: '$value');
    });
    Provider.of<ProviderDapur>(context, listen: false).getIndexWaiters(context);

    super.initState();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderDapur>(context, listen: false).getIndexWaiters(context);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitchen'),
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
      body: Consumer<ProviderDapur>(
          builder: (context, data, _) => (data.modelListPesanan == null)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : (data.modelListPesanan!.data == null)
                  ? Container()
                  : (data.modelListPesanan!.data!.result!.length == 0)
                      ? SmartRefresher(
                          enablePullDown: true,
                          header: WaterDropMaterialHeader(),
                          controller: _refreshController,
                          onRefresh: _onRefresh,
                          child: EmptyData())
                      : SmartRefresher(
                          enablePullDown: true,
                          header: WaterDropMaterialHeader(),
                          controller: _refreshController,
                          onRefresh: _onRefresh,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              padding: EdgeInsets.all(10),
                              itemCount:
                                  data.modelListPesanan!.data!.result!.length,
                              itemBuilder: (c, i) => Card(
                                    elevation: 0.4,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '- ${data.modelListPesanan!.data!.result![i].produkNama}' +
                                                        ' ' +
                                                        '(${data.modelListPesanan!.data!.result![i].jmlBeli})',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Notes : ',
                                                        style: TextStyle(
                                                            fontSize: 13),
                                                      ),
                                                      Text(
                                                        (data
                                                                    .modelListPesanan!
                                                                    .data!
                                                                    .result![i]
                                                                    .catatan! ==
                                                                "")
                                                            ? '-'
                                                            : data
                                                                .modelListPesanan!
                                                                .data!
                                                                .result![i]
                                                                .catatan!,
                                                        style: TextStyle(
                                                            fontSize: 13),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Transaksi id : ' +
                                                      '${data.modelListPesanan!.data!.result![i].detailTransaksiId}',
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                ),
                                                // ElevatedButton(
                                                //     onPressed: () {},
                                                //     child: Text('Done'))
                                                TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Done',
                                                      style: TextStyle(
                                                          color: kPrimaryColor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )))),
    );
  }
}
