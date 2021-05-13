import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';


class ShortsContentScreen extends StatefulWidget {
  final int index;
  ShortsContentScreen(this.index);
  @override
  _ShortsContentScreenState createState() => _ShortsContentScreenState();
}

class _ShortsContentScreenState extends State<ShortsContentScreen> {

  bool isliked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            GestureDetector(
              onDoubleTap: (){
                setState(() {
                  isliked = !isliked;
                });
              },
              child: Container(
                color: Colors.grey.shade900,
                child: Center(
                  child: isliked ? Container(
                    height: 200,
                    width: 200,
                    child: FlareActor(
                      'icons/Like2.flr',
                      animation: 'start',
                    ),
                  ) : Container(),
                ),
              ),
            ),
            Positioned(
                bottom: 10,
                left: 10,
                child: Text(widget.index.toString(),style: TextStyle(color: Colors.white),),
            ),
            Positioned(
                right: 10,
                top: MediaQuery.of(context).size.height*0.4,
                child: Container(
                  child: Column(
                    children: [
                      //likes
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                isliked = !isliked;
                              });
                            },
                            child: Center(
                              child: isliked ? Container(
                                width: 80,
                                height: 80,
                                child: FlareActor(
                                  'icons/Like.flr',
                                  animation: "start",
                                  alignment: Alignment.center,
                                  fit: BoxFit.fill,
                                  isPaused: false,
                                ),
                              ) : Container(
                                  height: 80,
                                  width: 80,
                                  child: Icon(Icons.favorite_border,size: 34,)),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              child: Text('1.2 M',style: TextStyle(fontSize: 12,color: Colors.white),)),
                        ],
                      ),
                      //comments
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                isliked = !isliked;
                              });
                            },
                            child: Center(
                              child: Container(
                                  height: 80,
                                  width: 80,
                                  child: Icon(Icons.chat_bubble_outline))
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              child: Text('12K',style: TextStyle(fontSize: 12,color: Colors.white),)),
                        ],
                      ),
                      //send button
                      Container(
                          width: 80,
                          height: 80,
                          child: Center(child: Icon(Icons.send))),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
