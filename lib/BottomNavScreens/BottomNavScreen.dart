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
  int currentIndex = 0;
  bool isNotfications = true;
  bool isHomeNotfications = true;
  PageController _controller = PageController(initialPage: 0);
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
            icon: currentIndex == 3 ? Icon(EvaIcons.heart,) : Icon(EvaIcons.heartOutline,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
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
}

/*
appBar: AppBar(
        title: Text('BaatCheet'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: (){

            },
            child: Padding(
              padding: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10,left: 5),
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                        //child: ,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
 */