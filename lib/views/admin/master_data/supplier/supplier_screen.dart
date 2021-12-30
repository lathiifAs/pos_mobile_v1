import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/providers/admin/p_supplier.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/general_switch.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SupplierScreen extends StatefulWidget {
  const SupplierScreen({Key? key}) : super(key: key);

  @override
  _SupplierScreenState createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();
  TextEditingController _emailCont = TextEditingController();
  TextEditingController _nikNpwpCont = TextEditingController();
  TextEditingController _bankAccountCont = TextEditingController();
  TextEditingController _phoneNumberCont = TextEditingController();
  TextEditingController _bankNameCont = TextEditingController();
  TextEditingController _bankRekCont = TextEditingController();
  TextEditingController _picCont = TextEditingController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    Provider.of<ProviderSupplier>(context, listen: false)
        .getListSupplier(context);
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderSupplier>(context, listen: false)
        .getListSupplier(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Supplier"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () async {
          await NDialog(
            dialogStyle: DialogStyle(titleDivider: true),
            title: Text("Supplier"),
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GeneralTextField(
                      label: "Name *",
                      hintText: 'Enter name',
                      controller: _namaController,
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    GeneralTextField(
                      label: "Address *",
                      hintText: 'Enter address',
                      controller: _alamatController,
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    GeneralTextField(
                      label: "Email *",
                      hintText: 'Enter email',
                      controller: _emailCont,
                      inputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    GeneralTextField(
                      label: "NIK / NPWP *",
                      hintText: 'Enter NIK / NPWP',
                      controller: _nikNpwpCont,
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    GeneralTextField(
                      label: "Phone No. *",
                      hintText: 'Enter phone number',
                      controller: _phoneNumberCont,
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    GeneralTextField(
                      label: "PIC *",
                      hintText: 'Enter PIC',
                      controller: _picCont,
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    GeneralTextField(
                      label: "Bank Name *",
                      hintText: 'Enter Name of Bank',
                      controller: _bankNameCont,
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    GeneralTextField(
                      label: "Bank Account Name *",
                      hintText: 'Enter Bank Account Name',
                      controller: _bankAccountCont,
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    GeneralTextField(
                      label: "Bank Rekening *",
                      hintText: 'Enter Bank Rekening',
                      controller: _bankRekCont,
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    GeneralTextField(
                      label: "Description",
                      hintText: 'Enter description',
                      maxLines: 3,
                      controller: _keteranganController,
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
                        Provider.of<ProviderSupplier>(context, listen: false)
                            .getListSupplier(context);
                        Provider.of<ProviderSupplier>(context, listen: false)
                            .postAddSupplier(
                                context: context,
                                nama: _namaController.text,
                                alamat: _alamatController.text,
                                keterangan: _keteranganController.text,
                                nikNpwp: _nikNpwpCont.text,
                                bankAccount: _bankAccountCont.text,
                                suppHp: _phoneNumberCont.text,
                                pic: _picCont.text,
                                bankRek: _bankRekCont.text,
                                bankName: _bankNameCont.text,
                                suppEmail: _emailCont.text);
                        _namaController.clear();
                        _alamatController.clear();
                        _keteranganController.clear();
                      }))
            ],
          ).show(context);
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProviderSupplier>(
        builder: (context, data, _) => (data.modelListSupplier == null)
            ? Center(child: CircularProgressIndicator())
            : (data.modelListSupplier!.data == null)
                ? Container()
                : (data.modelListSupplier!.data!.arraySupplier!.length == 0)
                    ? SmartRefresher(
                        enablePullDown: true,
                        header: WaterDropHeader(),
                        controller: _refreshController,
                        onRefresh: _onRefresh,
                        child: Center(child: EmptyData()))
                    : SmartRefresher(
                        enablePullDown: true,
                        header: WaterDropHeader(),
                        controller: _refreshController,
                        onRefresh: _onRefresh,
                        child: ListView.builder(
                            padding: EdgeInsets.all(10),
                            itemCount: data
                                .modelListSupplier!.data!.arraySupplier!.length,
                            itemBuilder: (BuildContext context, int i) => Card(
                                  elevation: 0.4,
                                  child: InkWell(
                                    onTap: () async {
                                      data.aktifStatus = (data
                                                  .modelListSupplier!
                                                  .data!
                                                  .arraySupplier![i]
                                                  .aktifSt ==
                                              "1")
                                          ? true
                                          : false;
                                      _namaController.text = data
                                          .modelListSupplier!
                                          .data!
                                          .arraySupplier![i]
                                          .supplierNama!;
                                      _alamatController.text = data
                                          .modelListSupplier!
                                          .data!
                                          .arraySupplier![i]
                                          .supplierAlamat!;
                                      _emailCont.text = data
                                          .modelListSupplier!
                                          .data!
                                          .arraySupplier![i]
                                          .supplierEmail!;
                                      _nikNpwpCont.text = data
                                          .modelListSupplier!
                                          .data!
                                          .arraySupplier![i]
                                          .number
                                          .toString();
                                      _phoneNumberCont.text = data
                                          .modelListSupplier!
                                          .data!
                                          .arraySupplier![i]
                                          .supplierHp!;
                                      _picCont.text = data.modelListSupplier!
                                          .data!.arraySupplier![i].pic!;
                                      _bankAccountCont.text = data
                                          .modelListSupplier!
                                          .data!
                                          .arraySupplier![i]
                                          .bankAccount!;
                                      _bankRekCont.text = data
                                          .modelListSupplier!
                                          .data!
                                          .arraySupplier![i]
                                          .bankRekening!;
                                      _bankNameCont.text = data
                                          .modelListSupplier!
                                          .data!
                                          .arraySupplier![i]
                                          .bankName!;
                                      _keteranganController.text = data
                                          .modelListSupplier!
                                          .data!
                                          .arraySupplier![i]
                                          .supplierKeterangan!;
                                      await NAlertDialog(
                                        dialogStyle:
                                            DialogStyle(titleDivider: true),
                                        title: Text("Supplier"),
                                        content: SingleChildScrollView(
                                          child: Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                GeneralTextField(
                                                  label: "Name",
                                                  controller: _namaController,
                                                ),
                                                const SizedBox(
                                                  height: kDefaultPadding / 2,
                                                ),
                                                GeneralTextField(
                                                  label: "Address",
                                                  controller: _alamatController,
                                                ),
                                                const SizedBox(
                                                  height: kDefaultPadding / 2,
                                                ),
                                                GeneralTextField(
                                                  label: "Email *",
                                                  inputType: TextInputType
                                                      .emailAddress,
                                                  controller: _emailCont,
                                                ),
                                                const SizedBox(
                                                  height: kDefaultPadding / 2,
                                                ),
                                                GeneralTextField(
                                                  label: "NIK / NPWP *",
                                                  inputType:
                                                      TextInputType.number,
                                                  controller: _nikNpwpCont,
                                                ),
                                                const SizedBox(
                                                  height: kDefaultPadding / 2,
                                                ),
                                                GeneralTextField(
                                                  label: "Phone No. *",
                                                  inputType:
                                                      TextInputType.number,
                                                  controller: _phoneNumberCont,
                                                ),
                                                const SizedBox(
                                                  height: kDefaultPadding / 2,
                                                ),
                                                GeneralTextField(
                                                  label: "PIC *",
                                                  controller: _picCont,
                                                ),
                                                const SizedBox(
                                                  height: kDefaultPadding / 2,
                                                ),
                                                GeneralTextField(
                                                  label: "Bank Account *",
                                                  controller: _bankAccountCont,
                                                ),
                                                const SizedBox(
                                                  height: kDefaultPadding / 2,
                                                ),
                                                GeneralTextField(
                                                  label: "Rekening No. *",
                                                  inputType:
                                                      TextInputType.number,
                                                  controller: _bankRekCont,
                                                ),
                                                const SizedBox(
                                                  height: kDefaultPadding / 2,
                                                ),
                                                GeneralTextField(
                                                  label: "Bank Name *",
                                                  controller: _bankNameCont,
                                                ),
                                                const SizedBox(
                                                  height: kDefaultPadding / 2,
                                                ),
                                                GeneralTextField(
                                                  label: "Description",
                                                  maxLines: 3,
                                                  controller:
                                                      _keteranganController,
                                                ),
                                                const SizedBox(
                                                  height: kDefaultPadding / 2,
                                                ),
                                                StatefulBuilder(
                                                  builder: (context,
                                                          setState) =>
                                                      GeneralSwitch(
                                                          label:
                                                              'Active Status',
                                                          value:
                                                              data.aktifStatus,
                                                          onChange: (val) {
                                                            setState(() {
                                                              data.aktifStatus =
                                                                  val;
                                                            });
                                                          }),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                data.getListSupplier(context);
                                                data.postEditSupplier(
                                                    context: context,
                                                    nama: _namaController.text,
                                                    alamat:
                                                        _alamatController.text,
                                                    email: _emailCont.text,
                                                    nikNpwp: _nikNpwpCont.text,
                                                    noHp: _phoneNumberCont.text,
                                                    pic: _picCont.text,
                                                    bankAccount:
                                                        _bankAccountCont.text,
                                                    bankAccountNo:
                                                        _bankRekCont.text,
                                                    bankName:
                                                        _bankNameCont.text,
                                                    keterangan:
                                                        _keteranganController
                                                            .text,
                                                    aktifStatus:
                                                        (data.aktifStatus ==
                                                                true)
                                                            ? '1'
                                                            : '0',
                                                    supplierId: data
                                                        .modelListSupplier!
                                                        .data!
                                                        .arraySupplier![i]
                                                        .supplierId
                                                        .toString());
                                                _namaController.clear();
                                                _alamatController.clear();
                                                _emailCont.clear();
                                                _nikNpwpCont.clear();
                                                _phoneNumberCont.clear();
                                                _picCont.clear();
                                                _bankAccountCont.clear();
                                                _bankRekCont.clear();
                                                _bankNameCont.clear();
                                                _keteranganController.clear();
                                              },
                                              child: Text(
                                                "Save",
                                                style: TextStyle(
                                                    color: Colors.orange),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                data.getListSupplier(context);
                                                data.postDeleteSupplier(
                                                    context,
                                                    data
                                                        .modelListSupplier!
                                                        .data!
                                                        .arraySupplier![i]
                                                        .supplierId
                                                        .toString());
                                                _namaController.clear();
                                                _alamatController.clear();
                                                _emailCont.clear();
                                                _nikNpwpCont.clear();
                                                _phoneNumberCont.clear();
                                                _picCont.clear();
                                                _bankAccountCont.clear();
                                                _bankRekCont.clear();
                                                _bankNameCont.clear();
                                                _keteranganController.clear();
                                              },
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                _namaController.clear();
                                                _alamatController.clear();
                                                _emailCont.clear();
                                                _nikNpwpCont.clear();
                                                _phoneNumberCont.clear();
                                                _picCont.clear();
                                                _bankAccountCont.clear();
                                                _bankRekCont.clear();
                                                _bankNameCont.clear();
                                                _keteranganController.clear();
                                              },
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              )),
                                        ],
                                      ).show(context);
                                    },
                                    child: ListTile(
                                      leading: Image.asset(
                                        "assets/images/suplier.png",
                                        width: 25,
                                        height: 25,
                                      ),
                                      title: Text(
                                        data
                                                .modelListSupplier!
                                                .data!
                                                .arraySupplier![i]
                                                .supplierNama ??
                                            "-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      isThreeLine: true,
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              data
                                                      .modelListSupplier!
                                                      .data!
                                                      .arraySupplier![i]
                                                      .supplierAlamat ??
                                                  "-",
                                              style: TextStyle(fontSize: 13)),
                                          Text(
                                              data
                                                      .modelListSupplier!
                                                      .data!
                                                      .arraySupplier![i]
                                                      .supplierKeterangan ??
                                                  "-",
                                              style: TextStyle(fontSize: 13)),
                                        ],
                                      ),
                                      trailing: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                            color: (data
                                                        .modelListSupplier!
                                                        .data!
                                                        .arraySupplier![i]
                                                        .aktifSt ==
                                                    "1")
                                                ? Colors.green
                                                : Colors.red,
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
      ),
    );
  }
}
