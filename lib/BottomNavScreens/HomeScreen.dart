import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isMessages = true;

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
      body: Column(
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
        ],
      ),
    );
  }
}

Widget StoryTile()
{
  return Container(
    margin: EdgeInsets.only(left: 10),
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
        Text('User Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)
      ],
    ),
  );
}