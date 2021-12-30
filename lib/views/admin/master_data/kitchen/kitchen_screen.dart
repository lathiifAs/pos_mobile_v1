import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_kitchen.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class KitchenScreen extends StatefulWidget {
  const KitchenScreen({Key? key}) : super(key: key);

  @override
  _KitchenScreenState createState() => _KitchenScreenState();
}

class _KitchenScreenState extends State<KitchenScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderKitchen>(context, listen: false)
        .getListKitchen(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderKitchen>(context, listen: false)
        .getListKitchen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Master Kitchen"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () async {
          await NDialog(
            dialogStyle: DialogStyle(titleDivider: true),
            title: Text("Kitchen"),
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GeneralTextField(
                      label: "Kitchen Name *",
                      hintText: 'Enter name of kitchen',
                      controller: _nameController,
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    GeneralTextField(
                      label: "Description",
                      hintText: 'Enter description',
                      controller: _descController,
                      maxLines: 3,
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
                        Provider.of<ProviderKitchen>(context, listen: false)
                            .getListKitchen(context);
                        Provider.of<ProviderKitchen>(context, listen: false)
                            .postAddKitchen(context, _nameController.text,
                                _descController.text);
                        _nameController.clear();
                        _descController.clear();
                      }))
            ],
          ).show(context);
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderKitchen>(
        builder: (context, data, _) => (data.modelListKitchen == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelListKitchen!.data == null)
                ? Container()
                : (data.modelListKitchen!.data!.arrayKitchen!.length == 0)
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
                            itemCount: data
                                .modelListKitchen!.data!.arrayKitchen!.length,
                            itemBuilder: (BuildContext context, int i) => Card(
                                  elevation: 0.4,
                                  child: InkWell(
                                    onTap: () async {
                                      _nameController.text = data
                                          .modelListKitchen!
                                          .data!
                                          .arrayKitchen![i]
                                          .kitchenNama!;
                                      _descController.text = data
                                          .modelListKitchen!
                                          .data!
                                          .arrayKitchen![i]
                                          .kitchenDeskripsi!;
                                      await NAlertDialog(
                                        dialogStyle:
                                            DialogStyle(titleDivider: true),
                                        title: Text("Kitchen"),
                                        content: SingleChildScrollView(
                                          child: Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                GeneralTextField(
                                                  label: "Kitchen Name",
                                                  controller: _nameController,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                GeneralTextField(
                                                  label: "Description",
                                                  maxLines: 3,
                                                  controller: _descController,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                data.postEditKitchen(
                                                    context,
                                                    _nameController.text,
                                                    _descController.text,
                                                    data
                                                        .modelListKitchen!
                                                        .data!
                                                        .arrayKitchen![i]
                                                        .kitchenId
                                                        .toString());
                                                _nameController.clear();
                                                _descController.clear();
                                              },
                                              child: Text(
                                                "Save",
                                                style: TextStyle(
                                                    color: Colors.orange),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                data.getListKitchen(context);
                                                data.postDeleteKitchen(
                                                    context,
                                                    data
                                                        .modelListKitchen!
                                                        .data!
                                                        .arrayKitchen![i]
                                                        .kitchenId
                                                        .toString());
                                                _nameController.clear();
                                                _descController.clear();
                                              },
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                _nameController.clear();
                                                _descController.clear();
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
                                        "assets/images/kitchen.png",
                                        width: 25,
                                        height: 25,
                                      ),
                                      title: Text(
                                        data.modelListKitchen!.data!
                                                .arrayKitchen![i].kitchenNama ??
                                            "-",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        data
                                                .modelListKitchen!
                                                .data!
                                                .arrayKitchen![i]
                                                .kitchenDeskripsi ??
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
