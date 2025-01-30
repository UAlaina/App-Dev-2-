import 'dart:io';

void main() {
  double tempFarenheit = 90.25;
  double tempCelsiuc = (tempFarenheit - 32) / 1.8;
  print(
    '${tempFarenheit.toStringAsFixed(1)}F = ${tempCelsiuc.toStringAsFixed(1)}C');


  // print('Enter x');
  // var x = double.parse(stdin.readLineSync()!);
  // print('Enter y');
  // var y = double.parse(stdin.readLineSync()!);
  //
  // var sum = x + y;
  // print('sum = $sum');
  // var average = sum / 2;
  //
  // print('average = $average');


  A a = new A();
  a.first = "New First";
  a._second = "New Second";
  print('${a.first}: ${a._second}');


  var add = (int x, int y) => x + y;
  print(add(10 , 20));




  var words = ['sky', 'cloud', 'forest', 'welcome'];

  words.forEach((String word) {
    print('$word has ${word.length} characters');
  });



  int r1 = apply(3, inc);
  int r2 = apply(2, dec);
  print(r1);
  print(r2);


  String buildMessage(String name, String occupation) {
    return "$name is a $occupation";
  }
  var name = "bok ku";
  var occupation = "car";

  var msg = buildMessage(name, occupation);
  print(msg);


} //main
















class A {
  var first;
  var _second;

  String get second {
    return _second;
  }

  void set second(String second) {
    this.second = second;
  }
}


class Employee {
  var _empName = "bok you";
  var _empAge = 24;
  var _empSalary = 500;

  get empName => _empName;

  set empName(value) {
    _empName = value;
  }

  get empAge => _empAge;

  set empAge(value) {
    _empAge = value;
  }

  get empSalary => _empSalary;

  set empSalary(value) {
    _empSalary = value;
  }
}


int inc (int x) => ++x;
int dec (int x) => --x;
int apply (int x, Function f){
  return f(x);
}