abstract class BaseApiServices {

  // getapi k liye
  Future<dynamic> getApi(String url) ;

  // postapi ke liye
  Future<dynamic> postApi(dynamic data, String url) ;


}