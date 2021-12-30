import 'dart:ui';

import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_role.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/ADMIN/master_data/role/role_screen.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';

class DetailRoleScreen extends StatefulWidget {
  const DetailRoleScreen({Key? key, required this.dataRoleId})
      : super(key: key);

  final dataRoleId;

  @override
  _DetailRoleScreenState createState() => _DetailRoleScreenState();
}

class _DetailRoleScreenState extends State<DetailRoleScreen> {
  TextEditingController _roleNameController = TextEditingController();
  TextEditingController _roleDescController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderRole>(context, listen: false).getListRoleAdd(context);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var getDataEditRole = Provider.of<ProviderRole>(context, listen: false);
      getDataEditRole.getDataEditRole(context, widget.dataRoleId);
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var groupId = Provider.of<ProviderRole>(context, listen: false);
      groupId.groupId = null;
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var roleId = Provider.of<ProviderRole>(context, listen: false);
      roleId.roleId = null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Master Role"),
      ),
      body: Consumer<ProviderRole>(
        builder: (context, data, _) => (data.modelDataEditRole == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelDataEditRole!.data == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          (data.modelDataEditRole == null)
                              ? CircularProgressIndicator()
                              : (data.modelDataEditRole!.data == null)
                                  ? DefaultDropdown(
                                      label: "Group",
                                      selectedItem: "Data is empty!",
                                      onChanged: (value) {},
                                      items: data.modelListRoleAdd!.data![0]
                                          .arrayGroup!
                                          .map((e) => e.groupNama)
                                          .toList())
                                  : DefaultDropdown(
                                      label: "Group",
                                      selectedItem: data
                                          .modelDataEditRole!.data!.groupNama!,
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
                          (data.modelDataEditRole == null)
                              ? CircularProgressIndicator()
                              : (data.modelDataEditRole!.data == null)
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
                                      selectedItem: data.modelDataEditRole!
                                              .data!.parentName ??
                                          "-",
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
                            controller: _roleNameController,
                            hintText:
                                data.modelDataEditRole!.data!.roleNm ?? "-",
                            colorHint: Colors.black,
                            label: "Role Name",
                            onChanged: (value) {
                              _roleNameController.text = value;
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          GeneralTextField(
                            controller: _roleDescController,
                            hintText:
                                data.modelDataEditRole!.data!.roleDesc ?? "-",
                            colorHint: Colors.black,
                            label: "Description",
                            maxLines: 3,
                            onChanged: (value) {
                              _roleDescController.text = value;
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: SizeConfig.screenWidth * 0.42,
                                child: DefaultButton(
                                    backgroundColor: Colors.red,
                                    buttonText: "Delete",
                                    onPressed: () async {
                                      await NAlertDialog(
                                        dialogStyle:
                                            DialogStyle(titleDivider: true),
                                        title: Text("Delete"),
                                        content: Text(
                                            "are you sure you want to delete?"),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                data.postDeleteRole(
                                                    context: context,
                                                    dataRoleId:
                                                        widget.dataRoleId);
                                              },
                                              child: Text(
                                                "Ya",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              )),
                                        ],
                                      ).show(context);
                                    }),
                              ),
                              Container(
                                width: SizeConfig.screenWidth * 0.42,
                                child: DefaultButton(
                                    backgroundColor: kButtonColor,
                                    buttonText: "Save",
                                    onPressed: () async {
                                      await NAlertDialog(
                                        dialogStyle:
                                            DialogStyle(titleDivider: true),
                                        title: Text("Save"),
                                        content: Text(
                                            "are you sure you want to edit?"),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                String parentId = (data
                                                            .modelDataEditRole!
                                                            .data!
                                                            .parentId ==
                                                        null)
                                                    ? ""
                                                    : data.modelDataEditRole!
                                                        .data!.parentId
                                                        .toString();
                                                data.postEditMasterRole(
                                                    context: context,
                                                    groupId: (data.groupId == null)
                                                        ? data.modelDataEditRole!
                                                            .data!.groupId
                                                            .toString()
                                                        : data.groupId
                                                            .toString(),
                                                    parentId: (data.roleId ==
                                                            null)
                                                        ? parentId
                                                        : data.roleId
                                                            .toString(),
                                                    roleName: (_roleNameController.text == "")
                                                        ? data
                                                            .modelDataEditRole!
                                                            .data!
                                                            .roleNm
                                                            .toString()
                                                        : _roleNameController
                                                            .text,
                                                    roleDesc: (_roleDescController
                                                                .text ==
                                                            "")
                                                        ? data
                                                            .modelDataEditRole!
                                                            .data!
                                                            .roleDesc
                                                            .toString()
                                                        : _roleDescController
                                                            .text,
                                                    dataRoleId: widget.dataRoleId);
                                              },
                                              child: Text(
                                                "Ya",
                                                style: TextStyle(
                                                    color: Colors.orange),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              )),
                                        ],
                                      ).show(context);
                                    }),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
