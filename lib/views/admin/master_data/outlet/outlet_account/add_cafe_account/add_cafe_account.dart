import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_cafe_account.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddCafeAccount extends StatefulWidget {
  const AddCafeAccount({Key? key, required this.parentId}) : super(key: key);

  final String parentId;

  @override
  _AddCafeAccountState createState() => _AddCafeAccountState();
}

class _AddCafeAccountState extends State<AddCafeAccount> {
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
      var data = Provider.of<ProviderCafeAccount>(context, listen: false);
      data.getListRole(context, widget.parentId);
      print(widget.parentId);
      data.kitchenId = "";
      data.groupId = "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Outlet Account"),
      ),
      body: Consumer<ProviderCafeAccount>(
        builder: (context, data, _) => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<ProviderCafeAccount>(
                  builder: (context, data, _) => (data.modelDataAdd == null)
                      ? Center(child: CircularProgressIndicator())
                      : (data.modelDataAdd!.data!.length == 0)
                          ? Container()
                          : (data.modelDataAdd!.data![0].arrayGroup!.length ==
                                  0)
                              ? DefaultDropdown(
                                  label: "Group *",
                                  selectedItem: "Data is empty!",
                                  onChanged: (value) {},
                                  items: data.modelDataAdd!.data![0].arrayGroup!
                                      .map((e) => e.groupNama)
                                      .toList(),
                                )
                              : DefaultDropdown(
                                  label: "Group *",
                                  selectedItem: "Choose",
                                  onChanged: (value) {
                                    var name = data
                                        .modelDataAdd!.data![0].arrayGroup!
                                        .where((element) =>
                                            element.groupNama == value);
                                    name.forEach((element) {
                                      data.groupId = element.groupId.toString();
                                    });
                                  },
                                  items: data.modelDataAdd!.data![0].arrayGroup!
                                      .map((e) => e.groupNama)
                                      .toList(),
                                ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Consumer<ProviderCafeAccount>(
                  builder: (context, data, _) => (data.modelDataAdd == null)
                      ? Container()
                      : (data.modelDataAdd!.data!.length == 0)
                          ? Container()
                          : (data.modelDataAdd!.data![0].arrayKitchen!.length ==
                                  0)
                              ? DefaultDropdown(
                                  label: "Kitchen",
                                  selectedItem: "Data is empty!",
                                  onChanged: (value) {},
                                  items: data
                                      .modelDataAdd!.data![0].arrayKitchen!
                                      .map((e) => e.kitchenNama)
                                      .toList(),
                                )
                              : DefaultDropdown(
                                  label:
                                      "Kitchen (required when selecting Group Kitchen)",
                                  selectedItem: "Choose",
                                  onChanged: (value) {
                                    var name = data
                                        .modelDataAdd!.data![0].arrayKitchen!
                                        .where((element) =>
                                            element.kitchenNama == value);
                                    name.forEach((element) {
                                      data.kitchenId =
                                          element.kitchenId.toString();
                                    });
                                  },
                                  items: data
                                      .modelDataAdd!.data![0].arrayKitchen!
                                      .map((e) => e.kitchenNama)
                                      .toList(),
                                ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                GeneralTextField(
                  label: "Username *",
                  hintText: 'Enter username',
                  controller: _usernameController,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "Password *",
                  hintText: 'Enter password',
                  controller: _passwordController,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "Name *",
                  hintText: 'Enter name',
                  controller: _namaController,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "Email *",
                  hintText: 'Enter email',
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "No HP *",
                  hintText: 'Enter no.HP',
                  controller: _noHPController,
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "Address *",
                  hintText: 'Enter address',
                  controller: _alamatLengkapController,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "Birthday *",
                  hintText: 'Enter birthday',
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
                  hintText: 'Enter NIK',
                  controller: _noNikController,
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                GeneralTextField(
                  label: "NPWP",
                  hintText: 'Enter NPWP',
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
                        data.postAddCafeAccount(
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
                            groupId: data.groupId!,
                            kitchenId: data.kitchenId!,
                            parentId: widget.parentId);
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
