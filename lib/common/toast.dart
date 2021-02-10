import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(message,context){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 14
  );
}