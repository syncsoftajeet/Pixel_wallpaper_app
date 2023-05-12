import 'package:flutter/material.dart';
import 'package:wallpaper_app/screen/search.dart';

class CustomSearchBar extends StatelessWidget {
   CustomSearchBar({Key? key}) : super(key: key);

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        border: Border.all(color: Colors.black38)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10 ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                autofocus: false,
                enableSuggestions: false,
                controller: textEditingController,
                style: TextStyle(
                  fontSize: 15
                ),
                decoration: InputDecoration(
                  hintText: "Search Wallpaper.....",
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),

              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(query: textEditingController.text)));
              },
              child:  Icon(Icons.search),
            ),
            

          ],
        ),
      ),
    );
  }
}
