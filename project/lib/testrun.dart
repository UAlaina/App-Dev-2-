void main() {
  print('hi');

  for(int i = 1; i <= 10; i++) {
    print(i);
  }



  var list1 = <int>[]; //Using modern list syntax
  list1.add(10); //Using the add() method to add elements
  list1.add(11);
  list1.add(12);
  list1.add(13);
  list1.add(14);
  print(list1);



  var name = 'Alaina';
  var roll_no = 44;
  print("My name is ${name} and my roll number is ${roll_no}");



  var heart_symbol = '\u2665';
  var laugh_symbol = '\u{1f600}';
  var Finger = '\u{1F595}';
  var kissyFace = '\u{1F617}';
  print(heart_symbol);
  print(laugh_symbol);
  print(Finger);
  print(kissyFace);



  print ("Example of assignment operators");
  var n1 = 10;
  var n2 = 5;

  print("n1 + n1 = ${n1+n2}");
  print("n1 - n1 = ${n1-n2}");
  print("n1 * n1 = ${n1*n2}");
  print("n1 / n1 = ${n1/n2}");
  print("n1 % n1 = ${n1%n2}");



  int r = 5;
  double pi = 3.14;
  double res = 4*pi*r*r;
  print ("The area of sphere = ${(res)}");



  var num = 10;
  var nam = "Alaina";
  print (num is int);
  print (nam is! String);


  //reserving with for loop
  var number  = 125;
  var reversenum = 0;

  for (; number > 0; number ~/= 10) {
    var digit = number % 10;
    reversenum =reversenum * 10 + digit;
  }
  print (reversenum);


  //reserving with while loop
  var number2  = 125;
  var remainder = 0;
  var reversednum = 0;

  while (number2 > 0){
    remainder = number2 % 10;
    reversednum = reversednum * 10 + remainder;
    number2 = number2 ~/ 10;
  }
  print (reversenum);



  String str1 = 'this is an example of a single-line string';
  String str2 = "this is an example of a double-quotes multiline line string";
  String str3 = """this is a multiline line
  string using the triple quote""";

  var a = 10;
  var b = 20;

  print(str1);
  print(str2);
  print(str3);

  print ("The sum is = ${a+b}");
}