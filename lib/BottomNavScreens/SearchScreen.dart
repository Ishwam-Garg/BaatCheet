import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<String> type = ['igtv','image','image','reels','image','image',
    'image','image','image','image','reels',
    'image','image','image','igtv','image',
    'image','image','image','reels','image',
    'igtv','image','image','reels','image','image',
    'image','image','image','image','reels',
    'image','image','image','igtv','image',
    'image','image','image','reels','image',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: GestureDetector(
          onTap: (){},
          child: Container(
            width: MediaQuery.of(context).size.width*0.9,
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.shade500,
            ),
            child: Row(
              children: [
                Icon(Icons.search_rounded,color: Colors.grey.shade200,),
                SizedBox(width: 10,),
                Text('Search',style: TextStyle(color: Colors.grey.shade300,
                    fontWeight: FontWeight.normal,fontSize: 16),)
              ],
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          Future.delayed(Duration(seconds: 2),(){
            setState(() {

            });
            print('refreshed');
          });
        },
        backgroundColor: Colors.white,
        color: Colors.blue,
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          itemCount: type.length,
          itemBuilder: (context, index) {
            if(type[index] == 'image')
              {
                return Container(
                  color: Colors.green,
                );
              }
            else
              if(type[index] == 'igtv')
                {
                  return Container(
                    color: Colors.red,
                  );
                }
              return Container(
                color: Colors.blue,
              );
          },
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(type[index] == 'igtv' ? 2 : 1, type[index] == 'image' ? 1 : 2);
            }
        ),
      ),
    );
  }

}
