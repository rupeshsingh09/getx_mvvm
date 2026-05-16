import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

import '../../models/home/user_list_model.dart';

class HomeRepository {


  final _apiServices = NetworkApiServices();

  Future<UserListModel> userListApi(var data) async {

    // app url vale file m url de diye h esliye yha bs appurl class ko call kr denge
    dynamic response = await _apiServices.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }


}