import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/controller/home_controller.dart';
import 'package:wallpaper_app/screen/fullscreen.dart';
import 'package:wallpaper_app/widgets/category_item.dart';
import 'package:wallpaper_app/widgets/custom_search_bar.dart';
import 'package:wallpaper_app/widgets/custom_tollbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


 final HomerController controller = Get.put(HomerController());




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomAppBar(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomSearchBar(),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: 15,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategroyItems();
                    }),
              ),
              SizedBox(
                height: 10,
              ),
             Obx(() => controller.isLoading.value == true?Container(
                 height: size.height/1.5,
                 width: size.width,
                 child: Center(child: CircularProgressIndicator())):
               GridView.builder(
                   physics: BouncingScrollPhysics(),
                   shrinkWrap: true,
                   itemCount: controller.imagelist.length,
                   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                       crossAxisSpacing: 13,
                       mainAxisSpacing: 10,
                       childAspectRatio: 2 / 3.5,
                       maxCrossAxisExtent: 200),
                   itemBuilder: (context, index) {
                     return InkWell(
                         onTap: () {
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => FullImageScreen(
                                       imageurl:
                                       "${controller.imagelist[index].src?.portrait}")));
                         },
                         child: Hero(
                           tag: "${controller.imagelist[index].src?.portrait}",
                           child: Container(
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(12)),
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(12),
                               child: Image.network(
                                 height: 800,
                                 width: 50,
                                 "${controller.imagelist![index].src?.portrait}",
                                 fit: BoxFit.cover,
                               ),
                             ),
                           ),
                         ));
                   }),
             )
            ],
          ),
        ),
      ),
    );
  }
}
