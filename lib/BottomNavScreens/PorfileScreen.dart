import 'package:baatcheet/BottomNavScreens/HomeScreen.dart';
import 'package:baatcheet/BottomNavScreens/SearchScreen.dart';
import 'package:baatcheet/BottomNavScreens/ShortsScreen.dart';
import 'package:baatcheet/ProfileScreens/PostImages.dart';
import 'package:baatcheet/ProfileScreens/TaggedPostsScreen.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String sampleBio = "So many of my smiles are because of you. So grateful to be sharing my world with you. All your dreams can come true and I'll make sure of it. Live in the sunshine where you belong. My life is better than my daydreams.";
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        title: Container(
          child: Row(
            children: [
              Icon(Icons.lock_outline,color: Colors.white,),
              SizedBox(width: 5,),
              Text('ishwamgarg',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
              Icon(Icons.keyboard_arrow_down,color: Colors.white,),
              SizedBox(width: 5,),
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ),
        titleSpacing: -40,
        actions: [
          Icon(Icons.add_box_outlined),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: (){
             _key.currentState.openEndDrawer();
            },
            child: Icon(EvaIcons.menu,color: Colors.white,),
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context,value){
            return [
              SliverAppBar(
                backgroundColor: Colors.blue,
                leading: Container(),
                actions: [
                  Container(),
                ],
                floating: false,
                pinned: true,
                bottom: TabBar(
                  indicatorWeight: 2,
                  indicatorColor: Colors.purple,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.grid_on_sharp),
                    ),
                    Tab(
                      icon: Icon(Icons.perm_contact_cal_outlined),
                    ),
                  ],
                ),
                expandedHeight: 400,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: RefreshIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.blue,
                    onRefresh: ()async{
                      setState(() {

                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5,),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.red,
                                ),
                                Container(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text('11',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                        SizedBox(height: 5,),
                                        Text('Posts',style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text('412',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                        SizedBox(height: 5,),
                                        Text('Followers',style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text('314',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                        SizedBox(height: 5,),
                                        Text('Following',style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('Ishwam Garg',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Container(
                              height: 100,
                              width: double.infinity,
                              child: Text(sampleBio,maxLines: 6,overflow: TextOverflow.fade,style: TextStyle(color: Colors.white),)),
                          SizedBox(height: 20,),
                          GestureDetector(
                              onTap: (){},
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: Center(child: Text('Edit Profile',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),),
                              )),
                          SizedBox(height: 10,),
                          Text('Story Highlights',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              PostImages(),
              TaggedPostsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
