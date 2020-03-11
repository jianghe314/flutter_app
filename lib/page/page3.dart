import 'package:flutter/material.dart';

class MyContainer extends StatefulWidget{

  MyContainer({Key key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyContainerState();
  }


}

class MyContainerState extends State<MyContainer>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("布局测试"),),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.pink,width: 300,height: 300),
            Positioned(left: 20,top: 20,child:Container(color: Colors.yellow,width: 50,height: 50,),),
          Positioned(left: 20,top: 70,child: Text("Stack提供了层叠布局容器"),),
        ],
      ),
    );
  }
  
}