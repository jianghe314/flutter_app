import 'package:flutter_app/Student1.dart';

class Teacher extends Student1{

  Teacher(name, age, address, mclass) : super(name, age, address, mclass);
  @override
  void printInfo() {
    // TODO: implement printInfo
    super.printInfo();
    print("This is Teacher printInfo function");
  }

}