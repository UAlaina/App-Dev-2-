import 'dart:io';

void main() {
 //var macbook = MacBook(name: "MacBook pro", color: "purple");
 var macbook = MacBook();

 print("--------------------------------------------------------------------------------------------");

 print(pow(2, 2));
 print(pow(2, 4));
 print(pow(3));

 print("--------------------------------------------------------------------------------------------");

 ShowMyDetails("jay", "Tillu");
 ShowMyDetails("jay");
 ShowMyDetails("jay", "Tillu",100);

 print("--------------------------------------------------------------------------------------------");

 test_param(123);
 test_param(123, s1: 'KOKO');
 test_param(123, s2: 'KOKO',s1: 'miami');

 print("--------------------------------------------------------------------------------------------");

 print(0 ?? 1); //<- 0
 print(1 ?? null); //<- 1
 print(null ?? null); //<- null
 print(null ?? null ?? 2); //<- 2

 print("--------------------------------------------------------------------------------------------");

 var value;
 print(value); // <- null
 value ??= 5;
 print(value); // <- 5, changed from null
 value ??= 6;
 print(value); // <- 5, no change

 print("--------------------------------------------------------------------------------------------");

 //print(value.toLowerCase()); //<- apparently it will crash but it is working now
 //print(value?.toLowerCase().toUpperCase()); // <- will crash
 print(value?.toLowerCase()?.toUpperCase()); // <-output is null

 print("--------------------------------------------------------------------------------------------");

 String? name;
 name = "Jhon";

 print("--------------------------------------------------------------------------------------------");

 int? maybeValue = 42;
 int value2 = maybeValue; // valid, value is non-nullable
}

class Laptop {
  Laptop({var name, var color}) {
    //default constructor
    print("Laptop constructor");
    print("Name: $name");
    print("Color: $color");
  }
  //named constructor
  Laptop.named() {
    print("Laptop named constructor");
  }
}
class MacBook extends Laptop {
  MacBook() : super.named() {
    print("MacBook constructor");
  }

// class MacBook extends Laptop {
//   MacBook({var name, var color}) : super(name: name, color: color) {
//     print("MacBook constructor");
// }
}

//------------------------------------------------------------------------------------------------

int pow(int x, [int y = 2]) {
    int r = 1;
    for(int i = 0; i < y; i++) {
      r *= x;
    }
    return r;
}

//------------------------------------------------------------------------------------------------

ShowMyDetails(String name, [String lastName = 'sakku', int age = 2]) {
  print(name);
  print(lastName);
  print(age);
}

test_param(n1, {s1,s2}){
  print(n1);
  print(s1);
}

//------------------------------------------------------------------------------------------------
