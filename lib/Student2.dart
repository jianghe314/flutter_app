import 'package:flutter_app/person.dart';

class Student2 implements Person{
  @override
  var address;

  @override
  var age;

  @override
  var name;

  @override
  void printInfo() {
    print("This is Student2 printInfo function");
  }

}