import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_warehouse_account.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_switch.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DetailWarehouseAccount extends StatefulWidget {
  const DetailWarehouseAccount(
      {Key? key, required this.inputUserId, required this.inputRoleId})
      : super(key: key);

  final String inputUserId;
  final String inputRoleId;

  @override
  _DetailWarehouseAccountState createState() => _DetailWarehouseAccountState();
}

class _DetailWarehouseAccountState extends State<DetailWarehouseAccount> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderWarehouseAccount>(context, listen: false);
      data.getDetailAkunGudang(context, widget.inputUserId, widget.inputRoleId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Warehouse Account"),
      ),
      body: Consumer<ProviderWarehouseAccount>(
        builder: (context, data, _) => (data.modelDataEditWarehouse == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelDataEditWarehouse!.data == null)
                ? Container()
                : (data.modelDataEditWarehouse!.data!.result == null)
                    ? Container()
                    : SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.all(kDefaultPadding),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DefaultDropdown(
                                  label: "Role",
                                  selectedItem: data.modelDataEditWarehouse!
                                      .data!.result!.roleNm!,
                                  onChanged: (value) {
                                    var roleId = data.modelDataEditWarehouse!
                                        .data!.arrayGudang!
                                        .where((element) =>
                                            element.roleNm == value);
                                    roleId.forEach((element) {
                                      data.roleId = element.roleId.toString();
                                    });
                                  },
                                  items: data.modelDataEditWarehouse!.data!
                                      .arrayGudang!
                                      .map((e) => e.roleNm)
                                      .toList()),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "Username",
                                colorHint: Colors.black,
                                controller: data.usernameController,
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "Password",
                                hintText: "Kosongkan jika tidak diubah",
                                controller: data.passwordController,
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "Name",
                                controller: data.namaController,
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "Email",
                                inputType: TextInputType.emailAddress,
                                controller: data.emailController,
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "No HP",
                                inputType: TextInputType.number,
                                controller: data.noHPController,
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "Address",
                                controller: data.alamatLengkapController,
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "Birthday",
                                readOnly: true,
                                hintText: data.tanggalLahir,
                                colorHint: Colors.black,
                                onTap: () async {
                                  await NDialog(
                                    content: Container(
                                      width: SizeConfig.screenWidth * 0.8,
                                      height: SizeConfig.screenHeight * 0.5,
                                      padding:
                                          EdgeInsets.only(top: kDefaultPadding),
                                      child: SfDateRangePicker(
                                        onSelectionChanged:
                                            data.getTanggalLahir,
                                        maxDate: DateTime.now(),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "OK",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel",
                                              style: TextStyle(
                                                  color: Colors.black)))
                                    ],
                                  ).show(context);
                                },
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "NIK",
                                inputType: TextInputType.number,
                                controller: data.noNikController,
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "NPWP",
                                inputType: TextInputType.number,
                                controller: data.noNpwpController,
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralSwitch(
                                  label: 'Active Status',
                                  value: data.userStatus,
                                  onChange: (val) {
                                    data.userStatus = val;
                                  }),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                            title: const Text("Delete"),
                                            content: Text(
                                                "are you sure you want to delete?"),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    data.getListWarehouseAccount(
                                                        context);
                                                    data.postDeleteAkunGudang(
                                                        context: context,
                                                        inputUserId:
                                                            widget.inputUserId);
                                                  },
                                                  child: const Text(
                                                    "Ya",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  )),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
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
                                            title: const Text("Save"),
                                            content: const Text(
                                                "are you sure you want to edit?"),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    data.postEditAkunGudang(
                                                        context,
                                                        data.usernameController
                                                            .text,
                                                        data.passwordController
                                                            .text,
                                                        data.emailController
                                                            .text,
                                                        data.namaController
                                                            .text,
                                                        data.noHPController
                                                            .text,
                                                        data.alamatLengkapController
                                                            .text,
                                                        data.tanggalLahir!,
                                                        data.noNikController
                                                            .text,
                                                        data.noNpwpController
                                                            .text,
                                                        (data.userStatus ==
                                                                true)
                                                            ? "1"
                                                            : "0",
                                                        widget.inputRoleId,
                                                        widget.inputUserId);
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
