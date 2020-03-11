import 'package:flutter_app/shopping/item.dart';
import 'package:flutter_app/shopping/meta.dart';
import 'package:flutter_app/shopping/printhelper.dart';

class ShoppingCart extends Meta with PrintHelper{
  DateTime date;
  String code;
  List<Item> bookings;
  ShoppingCart({name}):this.withCode(name:name,code:null);
  ShoppingCart.withCode({name,this.code}) : date=DateTime.now() , super(0, name);

  //ShoppingCart(this.code,double price, String name) : date=DateTime.now(),super(price, name);




  double get price => bookings.reduce((value,element) => value +element).price;
  printInfo() => '''
  购物车信息：
  -------------------
  用户名：$name
  优惠码：${code??"没有"}
  总  价：$price
  Date  :$date
  -------------------
  ''';

  @override
  getInfo() {
    return printInfo();
  }



}