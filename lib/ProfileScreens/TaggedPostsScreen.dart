import 'package:flutter/material.dart';

class TaggedPostsScreen extends StatefulWidget {
  @override
  _TaggedPostsScreenState createState() => _TaggedPostsScreenState();
}

class _TaggedPostsScreenState extends State<TaggedPostsScreen> {
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
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemCount: 10,
            itemBuilder: (context,index){
              return Container(
                color: Colors.green,
                child: Center(child: Text(index.toString(),style: TextStyle(color: Colors.white),),),
              );
            },
          )
        ],
      ),
    );
  }
}
