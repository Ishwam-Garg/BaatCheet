import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  bool isMessages = true;
  bool _isBookMarked = false;
  bool _isLiked = false;
  double LikeSize = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){},
          child: Icon(Icons.add_box_rounded,size: 32,),
        ),
        actions: [
          InkWell(
            onTap: (){},
            customBorder: CircleBorder(),
            child: Center(
              child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 10,
                            left: 20,
                            child: Icon(Icons.message_rounded),
                          ),
                          isMessages == true ? Positioned(
                            top: 5,
                            right: 0,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xffE3242B),
                              child: Text('1',style: TextStyle(color: Colors.white,fontSize: 12),),
                            ),
                          ) : Container(),
                        ],
                      ),
                    ),
                  ),
            ),

          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          backgroundColor: Colors.blue.shade700,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //stories Box
              Padding(
                padding: EdgeInsets.only(left: 10,top: 10,right: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  child: Row(
                    children: [
                      //user story box
                      Container(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 49,
                              backgroundColor: Colors.purple,
                              child: CircleAvatar(
                                radius: 47,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.grey,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: 13,
                                          backgroundColor: Colors.blue.shade600,
                                          child: Text('+',style: TextStyle(fontSize: 16,color: Colors.white),),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text('Your Story',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Row(
                        children: List.generate(10, (index) => StoryTile()),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: List.generate(10, (index){
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        //user details container
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.purple,
                                      child: CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Colors.white,
                                        //backgroundImage: NetworkImage(''),
                                        child: CircleAvatar(
                                          radius: 25,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5,),
                                        Text('User Name',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                                        SizedBox(height: 10,),
                                        Text('tagged location',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    customBorder: CircleBorder(),
                                    onTap: (){},
                                    child: Icon(Icons.more_vert,size: 28,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        GestureDetector(
                          onDoubleTap: (){
                            setState(() {
                              _isLiked = !_isLiked;
                            });
                            AnimateHeart();
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height*0.5,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  //image: DecorationImage(image: NetworkImage(''),fit: BoxFit.fill),
                                ),
                              ),
                              _isLiked ? (LikeSize == 0 ? Container() : Icon(Icons.favorite,size: LikeSize,color: Colors.white,))
                                  : Container(),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: InkWell(
                                      customBorder: CircleBorder(),
                                      //hoverColor: Colors.green,
                                      onTap: (){
                                        setState(() {
                                          _isLiked = !_isLiked;
                                        });
                                        AnimateHeart();
                                      },
                                      child: Center(
                                        child: _isLiked ? Icon(Icons.favorite,color: Colors.red.shade400,)
                                            : Icon(Icons.favorite_border),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: InkWell(
                                      customBorder: CircleBorder(),
                                      hoverColor: Colors.green,
                                      onTap: (){

                                      },
                                      child: Center(
                                        child: Icon(EvaIcons.messageCircleOutline),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: InkWell(
                                      customBorder: CircleBorder(),
                                      hoverColor: Colors.green,
                                      onTap: (){

                                      },
                                      child: Center(
                                        child: Icon(Icons.send),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              customBorder: CircleBorder(),
                              onTap: (){
                                setState(() {
                                  _isBookMarked = !_isBookMarked;
                                });
                              },
                              child: _isBookMarked ? Icon(Icons.bookmark_sharp,size: 28,)
                                  :
                              Icon(Icons.bookmark_border_sharp,size: 28,),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: (){},
                            child: Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text('2718 Likes',style: TextStyle(fontWeight: FontWeight.bold,
                                  color: Colors.blue,fontSize: 14),),
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'username',
                                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),

                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _onRefresh()async{
    await Future.delayed(Duration(seconds: 3)).whenComplete((){
        setState(() {

        });
        print('Page refreshed');
    });
  }

  void AnimateHeart(){
    setState(() {
      LikeSize = 40;
    });
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      if(LikeSize<=80)
      {
        setState(() {
          LikeSize +=1;
        });
      }
      else
      {
        setState(() {
          Timer.periodic(Duration(milliseconds: 10), (timer) {
            if(LikeSize <=  40)
              {
                setState(() {
                  LikeSize = 0;
                });
                timer.cancel();
              }
            else
              {
                setState(() {
                  LikeSize-=1;
                });
              }
          });
        });
        timer.cancel();
      }
    });
  }

  Widget StoryTile()
  {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 100,
      child: Column(
        children: [
          CircleAvatar(
            radius: 49,
            backgroundColor: Colors.purple,
            child: CircleAvatar(
              radius: 47,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text('User Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),overflow: TextOverflow.ellipsis,maxLines: 1,)
        ],
      ),
    );
  }
}


