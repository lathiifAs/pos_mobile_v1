import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_unit.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UnitScreen extends StatefulWidget {
  const UnitScreen({Key? key}) : super(key: key);

  @override
  _UnitScreenState createState() => _UnitScreenState();
}

class _UnitScreenState extends State<UnitScreen> {
  TextEditingController _unitNameController = TextEditingController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderUnit>(context, listen: false).getListSatuan(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    Provider.of<ProviderUnit>(context, listen: false).getListSatuan(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UOM"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () async {
          await NDialog(
            dialogStyle: DialogStyle(titleDivider: true),
            title: Text("UOM"),
            content: GeneralTextField(
              label: "UOM Name *",
              controller: _unitNameController,
            ),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: DefaultButton(
                      backgroundColor: kButtonColor,
                      buttonText: "Save",
                      onPressed: () {
                        Navigator.pop(context);
                        Provider.of<ProviderUnit>(context, listen: false)
                            .postAddSatuan(context, _unitNameController.text);
                        Provider.of<ProviderUnit>(context, listen: false)
                            .getListSatuan(context);
                        _unitNameController.clear();
                      }))
            ],
          ).show(context);
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderUnit>(
          builder: (context, data, _) => (data.modelListSatuan == null)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : (data.modelListSatuan!.data!.length == 0)
                  ? Container()
                  : (data.modelListSatuan!.data![0].arraySatuan!.length == 0)
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
                                      mainAxisExtent: kDefaultPadding * 2,
                                      mainAxisSpacing: kDefaultPadding,
                                      crossAxisSpacing: kDefaultPadding,
                                      crossAxisCount: 3),
                              itemCount: data.modelListSatuan!.data![0]
                                  .arraySatuan!.length,
                              itemBuilder: (context, i) => Card(
                                    elevation: 0.4,
                                    child: InkWell(
                                      onTap: () async {
                                        _unitNameController.text = data
                                            .modelListSatuan!
                                            .data![0]
                                            .arraySatuan![i]
                                            .satuanNama!;
                                        await NAlertDialog(
                                          dialogStyle:
                                              DialogStyle(titleDivider: true),
                                          title: Text("UOM"),
                                          content: GeneralTextField(
                                            label: "UOM Name",
                                            controller: _unitNameController,
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Provider.of<ProviderUnit>(
                                                          context,
                                                          listen: false)
                                                      .getListSatuan(context);
                                                  Provider.of<ProviderUnit>(
                                                          context,
                                                          listen: false)
                                                      .postEditSatuan(
                                                          context,
                                                          data
                                                              .modelListSatuan!
                                                              .data![0]
                                                              .arraySatuan![i]
                                                              .satuanId
                                                              .toString(),
                                                          _unitNameController
                                                                  .text);
                                                  _unitNameController.clear();
                                                },
                                                child: Text(
                                                  "Save",
                                                  style: TextStyle(
                                                      color: Colors.orange),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Provider.of<ProviderUnit>(
                                                          context,
                                                          listen: false)
                                                      .getListSatuan(context);
                                                  Provider.of<ProviderUnit>(
                                                          context,
                                                          listen: false)
                                                      .postDeleteSatuan(
                                                          context,
                                                          data
                                                              .modelListSatuan!
                                                              .data![0]
                                                              .arraySatuan![i]
                                                              .satuanId
                                                              .toString());
                                                  _unitNameController.clear();
                                                },
                                                child: Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  _unitNameController.clear();
                                                },
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                )),
                                          ],
                                        ).show(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          data.modelListSatuan?.data?[0]
                                                  .arraySatuan?[i].satuanNama ??
                                              "",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  )),
                        )),
    );
  }
}
