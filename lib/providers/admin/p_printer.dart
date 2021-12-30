import 'dart:convert';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:open_settings/open_settings.dart';
import 'package:pointofsales/providers/admin/transaction/p_pos.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_loading.dart';
import 'package:pointofsales/utils/dialog_question.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/network/base_dio.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:provider/provider.dart';

class ProviderPrinter extends ChangeNotifier
    with BaseDio, WidgetsBindingObserver {
  String? _printerName;
  String? _storeName;
  String? _textFooter;
  String? _textNoted;
  String? _phoneNumber;
  String? _address;
  GetStorage box = GetStorage();
  TextEditingController? conPrinterName = TextEditingController();
  TextEditingController? conPrinterFooter = TextEditingController();
  TextEditingController? conPrinterNoted = TextEditingController();
  TextEditingController? conPrinterPhoneNumber = TextEditingController();
  TextEditingController? conPrinterAddress = TextEditingController();
  TextEditingController? conStoreName = TextEditingController();

  //setting for session printer
  String? get printerName => _printerName;

  set printerName(String? value) {
    _printerName = value;
    box.write('printerName', value);
    notifyListeners();
  }

  String? get textFooter => _textFooter;

  set textFooter(String? value) {
    _textFooter = value;
    box.write('textFooter', value);
    notifyListeners();
  }

  String? get textNoted => _textNoted;

  set textNoted(String? value) {
    _textNoted = value;
    box.write('textNoted', value);
    notifyListeners();
  }

  String? get phoneNumber => _phoneNumber;

  set phoneNumber(String? value) {
    _phoneNumber = value;
    box.write('phoneNumber', value);
    notifyListeners();
  }

  String? get address => _address;

  set address(String? value) {
    _address = value;
    box.write('address', value);
    notifyListeners();
  }

  String? get storeName => _storeName;

  set storeName(String? value) {
    _storeName = value;
    box.write('storeName', value);
    notifyListeners();
  } //setting session for printer

  //lifecylce android
  void onInit() async {
    // print(box.read('textFooter'));
    // await initPrinter();
    // if (connected) connectToPrinter();
    WidgetsBinding.instance!.addObserver(this);
    conPrinterName!.text = box.read('printerName') ?? '';
    conPrinterFooter!.text = box.read('textFooter') ?? '';
    conPrinterNoted!.text = box.read('textNoted') ?? '';
    conPrinterPhoneNumber!.text = box.read('phoneNumber') ?? '';
    conPrinterAddress!.text = box.read('address') ?? '';
    conStoreName!.text = box.read('storeName') ?? '';
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      initPrinter();
      if (connected) {
        checkConnectedPrinter();
      }
    }
  }

  //lifecylce android

  //bluetooh printer coneector

  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
  List<BluetoothDevice> _devicesPrinter = [];
  BluetoothDevice? _device;
  bool _connected = false;

  List<BluetoothDevice> get devicesPrinter => _devicesPrinter;

  set devicesPrinter(List<BluetoothDevice> value) {
    _devicesPrinter = value;
    notifyListeners();
  }

  BluetoothDevice? get device => _device;

  set device(BluetoothDevice? value) {
    _device = value;
    notifyListeners();
  }

  bool get connected => _connected;

  set connected(bool value) {
    _connected = value;
    notifyListeners();
  }

  Future<dynamic> settingBluetooth() async {
    showDialogQuestion(
        title: 'Bluetooth',
        message: 'Buka Settingan Bluetooth anda ?',
        clickYes: () async {
          Get.back();
          OpenSettings.openBluetoothSetting();
        });
  }

  Future<void> initPrinter() async {
    List<BluetoothDevice> devices = [];

    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {}
    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          connected = true;
          print("stat");
          printerName = box.read("printerName");
          showSnackBar(
              snackBarType: SnackBarType.SUCCESS,
              message: 'Berhasil Terkoneksi',
              title: 'Printer');
          break;
        case BlueThermalPrinter.DISCONNECTED:
          connected = false;
          Get.back();
          showSnackBar(
              snackBarType: SnackBarType.ERROR,
              message: 'Bluetooth Disconnect',
              title: 'Printer');

          break;
        case BlueThermalPrinter.STATE_ON:
          initPrinter();

          break;
        case BlueThermalPrinter.STATE_BLE_TURNING_OFF:
          settingBluetooth();
          break;
        case BlueThermalPrinter.ERROR:
          connected = false;
          showSnackBar(
              snackBarType: SnackBarType.ERROR,
              message: 'Connect Bluetooth Error',
              title: 'Printer');
          break;

        default:
          print(state);
          break;
      }
    });

    bluetooth.isOn.then((isON) {
      print(isON);
      if (isON == false) {
        settingBluetooth();
      }
    });

    devicesPrinter = devices;
    notifyListeners();
  }

  Future<void> connectToPrinter() async {
    loadingBuilder(title: 'Connecting..');
    if (device == null) {
      print("errr");
    } else {
      printerName = '';
      connected = false;
      print(connected);
      await bluetooth.isConnected.then((isConnected) async {
        print("status " + isConnected.toString());
        if (isConnected!) {
          connected = false;
          printerName = '';
          await bluetooth.disconnect();

          bluetooth.connect(device!).catchError((error) {
            connected = false;
            printerName = '';
            conPrinterName!.text = box.read('printerName') ?? '';
            print("disni");
            notifyListeners();
            Get.back();
            showSnackBar(
                snackBarType: SnackBarType.ERROR,
                message: 'Connect Bluetooth Error',
                title: 'Printer');
          });
        } else {
          bluetooth.connect(device!).catchError((error) {
            connected = false;
            print(error);
            notifyListeners();
            Get.back();
            // Get.back();
          }).then((value) {
            connected = true;
            print("disnki3");

            Get.back();
            showSnackBar(
                snackBarType: SnackBarType.SUCCESS,
                message: 'Berhasil Terkoneksi',
                title: 'Printer');
            printerName = device!.name;
            conPrinterName!.text = box.read('printerName') ?? '';
            notifyListeners();
          });
        }
      });
    }
  }

  Future<void> disconnectPrinter() async {
    bluetooth.disconnect();
    connected = false;
    printerName = '';
    conPrinterName!.text = box.read('printerName') ?? '';
    notifyListeners();
  }

  Future<bool> checkConnectedPrinter() async {
    GetStorage box = GetStorage();
    await bluetooth.isConnected.then((isConnected) async {
      if (isConnected!) {
        printerName = box.read("printerName");
        connected = true;
        notifyListeners();
      }
    });
    return connected;
  }

  Future<void> testPrint() async {
    loadingBuilder(title: 'Printing...');
    bool testprint = false;
    bluetooth.isConnected.then((isConnected) {
      if (isConnected!) {
        bluetooth.printCustom("Test Printer", 3, 1);
        bluetooth.printNewLine();
        bluetooth.printCustom("Terima Kasih", 2, 1);
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.paperCut();
        testprint = true;
      }

      if (testprint) {
        Get.back();
        showSnackBar(
            snackBarType: SnackBarType.SUCCESS,
            message: 'Printing Berhasil',
            title: 'Printer');
      }
    });
  }

  Future<void> printInvoice(BuildContext context,
      {required int cash,
      required int change,
      required int subTotal,
      required int bill,
      String? paymentMethod,
      DateTime? dateCheckout,
      required List<dynamic> listProduct,
      required int? totalAfterDiscount,
      int discount = 0,
      int percentDiscount = 0,
      int maxDiscountPercent = 0,
      int servicePercent = 0,
      int serviceCash = 0,
      int ppnPercent = 0,
      int ppnCash = 0,
      String? customerName,
      String? table}) async {
    loadingBuilder(title: 'Printing...');
    var kasir = await getNama();
    bool testPrint = false;
    // int cash=int.parse(cart.controllerCash.text
    //     .replaceAll(".", ""));
    // int change=int.parse(cart.controllerChange.text
    //     .replaceAll(".", ""));
    bluetooth.isConnected.then((isConnected) {
      if (isConnected!) {
        bluetooth.printCustom(box.read('storeName') ?? 'Nama Toko', 3, 1);
        bluetooth.printCustom(box.read('address') ?? 'Alamat Toko', 0, 1);
        bluetooth.printCustom(box.read('phoneNumber') ?? 'Nomor telp', 0, 1);
        bluetooth.printNewLine();
        bluetooth.printCustom("Cashier : $kasir", 0, 1);
        bluetooth.printCustom(
            "Date & Time  : ${DateFormat('dd MMMM yyyy H:mm:ss', 'id-ID').format(dateCheckout!)}",
            0,
            1);
        bluetooth.printLeftRight("Customer Name :", customerName ?? "-", 1);
        bluetooth.printLeftRight("Table         :", table ?? "-", 1);
        bluetooth.printNewLine();
        bluetooth.print3Column("Name", "Qty x Price", "Total", 0,
            format: "%-10s %14s %14s %n");
        bluetooth.printCustom('-------------------------------', 3, 0);
        listProduct.forEach((element) {
          bluetooth.print3Column(
              element['produk_nama'],
              element['qty'].toString() +
                  ' x ' +
                  formatCurrency.format(element['harga']),
              formatCurrency.format(element['total_harga']),
              0,
              format: "%-10s %14s %14s %n");
          bluetooth.printCustom(
              element['catatan'] == "" ? ' -' : ' ' + element['catatan'], 0, 0);
        });
        bluetooth.printCustom('================================', 1, 0);
        bluetooth.printLeftRight(
            'Sub Total', formatCurrency.format(subTotal), 1,
            format: "%-10s %20s %n");
        // print(percentDiscount);
        // if(percentDiscount==0) bluetooth.print3Column('Discount',' ','      '+formatCurrency.format(discount),0,format: "%-10s %14s %14s %n");
        if (percentDiscount == 0) {
          // print("disni");
          bluetooth.print3Column(
              'Discount', ' ', '      -' + formatCurrency.format(discount), 0,
              format: "%-10s %10s %14s %n");
        } else {
          if (maxDiscountPercent > 0) {
            bluetooth.print3Column("Discount($percentDiscount%)", ' ',
                '      -' + formatCurrency.format(maxDiscountPercent), 0,
                format: "%-10s %10s %14s %n");
            bluetooth.print3Column(
                "max Discount (-${formatCurrency.format(maxDiscountPercent)})",
                '',
                '',
                0,
                format: "%-10s %10s %8s %n");
            bluetooth.printCustom(" ", 0, 0);
          } else {
            bluetooth.print3Column("Discount($percentDiscount%)", ' ',
                '-' + formatCurrency.format(discount), 0,
                format: "%-10s %10s %14s %n");
          }
        }
        bluetooth.print3Column("Ttl after discount", "",
            formatCurrency.format(totalAfterDiscount), 0);
        bluetooth.print3Column('PPn($ppnPercent%)', ' ',
            '      +' + formatCurrency.format(ppnCash), 0,
            format: "%-10s %14s %14s %n");
        bluetooth.print3Column('Service($servicePercent%)', '',
            '+' + formatCurrency.format(serviceCash), 0,
            format: "%-10s %14s %14s %n");
        bluetooth.printCustom('================================', 1, 0);
        bluetooth.printLeftRight('Bill', formatCurrency.format(bill), 1,
            format: "%-10s %20s %n");
        bluetooth.printNewLine();
        bluetooth.printCustom("Payment Method : $paymentMethod", 0, 0);
        bluetooth.printLeftRight('Cash ', formatCurrency.format(cash), 1,
            format: "%-10s %20s %n");
        bluetooth.printCustom(" ", 0, 0);
        bluetooth.printLeftRight('Change', formatCurrency.format(change), 1,
            format: "%-10s %20s %n");
        bluetooth.printNewLine();
        bluetooth.printCustom(box.read('textFooter') ?? 'Footer Disini', 1, 1);
        bluetooth.printNewLine();
        bluetooth.printCustom('*' + box.read('textNoted'), 0, 0);
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.paperCut();
        testPrint = true;

        Get.back();
        // showSnackBar(
        //     snackBarType: SnackBarType.SUCCESS,
        //     message: 'Printing Berhasil',
        //     title: 'Printer');
      }

      // if (testPrint) {
      //   Get.back();
      //   showSnackBar(
      //       snackBarType: SnackBarType.SUCCESS,
      //       message: 'Printing Berhasil',
      //       title: 'Printer');
      // }
    });
  }

//bluetooth printer connector

}
