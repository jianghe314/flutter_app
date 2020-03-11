import 'package:flutter/material.dart';
import 'package:flutter_app/page/page2.dart';
import 'package:flutter_app/page/page3.dart';

class Page1 extends StatefulWidget{

  Page1({Key key}):super(key:key);
  _Page1State createState() => _Page1State();

}

class _Page1State extends State<Page1> with WidgetsBindingObserver{

  TextStyle blackStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black);
  TextStyle redStyle = TextStyle(fontWeight: FontWeight.normal,fontSize: 10,color: Colors.red);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("page1 initState.....");
    //注册监听器
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_){
      print("单次Frame绘制回调");
    });

    WidgetsBinding.instance.addPersistentFrameCallback((_){
      print("实时Frame绘制回调");
    });
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("page1 setState......");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("page1 didChangeDependencies....");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("page1 build....");
    return Scaffold(
      appBar: AppBar(title: Text("Lifecycle demo")),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: '关闭或者打开',style: blackStyle),
                      TextSpan(text: '相关页面',style: redStyle)
                    ]
                  )
              ),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyContainer())),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }

  @override
  void didUpdateWidget(Page1 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("page1 didUpdateWidget....");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("page1 deactivate....");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("page1 dispose....");
    //移除监听
    WidgetsBinding.instance.removeObserver(this);
  }

  //监听App声明周期回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print("$state");
    if(state == AppLifecycleState.resumed){
      print("再次显示.........");
    }
  }

}