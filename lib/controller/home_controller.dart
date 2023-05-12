import 'package:get/get.dart';
import 'package:wallpaper_app/controller/apiopenhelper.dart';
import 'package:wallpaper_app/model/responsemodel.dart';

class HomerController extends GetxController{
final isLoading = false.obs;

  List<Photos> imagelist  = <Photos>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllImages();
  }

  getAllImages() async {
    isLoading.value =true;
    await ApiOperations.getTreandingWallapaper().then((value) {
      isLoading.value =false;

      print("--------------------------");
      imagelist = value!.photos!;
      print(value!.photos!.length);
    });
  }



}

