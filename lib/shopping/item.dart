import 'package:flutter_app/shopping/meta.dart';

class Item extends Meta{
  Item(double price, String name) : super(price, name);
  Item operator+(Item item) =>Item(price+item.price, name+item.name);

}