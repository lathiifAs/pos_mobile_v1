import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_jenis_pembayaran.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TypeOfPaymentScreen extends StatefulWidget {
  const TypeOfPaymentScreen({Key? key}) : super(key: key);

  @override
  _TypeOfPaymentScreenState createState() => _TypeOfPaymentScreenState();
}

class _TypeOfPaymentScreenState extends State<TypeOfPaymentScreen> {
  TextEditingController _paymentNameController = TextEditingController();
  TextEditingController _paymentDescController = TextEditingController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderJenisPembayaran>(context, listen: false)
        .getListJenisPembayaran(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderJenisPembayaran>(context, listen: false)
        .getListJenisPembayaran(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Type of Payment"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () async {
          await NDialog(
            dialogStyle: DialogStyle(titleDivider: true),
            title: Text("Type of Payment"),
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GeneralTextField(
                      label: "Payment Name *",
                      controller: _paymentNameController,
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    GeneralTextField(
                      label: "Description",
                      maxLines: 3,
                      controller: _paymentDescController,
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: DefaultButton(
                      backgroundColor: kButtonColor,
                      buttonText: "Save",
                      onPressed: () {
                        Navigator.pop(context);
                        Provider.of<ProviderJenisPembayaran>(context,
                                listen: false)
                            .getListJenisPembayaran(context);
                        Provider.of<ProviderJenisPembayaran>(context,
                                listen: false)
                            .postAddJenisPembayaran(
                                context,
                                _paymentNameController.text,
                                _paymentDescController.text);
                        _paymentNameController.clear();
                        _paymentDescController.clear();
                      }))
            ],
          ).show(context);
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderJenisPembayaran>(
        builder: (context, data, _) => (data.modelListJenisPembayaran == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelListJenisPembayaran!.data!.length == 0)
                ? Container()
                : (data.modelListJenisPembayaran!.data![0].arrayJenisPembayaran!
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
                        child: ListView.builder(
                            padding: EdgeInsets.all(10),
                            itemCount: data.modelListJenisPembayaran!.data![0]
                                .arrayJenisPembayaran!.length,
                            itemBuilder: (BuildContext context, int i) => Card(
                                  elevation: 0.4,
                                  child: InkWell(
                                    onTap: () async {
                                      _paymentNameController.text = data
                                          .modelListJenisPembayaran!
                                          .data![0]
                                          .arrayJenisPembayaran![i]
                                          .jenisPembayaranNama!;
                                      _paymentDescController.text = data
                                          .modelListJenisPembayaran!
                                          .data![0]
                                          .arrayJenisPembayaran![i]
                                          .jenisPembayaranDesc!;
                                      await NAlertDialog(
                                        dialogStyle:
                                            DialogStyle(titleDivider: true),
                                        title: Text("Type of Payment"),
                                        content: SingleChildScrollView(
                                          child: Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                GeneralTextField(
                                                  label: "Payment Name",
                                                  controller:
                                                      _paymentNameController,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                GeneralTextField(
                                                  label: "Description",
                                                  maxLines: 3,
                                                  controller:
                                                      _paymentDescController,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Provider.of<ProviderJenisPembayaran>(
                                                        context,
                                                        listen: false)
                                                    .getListJenisPembayaran(
                                                        context);
                                                Provider.of<ProviderJenisPembayaran>(
                                                        context,
                                                        listen: false)
                                                    .postEditJenisPembayaran(
                                                        context,
                                                        _paymentNameController
                                                            .text,
                                                        _paymentDescController
                                                            .text,
                                                        data
                                                            .modelListJenisPembayaran!
                                                            .data![0]
                                                            .arrayJenisPembayaran![
                                                                i]
                                                            .jenisPembayaranId
                                                            .toString());
                                                _paymentNameController.clear();
                                                _paymentDescController.clear();
                                              },
                                              child: Text(
                                                "Save",
                                                style: TextStyle(
                                                    color: Colors.orange),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Provider.of<ProviderJenisPembayaran>(
                                                        context,
                                                        listen: false)
                                                    .getListJenisPembayaran(
                                                        context);
                                                Provider.of<ProviderJenisPembayaran>(
                                                        context,
                                                        listen: false)
                                                    .postDeleteJenisPembayaran(
                                                        context,
                                                        data
                                                            .modelListJenisPembayaran!
                                                            .data![0]
                                                            .arrayJenisPembayaran![
                                                                i]
                                                            .jenisPembayaranId
                                                            .toString());
                                                _paymentNameController.clear();
                                                _paymentDescController.clear();
                                              },
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                _paymentNameController.clear();
                                                _paymentDescController.clear();
                                              },
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              )),
                                        ],
                                      ).show(context);
                                    },
                                    child: ListTile(
                                      leading: Image.asset(
                                        "assets/images/payment-method.png",
                                        width: 25,
                                        height: 25,
                                      ),
                                      title: Text(
                                          data
                                                  .modelListJenisPembayaran!
                                                  .data![0]
                                                  .arrayJenisPembayaran![i]
                                                  .jenisPembayaranNama ??
                                              "-",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14)),
                                      subtitle: Text(
                                        data
                                                .modelListJenisPembayaran!
                                                .data![0]
                                                .arrayJenisPembayaran![i]
                                                .jenisPembayaranNama ??
                                            "-",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
      ),
    );
  }
}
