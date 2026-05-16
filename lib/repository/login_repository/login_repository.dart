import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class LoginRepository {


  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {

    // app url vale file m url de diye h esliye yha bs appurl class ko call kr denge
    dynamic response = await _apiServices.postApi( data, AppUrl.loginApi);
return response;
  }
}