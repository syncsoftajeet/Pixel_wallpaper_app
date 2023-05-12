import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategroyItems extends StatelessWidget {
  const CategroyItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius:BorderRadius.circular(12),
            child: Image.network(
              height:50,
                fit: BoxFit.cover,
                width:100,
                "https://images.pexels.com/photos/3608542/pexels-photo-3608542.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "Cars",style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
