import 'package:baatcheet/ContentScreens/ShortsContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class ShortsScreen extends StatefulWidget {
  @override
  _ShortsScreenState createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Swiper(
                itemBuilder: (BuildContext context,int index){
                  return ShortsContentScreen(index);
                },
                loop: false,
                itemCount: 5,
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shorts',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white),),
                    Icon(Icons.camera_alt_outlined,color: Colors.white,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
