import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_mvvm/res/colors/app_color.dart';

class Utils {
  static void fieldFocusChange(BuildContext context , FocusNode current , FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // use of fluttertoast pacakge

static toastMessage(String message) {
    Fluttertoast.showToast(msg: message,backgroundColor: AppColor.blackColor,
    // message bottom m show krne k liye
    gravity:  ToastGravity.BOTTOM,
    );
}

  static toastMessageCentre(String message) {
    Fluttertoast.showToast(msg: message,backgroundColor: AppColor.blackColor,
      // message centre m show krne k liye
      gravity:  ToastGravity.CENTER,
    );
  }
// snack bar k liye
static snakBar(String title, String message){
    Get.snackbar(title, message);
}

  static void snackBar(String s, String t) {}
}