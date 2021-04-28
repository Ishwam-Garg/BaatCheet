import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';


class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.send_rounded,color: Colors.white,),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0 ? Icon(Icons.home_filled,) : Icon(Icons.home_outlined,),
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
            icon: currentIndex == 4 ? Icon(Icons.movie_creation,) : Icon(Icons.movie_creation_outlined,),
            label: '',
          ),
        ],
      ),
    );
  }
}
