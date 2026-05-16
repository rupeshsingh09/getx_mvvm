

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/res/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';

import '../../../models/login/login_response_model.dart';


class LoginViewModel  extends GetxController{

  // login repository ko yha call kr rhe h
  final _api = LoginRepository();

  // user preference k liye
UserPreference userPreference = UserPreference();

  // yha contoleer bnaye h kyuki controller ko call krenge loginview m
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;


  // login api function bnayenge jo kam krega ki kisi v error ko show krne k liye

void loginApi(){
  loading.value = true;
  Map data = {
    'email' : emailController.value.text,
  'password' : passwordController.value.text
  };
  _api.loginApi(data).then(( dynamic value){
    loading.value = false;
    if(value['error'] == 'user not found'){
      Utils.snackBar('Login', value['error']);

    } else {
      UserModel userModel = UserModel(
        token: value['token'],
        isLogin: true
      );
      // use of user preference 
      userPreference.saveUser(userModel).then((value) {
        // netx page p ajne k liye
        Get.toNamed(RoutesName.homeView);
      }).onError((error, stacktrace){

      });
    Utils.snackBar('Login', 'Login successfuly');}
  }).onError((error, stackTrace){
    print(error.toString());
  loading.value = false;
    Utils.snackBar('Error', error.toString());
  });
  }
}
