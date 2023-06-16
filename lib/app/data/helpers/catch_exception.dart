import 'package:dio/dio.dart';

class CatchException {
  String? message;

  CatchException({this.message});

  static CatchException convertException(dynamic error) {
    if (error is DioException && error.error is CatchException) {
      return error.error as CatchException;
    }
    if (error is DioException) {
      print(error);
      if (error.type == DioExceptionType.connectionTimeout) {
        print('CONNECTION_ERROR');
        return CatchException(
            message: 'Привышено время обработки запроса.\nПовторите позднее');
      } else if (error.type == DioExceptionType.receiveTimeout) {
        print('RECIVE_ERROR');
        return CatchException(
            message: 'Привышено время обработки запроса.\nПовторите позднее');
      } else if (error.response == null) {
        print('NO_INTERNET');
        return CatchException(message: 'Нет интернет соеденения');
      } 
      return CatchException(message: error.response?.data["message"]);
    }
    if (error is CatchException) {
      return error;
    } else {
      return CatchException(message: 'Произошла системаная ошибка');
    }
  }
}
