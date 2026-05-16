import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference  {
  //  shared prefernce ka use krke check krenge ki user login h ya nhi


  // ek user model liye h jo ki data pass krenge hm
  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // token le kr shared prefernce me share kr rhe h
    sp.setString('token', responseModel.token.toString());
    sp.setBool('isLogin', responseModel.isLogin!);
    return true;
  }
//  data ko get kr rhe h
  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    bool? isLogin = sp.getBool('isLogin');
    return UserModel(token: token, isLogin: isLogin);
  }

  // if i want ki logout k badd data clear ho jay tb
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
