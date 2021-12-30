import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pointofsales/providers/admin/p_printer.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/views/components/bottom_dialog_device_printer.dart';
import 'package:pointofsales/views/components/general_widgets/text_field_printer.dart';
import 'package:provider/provider.dart';

class PrinterSettingsScreen extends StatefulWidget {
  const PrinterSettingsScreen({Key? key}) : super(key: key);

  @override
  _PrinterSettingsScreenState createState() => _PrinterSettingsScreenState();
}

class _PrinterSettingsScreenState extends State<PrinterSettingsScreen> {
  @override
  void initState() {
    Provider.of<ProviderPrinter>(context, listen: false).onInit();
    Provider.of<ProviderPrinter>(context, listen: false).initPrinter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Printer Setting"),
      ),
      body: Consumer<ProviderPrinter>(
        builder: (c, data, _) {
          return MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const Text(
                    "Printer Name",
                    style: blackBoldTextStyle,
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.only(top: 3),
                    child: TextField(
                      controller: data.conPrinterName,
                      readOnly: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Printer 003",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () => showBottomSheetDevicePrinter(),
                              style: TextButton.styleFrom(
                                  backgroundColor: greyColor,
                                  primary: blackColor),
                              child: Text(
                                "Atur",
                              ),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldPrinter(
                      controller: data.conStoreName,
                      onChange: (v) {
                        data.storeName = v;
                      },
                      title: "Nama Toko",
                      hint: "Masukan Nama Toko",
                      noted: "Misal: Toko Retail Jaya Abadi"),
                  TextFieldPrinter(
                      controller: data.conPrinterFooter,
                      onChange: (v) {
                        data.textFooter = v;
                      },
                      title: "Footer",
                      hint: "Terima Kasih Sudah berlanja Di Toko Kami",
                      noted:
                          " Masukan Catatan Dibawah seperti Ucapan Terima kasih..",
                      maxLines: 3),
                  TextFieldPrinter(
                      controller: data.conPrinterNoted,
                      onChange: (v) {
                        data.textNoted = v;
                      },
                      title: "Catatan",
                      hint: "Kasih Catatan Pada Struk",
                      noted: " Misal: Selamat Menikmati",
                      maxLines: 3),
                  TextFieldPrinter(
                      textInputType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      controller: data.conPrinterPhoneNumber,
                      onChange: (v) {
                        data.phoneNumber = v;
                      },
                      title: "Phone Number",
                      hint: "Kasih Catatan Pada Struk",
                      noted: "Masukan Nomor Telp Toko"),
                  TextFieldPrinter(
                      controller: data.conPrinterAddress,
                      onChange: (v) {
                        data.address = v;
                      },
                      title: "Alamat Toko",
                      hint: "Masukan Alamat Toko",
                      noted: "Misal: Jalan Raya Panguyuban No 55")
                ],
              ));
        },
      ),
    );
  }

  Future showBottomSheetDevicePrinter() {
    return Get.bottomSheet(BottomDialogDevicePrinter(),
        isScrollControlled: true, elevation: 3);
  }
}
