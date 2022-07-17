
import 'package:dio/dio.dart';

class DioHelper{
static Dio dio;
   static init(){

     dio=Dio(BaseOptions(
         baseUrl: 'https://api.themoviedb.org/3/',
     receiveDataWhenStatusError: true
     ));
   }

   static Future<Response> get(
       String url
       )async{

     return await dio.get(url );
   }
}