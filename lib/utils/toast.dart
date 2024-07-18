import 'package:flutter/material.dart';
import 'package:get/get.dart';

void toast(String msg,
    {Color? color,
    String title = 'FIELD REQUIRED',
    int? duration,
    Color textColor = Colors.white,
    SnackPosition? snackPosition}) {
  Get.snackbar(
    '',
    '',
    backgroundColor: color ?? Colors.red[800],
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
    snackStyle: SnackStyle.FLOATING,
    colorText: Colors.white,
    titleText: title.isNotEmpty
        ? Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          )
        : null,
    messageText: Text(
      msg.length > 100 ? 'Server Error. Try again later' : msg,
      textAlign: TextAlign.center,
      style: TextStyle(color: textColor),
    ),
    snackPosition: snackPosition ?? SnackPosition.BOTTOM,
    duration: Duration(seconds: duration ?? 2),
  );
}
