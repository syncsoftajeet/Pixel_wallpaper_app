import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/apiopenhelper.dart';
import 'package:wallpaper_app/model/responsemodel.dart';
import 'package:wallpaper_app/screen/fullscreen.dart';
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
  var isLoading = false;

  getSearchResult() async{
    isLoading = true;
    setState(() {
    });
    await ApiOperations.getSearchWallpaper(widget.query).then((value) {
      searchImagelist = value.photos!;
      isLoading = false;
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
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
          child: Column(
            children: [
              CustomSearchBar(),
              SizedBox(
                height: 10,
              ),
              isLoading == true?Container(
                height: 50,
                  width: 50,
                  child: Center(child: CircularProgressIndicator())): GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: searchImagelist.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 23,
                  mainAxisSpacing: 20,
                    childAspectRatio: 2/4, maxCrossAxisExtent: 200
              ), itemBuilder: (context,index){
                return InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FullImageScreen(imageurl: "${searchImagelist![index].src?.portrait}")));
                  },
                  child: Hero(
                    tag: "${searchImagelist![index].src?.portrait}",
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 10,
                            offset: Offset(0,3),
                          )
                        ]
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(height: 800, width: 50,"${searchImagelist[index].src?.portrait}",fit: BoxFit.cover,)),
                    ),
                  ),
                );
              })

            ],
          ),
        ),
      ),
    );
  }
}
