import 'package:flutter/material.dart';

final snackbarReceiveTimeout = SnackBar(

  content: Row(
    children: [
      Icon(
        Icons.warning,
        color: Colors.white,
      ),
      SizedBox(
        width: 15,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "RECEIVED TIMEOUT",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Cobalah beberapa saat lagi..")
        ],
      ),
    ],
  ),
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.red,
  action: SnackBarAction(
    label: "OK",
    onPressed: () {},
  ),
);

final snackbarSendTimout = SnackBar(
  content: Row(
    children: [
      Icon(
        Icons.warning,
        color: Colors.white,
      ),
      SizedBox(
        width: 15,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SEND TIMEOUT",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Cobalah beberapa saat lagi")
        ],
      ),
    ],
  ),
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.red,
  action: SnackBarAction(
    label: "OK",
    onPressed: () {},
  ),
);

final snackbarOther = SnackBar(
  content: Row(
    children: [
      Icon(
        Icons.warning,
        color: Colors.white,
      ),
      SizedBox(
        width: 15,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SERVER SIBUK",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Cobalah beberapa saat lagi")
        ],
      ),
    ],
  ),
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.red,
  action: SnackBarAction(
    label: "OK",
    onPressed: () {},
  ),
);

final snackbarConnectTimeout = SnackBar(
  content: Row(
    children: [
      Icon(
        Icons.warning,
        color: Colors.white,
      ),
      SizedBox(
        width: 15,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "CONNECT TIMEOUT",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Cobalah beberapa saat lagi")
        ],
      ),
    ],
  ),
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.red,
  action: SnackBarAction(
    label: "OK",
    onPressed: () {},
  ),
);
