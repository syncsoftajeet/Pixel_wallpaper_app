import 'package:flutter/material.dart';
import 'package:wallpaper_app/widgets/category_item.dart';
import 'package:wallpaper_app/widgets/custom_search_bar.dart';
import 'package:wallpaper_app/widgets/custom_tollbar.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
             
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                      child: Image.network("https://images.pexels.com/photos/5894024/pexels-photo-5894024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",height: 150,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,)),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Category ",style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 13,
                        ),),
                        Text("Mountain ",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18,
                        ),),
                      ],
                    ),
                  )
                ],
              ),
              
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height*1,
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        child: Image.network(height: 800, width: 50,"https://images.pexels.com/photos/1974520/pexels-photo-1974520.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",fit: BoxFit.cover,)),
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
