// // ignore: import_of_legacy_library_into_null_safe
//
//
// abstract class NetworkInfo {
//   Future<bool> get isConnected;
// }
//
// class NetworkInfoImpl implements NetworkInfo {
//   final DataConnectionChecker connectionChecker;
//
//   NetworkInfoImpl(this.connectionChecker);
//
//   @override
//   Future<bool> get isConnected => connectionChecker.hasConnection;
// }