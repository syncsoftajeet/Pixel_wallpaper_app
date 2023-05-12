import 'package:flutter/material.dart';


class FullImageScreen extends StatefulWidget {
   FullImageScreen({Key? key,required this.imageurl,}) : super(key: key);

  String imageurl;

  @override
  State<FullImageScreen> createState() => _FullImageScreenState();
}

class _FullImageScreenState extends State<FullImageScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Hero(
        tag: widget.imageurl,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.network(widget.imageurl,fit: BoxFit.cover,height:MediaQuery.of(context).size.height ,),
        ),
      ),

    );
  }
}
