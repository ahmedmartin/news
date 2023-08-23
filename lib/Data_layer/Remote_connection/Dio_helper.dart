import 'package:dio/dio.dart';
class DioHelper{

  static Dio ?dio ;


  static init(){
    
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/v1/',
        receiveDataWhenStatusError: true,

      ) ,
    ) ;

  }

  static Future<Response?> getData({
    required String url,
  }) async
  {
    return await dio?.get(
      url,
    );
  }

}