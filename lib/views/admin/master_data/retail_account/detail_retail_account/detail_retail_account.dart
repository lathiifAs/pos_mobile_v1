import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_retail_account.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/general_switch.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DetailRetailAccount extends StatefulWidget {
  const DetailRetailAccount(
      {Key? key, required this.inputUserId, required this.parentId})
      : super(key: key);

  final String inputUserId;
  final String parentId;

  @override
  _DetailRetailAccountState createState() => _DetailRetailAccountState();
}

class _DetailRetailAccountState extends State<DetailRetailAccount> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _alamatLengkapController = TextEditingController();
  TextEditingController _noHPController = TextEditingController();
  TextEditingController _noNikController = TextEditingController();
  TextEditingController _noNpwpController = TextEditingController();
  TextEditingController _tglLahirController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderRetailAccount>(context, listen: false);
      data.getDetailRetailAkun(
          context: context, inputUserId: widget.inputUserId);
      data.getDataAdd(context: context, parentId: widget.parentId);
    });
    super.initState();
  }

  String roleId = "";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Warehouse Account"),
      ),
      body: Consumer<ProviderRetailAccount>(
        builder: (context, data, _) => (data.modelDetailRetailAkun == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelDetailRetailAkun!.data == null)
                ? Container()
                : (data.modelDetailRetailAkun!.data!.result == null)
                    ? Container()
                    : SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.all(kDefaultPadding),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Consumer<ProviderRetailAccount>(
                                builder: (context, data, _) =>
                                    (data.modelDataAdd == null)
                                        ? CircularProgressIndicator()
                                        : (data.modelDataAdd!.data == null)
                                            ? Container()
                                            : (data.modelDataAdd!.data![0]
                                                        .arrayRole!.length ==
                                                    0)
                                                ? Container()
                                                : DefaultDropdown(
                                                    label: "Role",
                                                    selectedItem: data
                                                        .modelDetailRetailAkun!
                                                        .data!
                                                        .result!
                                                        .roleNm!,
                                                    onChanged: (value) {
                                                      var name = data
                                                          .modelDataAdd!
                                                          .data![0]
                                                          .arrayRole!
                                                          .where((element) =>
                                                              element.roleNm ==
                                                              value);
                                                      name.forEach((element) {
                                                        roleId = element.roleId
                                                            .toString();
                                                      });
                                                    },
                                                    items: data.modelDataAdd!
                                                        .data![0].arrayRole!
                                                        .map((e) => e.roleNm)
                                                        .toList(),
                                                  ),
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "Username",
                                hintText: data.modelDetailRetailAkun!.data!
                                        .result!.userName ??
                                    "",
                                colorHint: Colors.black,
                                onChanged: (value) {
                                  _usernameController.text = value;
                                },
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "Password",
                                hintText: "Kosongkan jika tidak diubah",
                                onChanged: (value) {
                                  _passwordController.text = value;
                                },
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "Name",
                                hintText: data.modelDetailRetailAkun!.data!
                                        .result!.nama ??
                                    "",
                                colorHint: Colors.black,
                                onChanged: (value) {
                                  _namaController.text = value;
                                },
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "Email",
                                inputType: TextInputType.emailAddress,
                                hintText: data.modelDetailRetailAkun!.data!
                                        .result!.email ??
                                    "",
                                colorHint: Colors.black,
                                onChanged: (value) {
                                  _emailController.text = value;
                                },
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "No HP",
                                inputType: TextInputType.number,
                                hintText: data
                                    .modelDetailRetailAkun!.data!.result!.noHp
                                    .toString(),
                                colorHint: Colors.black,
                                onChanged: (value) {
                                  _noHPController.text = value;
                                },
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "Address",
                                hintText: data.modelDetailRetailAkun!.data!
                                        .result!.alamatLengkap ??
                                    "",
                                colorHint: Colors.black,
                                onChanged: (value) {
                                  _alamatLengkapController.text = value;
                                },
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "Birthday",
                                controller: _tglLahirController,
                                readOnly: true,
                                hintText: data.modelDetailRetailAkun!.data!
                                    .result!.tglLahirReformat,
                                colorHint: Colors.black,
                                onChanged: (value) {
                                  _tglLahirController.text = value;
                                },
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
                                            _tglLahirController.text =
                                                data.tanggalLahir!;
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
                                hintText: data.modelDetailRetailAkun!.data!
                                        .result!.noNik ??
                                    "",
                                colorHint: Colors.black,
                                onChanged: (value) {
                                  _noNikController.text = value;
                                },
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "NPWP",
                                inputType: TextInputType.number,
                                hintText: data.modelDetailRetailAkun!.data!
                                        .result!.noNpwp ??
                                    "",
                                colorHint: Colors.black,
                                onChanged: (value) {
                                  _noNpwpController.text = value;
                                },
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
                                            title: Text("Delete"),
                                            content: Text(
                                                "are you sure you want to delete?"),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    data.postDeleteRetailAccount(
                                                        context: context,
                                                        inputUserId:
                                                            widget.inputUserId,
                                                        parentId:
                                                            widget.parentId);
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
                                                    data.postEditRetailAkun(
                                                        context: context,
                                                        userName: (_usernameController.text == "")
                                                            ? data
                                                                .modelDetailRetailAkun!
                                                                .data!
                                                                .result!
                                                                .userName!
                                                            : _usernameController
                                                                .text,
                                                        userPass:
                                                            _usernameController
                                                                .text,
                                                        email: (_emailController.text == "")
                                                            ? data
                                                                .modelDetailRetailAkun!
                                                                .data!
                                                                .result!
                                                                .email!
                                                            : _emailController
                                                                .text,
                                                        nama: (_namaController.text == "")
                                                            ? data
                                                                .modelDetailRetailAkun!
                                                                .data!
                                                                .result!
                                                                .nama!
                                                            : _namaController
                                                                .text,
                                                        noHp: (_noHPController.text == "")
                                                            ? data
                                                                .modelDetailRetailAkun!
                                                                .data!
                                                                .result!
                                                                .noHp!
                                                            : _noHPController.text,
                                                        alamatLengkap: (_alamatLengkapController.text == "") ? data.modelDetailRetailAkun!.data!.result!.alamatLengkap! : _alamatLengkapController.text,
                                                        tglLahir: (_tglLahirController.text == "") ? data.modelDetailRetailAkun!.data!.result!.tglLahirReformat! : _tglLahirController.text,
                                                        nik: (_noNikController.text == "") ? data.modelDetailRetailAkun!.data!.result!.noNik! : _noNikController.text,
                                                        npwp: (_noNpwpController.text == "") ? data.modelDetailRetailAkun!.data!.result!.noNpwp! : _noNpwpController.text,
                                                        inputUserId: widget.inputUserId,
                                                        userSt: (data.userStatus == true) ? "1" : "0");
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
