import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_role.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/ADMIN/master_data/role/detail_role.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({Key? key}) : super(key: key);

  @override
  _RoleScreenState createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  TextEditingController _roleNameController = TextEditingController();
  TextEditingController _roleDescController = TextEditingController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderRole>(context, listen: false).getListRole(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderRole>(context, listen: false).getListRole(context);
    Provider.of<ProviderRole>(context, listen: false).getListRoleAdd(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Master Role"),
      ),
      floatingActionButton: Consumer<ProviderRole>(
        builder: (context, data, _) => FloatingActionButton(
          backgroundColor: kButtonColor,
          onPressed: () async {
            await NDialog(
              dialogStyle: DialogStyle(titleDivider: true),
              title: Text("Master Role"),
              content: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (data.modelListRoleAdd == null)
                          ? CircularProgressIndicator()
                          : (data.modelListRoleAdd!.data == null)
                              ? Container()
                              : (data.modelListRoleAdd!.data![0].arrayGroup!
                                          .length ==
                                      0)
                                  ? DefaultDropdown(
                                      label: "Group *",
                                      selectedItem: "Data is empty!",
                                      onChanged: (value) {},
                                      items: data.modelListRoleAdd!.data![0]
                                          .arrayGroup!
                                          .map((e) => e.groupNama)
                                          .toList())
                                  : DefaultDropdown(
                                      label: "Group *",
                                      selectedItem: "Choose",
                                      onChanged: (value) {
                                        var groupId = data.modelListRoleAdd!
                                            .data![0].arrayGroup!
                                            .where((element) =>
                                                element.groupNama == value);
                                        groupId.forEach((element) {
                                          data.groupId = element.groupId;
                                        });
                                      },
                                      items: data.modelListRoleAdd!.data![0]
                                          .arrayGroup!
                                          .map((e) => e.groupNama)
                                          .toList()),
                      SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      (data.modelListRoleAdd == null)
                          ? CircularProgressIndicator()
                          : (data.modelListRoleAdd!.data == null)
                              ? Container()
                              : (data.modelListRoleAdd!.data![0].arrayRole!
                                          .length ==
                                      0)
                                  ? DefaultDropdown(
                                      label: "Parent Role",
                                      selectedItem: "Data is empty!",
                                      onChanged: (value) {},
                                      items: data
                                          .modelListRoleAdd!.data![0].arrayRole!
                                          .map((e) => e.roleNm)
                                          .toList())
                                  : DefaultDropdown(
                                      label: "Parent Role",
                                      selectedItem: "Choose",
                                      onChanged: (value) {
                                        var roleId = data.modelListRoleAdd!
                                            .data![0].arrayRole!
                                            .where((element) =>
                                                element.roleNm == value);
                                        roleId.forEach((element) {
                                          data.roleId =
                                              element.roleId.toString();
                                        });
                                      },
                                      items: data
                                          .modelListRoleAdd!.data![0].arrayRole!
                                          .map((e) => e.roleNm)
                                          .toList()),
                      SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      GeneralTextField(
                        label: "Role Name *",
                        controller: _roleNameController,
                      ),
                      SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      GeneralTextField(
                        label: "Description",
                        maxLines: 3,
                        controller: _roleDescController,
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
                          data.getListRole(context);
                          data.postAddMasterRole(
                              context,
                              data.groupId.toString(),
                              data.roleId.toString(),
                              _roleNameController.text,
                              _roleDescController.text);
                          data.groupId = null;
                          data.roleId = null;
                          _roleNameController.clear();
                          _roleDescController.clear();
                        }))
              ],
            ).show(context);
          },
          child: Icon(Icons.add),
        ),
      ),
      body: Consumer<ProviderRole>(
        builder: (context, data, _) => (data.modelListRole == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelListRole!.data!.length == 0)
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
                        padding:
                            EdgeInsets.all(10),
                        itemCount: data.modelListRole!.data!.length,
                        itemBuilder: (BuildContext context, int i) => Card(
                              elevation: 0.4,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailRoleScreen(
                                                    dataRoleId: data
                                                        .modelListRole!
                                                        .data![i]
                                                        .roleId
                                                        .toString())));
                                  },
                                  child: ListTile(
                                    leading: Image.asset(
                                      "assets/images/role.png",
                                      width: 25,
                                      height: 25,
                                    ),
                                    title: Text(
                                      data.modelListRole!.data![i].roleNm ??
                                          "-",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    subtitle: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${data.modelListRole!.data![i].groupNama}",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Text(
                                          (data.modelListRole!.data![i]
                                                      .parentName ==
                                                  "")
                                              ? ""
                                              : " - ",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Expanded(
                                          child: Text(
                                            data.modelListRole!.data![i]
                                                .parentName
                                                .toString(),
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                          color: (data.modelListRole!.data![i]
                                                      .aktifSt ==
                                                  "1")
                                              ? Colors.green
                                              : Colors.red,
                                          shape: BoxShape.circle),
                                    ),
                                  )),
                            )),
                  ),
      ),
    );
  }
}
