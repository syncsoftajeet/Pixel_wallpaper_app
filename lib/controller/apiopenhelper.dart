import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/model/responsemodel.dart';

class ApiOperations{

 static Future<ImageResponse?> getTreandingWallapaper() async{

   final response =  await http.get(Uri.parse("https://api.pexels.com/v1/curated"),
    headers: {"Authorization": "563492ad6f917000010000016591eafa15f84fae9ac945292f1471d2"}
    );
   return ImageResponse.fromJson(jsonDecode(response.body));

  }




  static Future<ImageResponse> getSearchWallpaper (String query) async{
   final response = await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
       headers: {"Authorization": "563492ad6f917000010000016591eafa15f84fae9ac945292f1471d2"}
   );
   return ImageResponse.fromJson(jsonDecode(response.body));
  }
}