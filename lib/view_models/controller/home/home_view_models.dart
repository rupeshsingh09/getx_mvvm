import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class HomeController extends GetxController {

  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;

  void setRxRequestStatus(Status value) =>
      rxRequestStatus.value = value;

  void setUserList(UserListModel value) =>
      userList.value = value;

  void userListApi() {
    setRxRequestStatus(Status.LOADING);

    _api.userListApi(AppUrl.userListApi).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      print(error);
    });
  }
}
