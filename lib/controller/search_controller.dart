import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/controller/apiopenhelper.dart';
import 'package:wallpaper_app/model/responsemodel.dart';



class searchController extends GetxController{

  final isLoading = false.obs;
  TextEditingController textEditingController = TextEditingController();

  List<Photos> searchImagelist  = <Photos>[].obs;


  getSearchResult(String query) async{
    isLoading.value = true;
    await ApiOperations.getSearchWallpaper(query).then((value) {
      searchImagelist = value.photos!;
      isLoading.value = false;

    });

  }


}