import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_admin_account.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/general_switch.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DetailAdminAccount extends StatefulWidget {
  const DetailAdminAccount({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  _DetailAdminAccountState createState() => _DetailAdminAccountState();
}

class _DetailAdminAccountState extends State<DetailAdminAccount> {
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
      var getDetailAkunAdmin =
          Provider.of<ProviderAdminAccount>(context, listen: false);
      getDetailAkunAdmin.getDetailAkunAdmin(context, widget.userId.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Admin Account"),
      ),
      body: Consumer<ProviderAdminAccount>(
        builder: (context, data, _) => (data.modelDataEditAkunAdmin == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelDataEditAkunAdmin!.data == null)
                ? Container()
                : (data.modelDataEditAkunAdmin!.data!.result == null)
                    ? Container()
                    : SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.all(kDefaultPadding),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GeneralTextField(
                                label: "Username",
                                hintText: data.modelDataEditAkunAdmin!.data!
                                        .result!.userName ??
                                    "-",
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
                                hintText: "Kosongkan jika tidak dirubah",
                                onChanged: (value) {
                                  _passwordController.text = value;
                                },
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              GeneralTextField(
                                label: "Name",
                                hintText: data.modelDataEditAkunAdmin!.data!
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
                                hintText: data.modelDataEditAkunAdmin!.data!
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
                                    .modelDataEditAkunAdmin!.data!.result!.noHp
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
                                hintText: data.modelDataEditAkunAdmin!.data!
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
                                hintText: data.modelDataEditAkunAdmin!.data!
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
                                hintText: data.modelDataEditAkunAdmin!.data!
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
                                hintText: data.modelDataEditAkunAdmin!.data!
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
                                  onChange: (value) {
                                    data.userStatus = value;
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
                                                    data.getListAkunAdmin(
                                                        context);
                                                    data.postDeleteAkunAdmin(
                                                        context: context,
                                                        inputUserId:
                                                            widget.userId);
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
                                                    data.postEditAkunAdmin(
                                                        context,
                                                        (_usernameController.text == "")
                                                            ? data
                                                                .modelDataEditAkunAdmin!
                                                                .data!
                                                                .result!
                                                                .userName
                                                                .toString()
                                                            : _usernameController
                                                                .text,
                                                        (_passwordController.text == "")
                                                            ? ""
                                                            : _passwordController
                                                                .text,
                                                        (_emailController.text == "")
                                                            ? data
                                                                .modelDataEditAkunAdmin!
                                                                .data!
                                                                .result!
                                                                .email
                                                                .toString()
                                                            : _emailController
                                                                .text,
                                                        (_namaController.text == "")
                                                            ? data
                                                                .modelDataEditAkunAdmin!
                                                                .data!
                                                                .result!
                                                                .nama
                                                                .toString()
                                                            : _namaController
                                                                .text,
                                                        (_noHPController.text == "")
                                                            ? data
                                                                .modelDataEditAkunAdmin!
                                                                .data!
                                                                .result!
                                                                .noHp
                                                                .toString()
                                                            : _noHPController
                                                                .text,
                                                        (_alamatLengkapController.text == "")
                                                            ? data
                                                                .modelDataEditAkunAdmin!
                                                                .data!
                                                                .result!
                                                                .alamatLengkap
                                                                .toString()
                                                            : _alamatLengkapController.text,
                                                        (_tglLahirController.text == "") ? data.modelDataEditAkunAdmin!.data!.result!.tglLahirReformat.toString() : _tglLahirController.text,
                                                        (_noNikController.text == "") ? data.modelDataEditAkunAdmin!.data!.result!.noNik.toString() : _noNikController.text,
                                                        (_noNpwpController.text == "") ? data.modelDataEditAkunAdmin!.data!.result!.noNpwp.toString() : _noNpwpController.text,
                                                        (data.userStatus == true) ? "1" : "0",
                                                        widget.userId);
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
