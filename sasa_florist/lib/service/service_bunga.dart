// // class Service {
// //   static Future<List<dynamic>> getBunga async(){
    
// //   }
// // }
import 'package:dio/dio.dart';
import 'package:sasa_florist/model/bunga.dart';

class Service {
 
  static Future<List<Bunga>> getBunga() async {
    Dio dio = Dio();

    var response = await dio.get(
        'http://192.168.40.1:3000/bunga');
    List<Bunga> bunga = (response.data as List).map((v) => Bunga.fromJson(v)).toList();
    return bunga;
  }

  static Future<List<Bunga>> fetchRecipesBasedLike() async {
    Response response = await Dio()
        .get("http://192.168.40.1:3000/bunga?isFav=true");
    List<Bunga> bunga = (response.data as List).map((v) => Bunga.fromJson(v)).toList();
    return bunga;
  }
}