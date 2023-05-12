import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/apiopenhelper.dart';
import 'package:wallpaper_app/model/responsemodel.dart';
import 'package:wallpaper_app/widgets/category_item.dart';
import 'package:wallpaper_app/widgets/custom_search_bar.dart';
import 'package:wallpaper_app/widgets/custom_tollbar.dart';


class SearchScreen extends StatefulWidget {

   SearchScreen({Key? key,required this.query}) : super(key: key);

   String query;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Photos> searchImagelist = [];

  getSearchResult() async{
    await ApiOperations.getSearchWallpaper(widget.query).then((value) {
      searchImagelist = value.photos!;
      setState(() {

      });
   });

  }

  @override
  void initState() {
    super.initState();
    getSearchResult();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomAppBar(),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
          child: Column(
            children: [
              CustomSearchBar(),
              SizedBox(
                height: 10,
              ),


              SizedBox(
                height: MediaQuery.of(context).size.height*1,
                child: GridView.builder(
                    itemCount: searchImagelist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 300
                ), itemBuilder: (context,index){
                  return Container(
                    height: 800,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(height: 800, width: 50,"${searchImagelist[index].src?.portrait}",fit: BoxFit.cover,)),
                  );
                }),
              )

            ],
          ),
        ),
      ),
    );
  }
}
