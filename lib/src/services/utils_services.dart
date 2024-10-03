import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UtilsServices {
  //R$ valor
  String pricetoCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  //Data formatada
  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_br').add_Hm();
    return dateFormat.format(dateTime);
  }

  void showToast({required String message, bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2, // Definido para 1 segundo
      backgroundColor: isError
          ? Colors.red
          : Colors.white, // Usei um tom de cinza claro em vez de branco puro
      textColor: isError ? Colors.white : Colors.black,
      fontSize: 14,
    );
  }
}
