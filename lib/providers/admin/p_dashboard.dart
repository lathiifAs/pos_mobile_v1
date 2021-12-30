import 'package:flutter/material.dart';

class ProviderDashboardAdmin extends ChangeNotifier {
  bool _isDrawerMasterDataShow = false;
  bool _isDrawerTransaction = false;
  bool _isDrawerSettings = false;
  bool _isDrawerReporting = false;
  bool _isDrawerOutlet = false;
  bool _isDrawerProduct = false;
  bool _isDrawerUOM = false;
  bool _isDrawerWarehouse = false;

  bool get isDrawerMasterDataShow => _isDrawerMasterDataShow;

  set isDrawerMasterDataShow(bool value) {
    _isDrawerMasterDataShow = value;
    notifyListeners();
  }

  bool get isDrawerTransaction => _isDrawerTransaction;

  set isDrawerTransaction(bool value) {
    _isDrawerTransaction = value;
    notifyListeners();
  }

  bool get isDrawerReporting => _isDrawerReporting;

  set isDrawerReporting(bool value) {
    _isDrawerReporting = value;
    notifyListeners();
  }

  bool get isDrawerSettings => _isDrawerSettings;

  set isDrawerSettings(bool value) {
    _isDrawerSettings = value;
    notifyListeners();
  }

  bool get isDrawerOutlet => _isDrawerOutlet;

  set isDrawerOutlet(bool value) {
    _isDrawerOutlet = value;
    notifyListeners();
  }

  bool get isDrawerProduct => _isDrawerProduct;

  set isDrawerProduct(bool value) {
    _isDrawerProduct = value;
    notifyListeners();
  }

  bool get isDrawerUOM => _isDrawerUOM;

  set isDrawerUOM(bool value) {
    _isDrawerUOM = value;
    notifyListeners();
  }

  bool get isDrawerWarehouse => _isDrawerWarehouse;

  set isDrawerWarehouse(bool value) {
    _isDrawerWarehouse = value;
    notifyListeners();
  }
}
