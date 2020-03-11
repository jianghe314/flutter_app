import 'package:flutter_app/person.dart';

class Student1 extends Person{

  var mclass;
  Student1(name, age, address,this.mclass) : super(name, age, address);
  @override
  void printInfo() {
    // TODO: implement printInfo
    print("Person name:$name and age:$age , addrees is $address My class is $mclass");
  }

}