import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_cafe_account.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/general_switch.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DetailCafeAccount extends StatefulWidget {
  const DetailCafeAccount(
      {Key? key, required this.userId, required this.parentId})
      : super(key: key);

  final String userId;
  final String parentId;

  @override
  _DetailCafeAccountState createState() => _DetailCafeAccountState();
}

class _DetailCafeAccountState extends State<DetailCafeAccount> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderCafeAccount>(context, listen: false);
      data.getDataEditAkunCafe(context, widget.userId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Account"),
      ),
      body: Consumer<ProviderCafeAccount>(
        builder: (context, data, _) => (data.modelDataEditAkunCafe == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (data.modelDataEditAkunCafe!.data!.result == null)
                ? Container()
                : SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GeneralTextField(
                            label: "Username",
                            controller: data.usernameController,
                          ),
                          const SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          GeneralTextField(
                            label: "Password",
                            hintText: "Kosongkan jika tidak dirubah",
                            controller: data.passwordController,
                          ),
                          const SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          GeneralTextField(
                            label: "Name",
                            controller: data.namaController,
                          ),
                          const SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          GeneralTextField(
                            label: "Email",
                            controller: data.emailController,
                            inputType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          GeneralTextField(
                            label: "No HP",
                            controller: data.noHPController,
                            inputType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          GeneralTextField(
                            label: "Address",
                            controller: data.alamatLengkapController,
                          ),
                          const SizedBox(
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
                                    onSelectionChanged: data.getTanggalLahir,
                                    maxDate: DateTime.now(),
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(color: Colors.blue),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel",
                                          style:
                                              TextStyle(color: Colors.black)))
                                ],
                              ).show(context);
                            },
                          ),
                          const SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          GeneralTextField(
                            label: "NIK",
                            controller: data.noNikController,
                            inputType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          GeneralTextField(
                            label: "NPWP",
                            controller: data.noNpwpController,
                            inputType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          GeneralSwitch(
                              label: 'Active Status',
                              value: data.userStatus,
                              onChange: (val) {
                                data.userStatus = val;
                              }),
                          const SizedBox(
                            height: kDefaultPadding / 2,
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
                                        title: const Text("Delete"),
                                        content: const Text(
                                            "are you sure you want to delete?"),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                data.postDeleteAkunCafe(
                                                    context: context,
                                                    inputUserId: widget.userId,
                                                    parentId: widget.parentId);
                                                Navigator.pop(context);
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
                                                data.postEditAkunCafe(
                                                    context,
                                                    data.usernameController
                                                        .text,
                                                    data.passwordController
                                                        .text,
                                                    data.emailController.text,
                                                    data.namaController.text,
                                                    data.noHPController.text,
                                                    data.alamatLengkapController
                                                        .text,
                                                    data.tanggalLahir!,
                                                    data.noNikController.text,
                                                    data.noNpwpController.text,
                                                    (data.userStatus == true)
                                                        ? "1"
                                                        : "0",
                                                    widget.userId);
                                              },
                                              child: const Text(
                                                "Ya",
                                                style: TextStyle(
                                                    color: Colors.orange),
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
