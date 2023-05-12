import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/apiopenhelper.dart';
import 'package:wallpaper_app/model/responsemodel.dart';
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
  List<Photos>? imagelist = [];

  @override
  void initState() {
    super.initState();

    getAllImages();
  }

  getAllImages() async {
    await ApiOperations.getTreandingWallapaper().then((value) {
      print("--------------------------");
      imagelist = value?.photos;
      setState(() {});
      print(value!.photos!.length);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              Container(
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: imagelist!.length,
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
                                            "${imagelist![index].src?.portrait}")));
                          },
                          child: Hero(
                            tag: "${imagelist![index].src?.portrait}",
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  height: 800,
                                  width: 50,
                                  "${imagelist![index].src?.portrait}",
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
