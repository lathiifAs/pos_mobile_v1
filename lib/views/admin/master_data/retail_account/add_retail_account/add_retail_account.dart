import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_retail_account.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddRetailAccount extends StatefulWidget {
  const AddRetailAccount({Key? key, required this.parentId}) : super(key: key);

  final String parentId;

  @override
  _AddRetailAccountState createState() => _AddRetailAccountState();
}

class _AddRetailAccountState extends State<AddRetailAccount> {
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
    Provider.of<ProviderRetailAccount>(context, listen: false)
        .getDataAdd(context: context, parentId: widget.parentId);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderRetailAccount>(context, listen: false);
      data.tanggalLahir = "";
    });
    super.initState();
  }

  String roleId = "";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Retail Account"),
      ),
      body: Consumer<ProviderRetailAccount>(
        builder: (context, data, _) => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<ProviderRetailAccount>(
                  builder: (context, data, _) => (data.modelDataAdd == null)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : (data.modelDataAdd!.data!.length == 0)
                          ? Container()
                          : (data.modelDataAdd!.data![0].arrayRole!.length == 0)
                              ? DefaultDropdown(
                                  label: "Role *",
                                  selectedItem: "Data is empty!",
                                  onChanged: (value) {},
                                  items: data.modelDataAdd!.data![0].arrayRole!
                                      .map((e) => e.roleNm)
                                      .toList())
                              : DefaultDropdown(
                                  label: "Role *",
                                  selectedItem: "Choose",
                                  onChanged: (value) {
                                    var nama = data
                                        .modelDataAdd!.data![0].arrayRole!
                                        .where((element) =>
                                            element.roleNm == value);
                                    nama.forEach((element) {
                                      roleId = element.roleId.toString();
                                    });
                                  },
                                  items: data.modelDataAdd!.data![0].arrayRole!
                                      .map((e) => e.roleNm)
                                      .toList(),
                                ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                GeneralTextField(
                  label: "Username *",
                  controller: _usernameController,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "Password *",
                  controller: _passwordController,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "Name *",
                  controller: _namaController,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "Email *",
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "No HP *",
                  controller: _noHPController,
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "Address *",
                  controller: _alamatLengkapController,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "Birthday *",
                  controller: _tglLahirController,
                  readOnly: true,
                  onTap: () async {
                    await NDialog(
                      content: Container(
                        width: SizeConfig.screenWidth * 0.8,
                        height: SizeConfig.screenHeight * 0.5,
                        padding: EdgeInsets.only(top: kDefaultPadding),
                        child: SfDateRangePicker(
                          onSelectionChanged: data.getTanggalLahir,
                          maxDate: DateTime.now(),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _tglLahirController.text = data.tanggalLahir!;
                            },
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colors.blue),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel",
                                style: TextStyle(color: Colors.black)))
                      ],
                    ).show(context);
                  },
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "NIK",
                  controller: _noNikController,
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "NPWP",
                  controller: _noNpwpController,
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: DefaultButton(
                    backgroundColor: kButtonColor,
                    buttonText: "Save",
                    onPressed: () {
                      data.postAddRetailAkun(
                          context: context,
                          userName: _usernameController.text,
                          userPass: _passwordController.text,
                          email: _emailController.text,
                          nama: _namaController.text,
                          noHp: _noHPController.text,
                          alamatLengkap: _alamatLengkapController.text,
                          tglLahir: _tglLahirController.text,
                          noNik: _noNikController.text,
                          noNpwp: _noNpwpController.text,
                          inputRoleId: roleId, parentId: widget.parentId);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
