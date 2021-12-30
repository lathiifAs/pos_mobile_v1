import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pointofsales/utils/base_url.dart';
import 'package:pointofsales/utils/dialog_question.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/network/base_dio.dart';
import 'package:pointofsales/utils/sharedprefs.dart';
import 'package:pointofsales/utils/snackbars.dart';
import 'package:pointofsales/views/ADMIN/main/main_screen.dart';
import 'package:pointofsales/views/components/login/login_screen.dart';
import 'package:pointofsales/views/dapur/dapur_screen.dart';
import 'package:pointofsales/views/waiters/index_screen.dart';
import 'package:pointofsales/views/waiters/waiters_screen.dart';

class ProviderAuth extends ChangeNotifier with BaseDio {
  bool _isVisible = false;
  String _namaWaiters = "";

  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  Future<void> userSession(BuildContext context) async {
    if (await getUserId() == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    } else {
      if (await getGroupId() == "1") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
            (route) => false);
      }
      if (await getGroupId() == "6") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => IndexScreen()),
            (route) => false);
      }
      if (await getGroupId() == "7") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DapurScreen()),
            (route) => false);
      }
    }
  }

  Future<void> postLogin(
      BuildContext context, String email, String password) async {
    ProgressDialog pg = ProgressDialog(context,
        title: Text("Login"),
        message: Text("Please wait.."),
        dismissable: false,
        blur: 3,
        dialogStyle: DialogStyle(borderRadius: BorderRadius.circular(15)));
    pg.show();

    response = await dio.post(BaseUrl.loginUrl,
        data: {'user_name': email, 'user_pass': password});

    try {
      if (response!.data['notif_st'] == true) {
        pg.dismiss();
        setUserId(response!.data['data_login']['user_id']);
        setRoleId(response!.data['data_login']['role_id']);
        setToken(response!.data['data_login']['token']);
        setTokenKey(response!.data['data_login']['token_key']);
        setGroupId(response!.data['data_login']['group_id']);
        setNama(response!.data['data_login']['nama']);
        namaWaiters = response!.data['data_login']['nama'];

        if (response!.data['data_login']['group_id'] == "1") {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
              (route) => false);
        }
        if (response!.data['data_login']['group_id'] == "6") {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => IndexScreen()),
              (route) => false);
        }
        if (response!.data['data_login']['group_id'] == "7") {
          setParentId(response!.data['data_login']['parent_id']);
          setKitchenId(response!.data['data_login']['kitchen_id']);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => DapurScreen()),
              (route) => false);
        }
      } else {
        pg.dismiss();
        showSnackBar(
            snackBarType: SnackBarType.ERROR,
            title: "Error",
            message: response!.data['notif_msg']);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        ScaffoldMessenger.of(context).showSnackBar(snackbarConnectTimeout);
      } else if (e.type == DioErrorType.receiveTimeout) {
        ScaffoldMessenger.of(context).showSnackBar(snackbarReceiveTimeout);
      } else if (e.type == DioErrorType.sendTimeout) {
        ScaffoldMessenger.of(context).showSnackBar(snackbarSendTimout);
      }
    }
  }

  void logout() {
    showDialogQuestion(
        title: 'Logout',
        message: 'Are you sure want to logout ?',
        clickYes: () {
          Get.offAll(LoginScreen());
          removeUserId();
          removeRoleId();
          removeToken();
          removeTokenKey();
          removeGroupId();
          removeParentId();
          removeKitchenId();
          removeNama();
        });
  }

  String get namaWaiters => _namaWaiters;

  set namaWaiters(String value) {
    _namaWaiters = value;
    notifyListeners();
  }
}
