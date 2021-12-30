import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_admin_account.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/ADMIN/master_data/admin_account/admin_account_screen.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddAdminAccountScreen extends StatefulWidget {
  const AddAdminAccountScreen({Key? key}) : super(key: key);

  @override
  _AddAdminAccountScreenState createState() => _AddAdminAccountScreenState();
}

class _AddAdminAccountScreenState extends State<AddAdminAccountScreen> {
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
      var tglLahir = Provider.of<ProviderAdminAccount>(context, listen: false);
      tglLahir.tanggalLahir = null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Admin Account"),
      ),
      body: Consumer<ProviderAdminAccount>(
        builder: (context, data, _) => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                        data.postAddAdminAccount(
                            context,
                            _usernameController.text,
                            _passwordController.text,
                            _emailController.text,
                            _namaController.text,
                            _noHPController.text,
                            _alamatLengkapController.text,
                            _tglLahirController.text,
                            _noNikController.text,
                            _noNpwpController.text);
                        Navigator.pop(context);
                        data.getListAkunAdmin(context);
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
