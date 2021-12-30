import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kPrimaryColor = Color(0xFF04764e);
const kButtonColor = Color(0xffef5946);
// const kBackgroundColor = Colors.white;
const kBackgroundColor = Color(0xfff4f8f6);
const colorYellow = Color(0xFFeda436);
const colorBlue = Color(0xFF15A6E9);
const greyColor = Color(0xFFeaeaea);
const blackColor = Color(0xFF010101);

const kDefaultPadding = 20.0;

const blackBoldTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

const blackTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

const blackItalicTextStyle =
    TextStyle(fontSize: 12, fontStyle: FontStyle.italic);

const whiteTextStyle = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w400, color: kBackgroundColor);

const whiteBoldTextStyle = TextStyle(
    fontSize: 14, fontWeight: FontWeight.bold, color: kBackgroundColor);
final formatCurrency =
    new NumberFormat.currency(locale: "id_ID", symbol: "", decimalDigits: 0);
