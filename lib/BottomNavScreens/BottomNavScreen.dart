import 'package:baatcheet/BottomNavScreens/HomeScreen.dart';
import 'package:baatcheet/BottomNavScreens/LikeScreen.dart';
import 'package:baatcheet/BottomNavScreens/PorfileScreen.dart';
import 'package:baatcheet/BottomNavScreens/SearchScreen.dart';
import 'package:baatcheet/BottomNavScreens/ShortsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';


class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int UserCount = 2;
  int currentIndex = 2;
  bool isNotfications = true;
  bool isHomeNotfications = true;
  bool isLikeNotfications = true;
  PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            currentIndex = index;
          });
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: isHomeNotfications ? Padding(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  currentIndex == 0 ? Icon(Icons.home_filled,) : Icon(Icons.home_outlined,),
                  SizedBox(height: 5,),
                  CircleAvatar(
                    radius: 2,
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
            ) : (currentIndex == 0 ? Icon(Icons.home_filled,) : Icon(Icons.home_outlined,)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1 ? Icon(Icons.search,) : Icon(Icons.search_outlined,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2 ? Icon(Icons.movie_creation,) : Icon(Icons.movie_creation_outlined,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: isLikeNotfications ? Padding(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  currentIndex == 3 ? Icon(EvaIcons.heart,) : Icon(EvaIcons.heartOutline,),
                  SizedBox(height: 5,),
                  CircleAvatar(
                    radius: 2,
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
            ) : currentIndex == 3 ? Icon(EvaIcons.heart,) : Icon(EvaIcons.heartOutline,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onLongPress: (){
                UsersBottomModalSheet(context,UserCount);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.white,
                    ),
                    isNotfications == true ? Container(
                      child: Column(
                        children: [
                          SizedBox(height: 5,),
                          CircleAvatar(
                            radius: 2,
                            backgroundColor: Colors.red,
                          ),
                        ],
                      ),
                    ) : Container(),
                  ],
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          HomeScreen(),
          SearchScreen(),
          ShortsScreen(),
          LikeScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }

  void UsersBottomModalSheet(BuildContext context,int userCount){
    showModalBottomSheet(
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
        context: context,
        builder: (context){
          return Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  height: 40,
                  child: Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 260,
                  child: ListView.builder(
                      itemCount: UserCount,
                      itemBuilder: (context,index){
                          if(index == userCount - 1)
                            {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  radius: 30,
                                                  backgroundColor: Colors.grey.shade300,
                                                  child: CircleAvatar(
                                                    radius: 29,
                                                    backgroundColor: Colors.grey.shade700,
                                                  ),
                                                ),
                                                SizedBox(width: 20,),
                                                Text('username',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          ),
                                          CircleAvatar(
                                            radius: 16,
                                            backgroundColor: Colors.blue,
                                            child: CircleAvatar(
                                              radius: 5,
                                              backgroundColor: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  radius: 30,
                                                  child: CircleAvatar(
                                                    radius: 29,
                                                    backgroundColor: Colors.white,
                                                    child: Center(
                                                      child: Icon(Icons.add,color: Colors.black,),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 20,),
                                                Text('Add Account',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          ),
                                          CircleAvatar(
                                            radius: 16,
                                            backgroundColor: Colors.blue,
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          else
                           return Container(
                              margin: EdgeInsets.only(top: 15),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.grey.shade300,
                                          child: CircleAvatar(
                                            radius: 29,
                                            backgroundColor: Colors.grey.shade700,
                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Text('username',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.blue,
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                      },
                  ),
                ),
              ],
            ),
          );
        },
    );
  }


}

