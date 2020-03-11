import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class Parent extends StatefulWidget{

  Parent({Key key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }



}

class _ParentState extends State<Parent>{

  int _counter = 0;

  //当Widget第一次插入到widget树时会被调用，对于每一个State对象，Flutter只会调用该回调一次
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("page2 parent initState.....");
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("page2 parent setState.....");
  }

  /**
   * 初始化时，在initState之后立刻被调用
   * 当State的依赖关系发生变化时，会触发此接口调用
   */
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("page2 parent didChangeDependencies.....");
  }

  //绘制界面
  @override
  Widget build(BuildContext context) {
    print("page2 parent build.....");
    return Scaffold(
       body: Center(
//        child: RaisedButton(
//          onPressed: (){
//            setState(() {
//              _counter++;
//            });
//          },
//          color: Colors.yellow,
//          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//          colorBrightness: Brightness.light,
//          child: Child(count:_counter),
       child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("CustomScrollView Demo"),
              floating: true,
              flexibleSpace: Image.network("https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2351840349,4164088256&fm=26&gp=0.jpg",fit: BoxFit.cover),
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context,index) => ListTile(title: Text("Item $index")),
                childCount: 100,
              ),
            )
          ],
        ),)
    );
  }

}


class Child extends StatefulWidget{

  final int count;


  Child({Key key,this.count}):super(key:key);

  @override
  _ChildState createState() => _ChildState();

}

class _ChildState extends State<Child>{

  //绘制界面
  @override
  Widget build(BuildContext context) {
    print("child build....");
    return Text('点击按钮查看状态变化 couter:${widget.count}');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Child oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  //当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  //当State对象从树中被永久移除时调用，通常在此回调中释放资源
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}

class ScrollControllerWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }

}

class MyAppState extends State<Parent>{

  ScrollController _controller;
  bool isToTop = false;

  @override
  void initState() {
    _controller = ScrollController();
    //注册监听
    _controller.addListener((){
      if(_controller.offset > 1000){
        setState(() {
          isToTop = true;
        });
      }else if(_controller.offset < 300){
        setState(() {
          isToTop = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Scroll Controller Widget")),
//      body: Column(
//        children: <Widget>[
//          Container(
//            height: 40,
//            child: RaisedButton(onPressed: (isToTop ? (){
//              if(isToTop){
//                _controller.animateTo(.0, duration: Duration(milliseconds: 500), curve: Curves.ease);
//              }
//            }:null),child: Text("Top"),),
//          ),
//          Expanded(
//            child: ListView.builder(
//              controller: _controller,
//                itemCount: 100,
//                itemBuilder: (context,index)=> ListTile(title: Text("Item $index"))),
//          )
//        ],
//      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification){
          if(scrollNotification is ScrollStartNotification){
            //滑动开始
            print("Scroll Start");
          }else if(scrollNotification is ScrollUpdateNotification){
            //更新滑动位置
            print("Scroll Update");
          }else if(scrollNotification is ScrollEndNotification){
            //滑动结束
            print("Scroll End");
          }
        },
        child: ListView.builder(
          itemCount: 100,
            itemBuilder: (context,index) => ListTile(title: Text("Item $index"))),
      ),

    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

}

class ScrollNotificationWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}