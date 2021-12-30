import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/settings/p_preferences.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  TextEditingController _prefVal = TextEditingController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderSettings>(context, listen: false).getIndexPref(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderSettings>(context, listen: false).getIndexPref(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferences"),
      ),
      body: Consumer<ProviderSettings>(
        builder: (context, data, _) => (data.modelIndexPref == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelIndexPref!.data!.length == 0)
                ? Container()
                : (data.modelIndexPref!.data![0].arraySatuan!.length == 0)
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
                                .modelIndexPref!.data![0].arraySatuan!.length,
                            itemBuilder: (BuildContext context, int i) => Card(
                                  elevation: 0.4,
                                  child: InkWell(
                                    onTap: () async {
                                      await NAlertDialog(
                                        dialogStyle:
                                            DialogStyle(titleDivider: true),
                                        title: Text("Preferences"),
                                        content: SingleChildScrollView(
                                          child: Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                GeneralTextField(
                                                  label: "Type",
                                                  readOnly: true,
                                                  hintText: data
                                                      .modelIndexPref!
                                                      .data![0]
                                                      .arraySatuan![i]
                                                      .prefNm,
                                                  colorHint: Colors.black,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                GeneralTextField(
                                                  label: "Value *",
                                                  hintText: data
                                                      .modelIndexPref!
                                                      .data![0]
                                                      .arraySatuan![i]
                                                      .prefValue,
                                                  colorHint: Colors.black,
                                                  inputType:
                                                      TextInputType.number,
                                                  onChanged: (val) {
                                                    _prefVal.text = val;
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                data.postPref(
                                                    context: context,
                                                    prefGroup: data
                                                        .modelIndexPref!
                                                        .data![0]
                                                        .arraySatuan![i]
                                                        .prefGroup!,
                                                    prefVal:
                                                        (_prefVal.text == "")
                                                            ? data
                                                                .modelIndexPref!
                                                                .data![0]
                                                                .arraySatuan![i]
                                                                .prefValue!
                                                            : _prefVal.text);
                                                _prefVal.clear();
                                              },
                                              child: Text(
                                                "Save",
                                                style: TextStyle(
                                                    color: Colors.orange),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                _prefVal.clear();
                                              },
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              )),
                                        ],
                                      ).show(context);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.modelIndexPref!.data![0]
                                                    .arraySatuan![i].prefNm ??
                                                "-",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Text(data
                                                      .modelIndexPref!
                                                      .data![0]
                                                      .arraySatuan![i]
                                                      .prefValue ??
                                                  "-"),
                                              Text(" %")
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
