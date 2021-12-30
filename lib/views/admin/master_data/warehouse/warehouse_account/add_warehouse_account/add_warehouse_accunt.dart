import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_warehouse_account.dart';
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

class AddWarehouseAccount extends StatefulWidget {
  const AddWarehouseAccount({Key? key}) : super(key: key);

  @override
  _AddWarehouseAccountState createState() => _AddWarehouseAccountState();
}

class _AddWarehouseAccountState extends State<AddWarehouseAccount> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _alamatLengkapController = TextEditingController();
  TextEditingController _noHPController = TextEditingController();
  TextEditingController _noNikController = TextEditingController();
  TextEditingController _noNpwpController = TextEditingController();
  TextEditingController _tglLahirController = TextEditingController();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderWarehouseAccount>(context, listen: false)
        .getListWarehouseAccount(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderWarehouseAccount>(context, listen: false)
        .getAddAkunGudang(context);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderWarehouseAccount>(context, listen: false);
      data.tanggalLahir = null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Warehouse Account"),
      ),
      body: Consumer<ProviderWarehouseAccount>(
        builder: (context, data, _) => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<ProviderWarehouseAccount>(
                  builder: (context, data, _) => (data.modelListAddGudang ==
                          null)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : (data.modelListAddGudang!.data!.length == 0)
                          ? Container()
                          : (data.modelListAddGudang!.data![0].arrayGudang!
                                      .length ==
                                  0)
                              ? DefaultDropdown(
                                  label: "Role *",
                                  selectedItem: "Data is empty!",
                                  onChanged: (value) {},
                                  items: data
                                      .modelListAddGudang!.data![0].arrayGudang!
                                      .map((e) => e.roleNm)
                                      .toList())
                              : DefaultDropdown(
                                  label: "Role *",
                                  selectedItem: "Choose",
                                  onChanged: (value) {
                                    var roleId = data.modelListAddGudang!
                                        .data![0].arrayGudang!
                                        .where((element) =>
                                            element.roleNm == value);
                                    roleId.forEach((element) {
                                      data.roleId = element.roleId.toString();
                                    });
                                  },
                                  items: data
                                      .modelListAddGudang!.data![0].arrayGudang!
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
                        data.postAddWarehouseAccount(
                            context,
                            _usernameController.text,
                            _passwordController.text,
                            _emailController.text,
                            _namaController.text,
                            _noHPController.text,
                            _alamatLengkapController.text,
                            _tglLahirController.text,
                            _noNikController.text,
                            _noNpwpController.text,
                            data.roleId.toString());
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
