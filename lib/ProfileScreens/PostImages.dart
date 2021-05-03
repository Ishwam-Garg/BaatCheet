import 'package:flutter/material.dart';

class PostImages extends StatefulWidget {
  @override
  _PostImagesState createState() => _PostImagesState();
}

class _PostImagesState extends State<PostImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1.5,
                mainAxisSpacing: 1.5,
              ),
              itemCount: 20,
              itemBuilder: (context,index){
              if(index%4==0){
                return Container(
                  height: 200,
                  color: Colors.red,
                  child: Center(child: Text(index.toString(),style: TextStyle(color: Colors.white),),),
                );
              }
              else
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                  child: Center(child: Text(index.toString(),style: TextStyle(color: Colors.white),),),
                );
              },
          )
        ],
      ),
    );
  }
}
