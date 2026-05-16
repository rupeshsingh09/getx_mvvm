// appexception nam se class bnye h jo ki implement krega exception ko
class AppExceptions implements Exception {
  // 2  parameter liye h
  final _message ;
  final _prefix;

  AppExceptions([this._message , this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }
}
// internet se exception aaayega to yha se handle hoga
class InternetException extends AppExceptions{
// koi message aaayega to show krega but agr internet nh rhega to no internet show kr dega
// no internet jo msg likha usko n likhenge tb v empty de skte h  , but apna khud se kus msg de denge jb es class ko call krenge ui m to.
  InternetException([String? message]) : super(message, 'No internet') ;
}

class RequestTimeOut extends AppExceptions{
// agr sever se response late se aayega to eeske help se show krega ki time out ho gya
  RequestTimeOut([String? message]) : super(message, 'Request TimeOut') ;
}

class ServerException extends AppExceptions{
// agr server error rhega to eske help se show krega
  ServerException([String? message]) : super(message, 'Internal server error') ;
}

class InvalidUrlException extends AppExceptions{
// agr invalid url rhega to eske help se show krega
  InvalidUrlException([String? message]) : super(message, 'InvalidUrl') ;
}

class FetchDataException extends AppExceptions{
// agr data fetch krne m dikkht  rhega to eske help se show krega
  FetchDataException([String? message]) : super(message, 'Error while communication') ;
}

