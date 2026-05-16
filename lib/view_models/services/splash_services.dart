import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:http/http.dart' as userPreference;

import '../controller/user_preference/user_prefrence_view_model.dart';

class SplashServices {

  final UserPreference userPreference = UserPreference();
  void islogin() {
// esme dekhenge ki agr login n hua ho to splash scrren p jayeg age login hua h to next page p jayega.

  
  // use of user preference
    userPreference.getUser().then((value) {
       print(value.token);
       print(value.isLogin);
      if(value.isLogin == false || value.isLogin.toString() == 'null' ){

        Timer(const Duration(seconds: 5),
                () => Get.toNamed(RoutesName.LoginView));
// loginview p jane k liye
      }else {
        Timer(const Duration(seconds: 5),
                () => Get.toNamed(RoutesName.LoginView));
      }
    }
    );
  }
}