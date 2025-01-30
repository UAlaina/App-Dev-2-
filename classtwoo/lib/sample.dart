import 'dart:io';
import 'dart:js_interop';

import 'package:flutter/material.dart';

void main() {
  //print 10 prime numbers
  //a number which is divisible either by 1 and by that number
  //2 3 5 7 11 13 17 19 23 29 51
  var count = 0;

  // for(int num = 2; count < 10 ; num++) {
  //     if(isPrime(num)){
  //       print(num);
  //       count++;
  //   }
  // }

  //----------------------------------------------------fibonacci-------------------------------------------------------------------
  //print 10 ten fibonacci series
  //0 1 1 2 3 5 8 13 21 34 55
  // int a = 0, b = 1;
  //
  // while (count < 10) {
  //   print(a);
  //   var next = a + b;
  //   a = b;
  //   b = next;
  //   count++;
  // }

  //----------------------------------------------------pyramid 1--------------------------------------------------------
  //pyramid of 1
  // int rows = 4;
  //
  // for (int i = 1; i <= rows; i++) {
  //   for (int j = 1; j <= i; j++) {
  //     stdout.write("1 ");
  //   }
  //   //
  //   // for (int k = 1; k <= i; k++) {
  //   //   stdout.write('1');
  //   // }
  //   print("");
  // }


  //-------------------------------------------------pyramid 2-------------------------------------------------------
  //1
  //1 2
  //1 2 3
  //1 2 3 4

  // int rows = 4;
  // int num = 1;
  //
  // for (int i = 1; i <= rows; i++) {
  //   for (int j = 1; j <= i; j++) {
  //     stdout.write('${num++} ');
  //   }
  //   num = 1;
  //   //
  //   // for (int k = 1; k <= i; k++) {
  //   //   stdout.write('1');
  //   // }
  //   print("");
  // }

//------------------------------------------------------pyramid 3----------------------------------------------------
  //1
  //2 3
  //4 5 6
  //7 8 9 10

  // int rows = 4;
  // int num = 1;
  //
  // for (int i = 1; i <= rows; i++) {
  //   for (int j = 1; j <= i; j++) {
  //     stdout.write('${num++} ');
  //   }
  //   print("");
  // }



  //-------------------------------------------------------factorial----------------------------------------------------
  //factorial 5! (5 * 4 * 3 * 2 * 1) = 120

  // int fact = 1;
  // for(int i = 1; i <= 5; i++) {
  //   fact = fact * i;
  // }
  // print(fact);



  //--------------------------------------------------reverse function----------------------------------------------------
  // String str = "worst week you can ever get";
  // String out = "";
  //
  // // String reversed = reverseString(str);
  // // print(reversed);
  //
  // for(int i = str.length - 1; i> 0; i++){
  //   out += str[i];
  // }



  //----------------------------------------------find the biggest num---------------------------------------------------
//   var list = [];
//   list.add(10);
//   list.add(7);
//   list.add(100);
//   list.add(99);
//   list.add(64);
//   print(list);
//
//   int maxNum = list[0];
//
//   for (int i = 1; i < list.length; i++) {
//     if (list[i] > maxNum) {
//       maxNum = list[i];
//     }
//   }
//   print('The biggest number is: ${maxNum}');
//



//--------------------------------Set------------------------------
var mySet = <String>{};

mySet.add("apple");
mySet.add("banana");
mySet.add("orange");
mySet.add("apple"); //this will be ignored cause it's duplicate one

print(mySet);

print(mySet.contains("banana"));
print(mySet.contains("grape"));

mySet.remove("apple");
print(mySet);



//-------------------------------Map----------------------------------
var myMap = <String, int>{};

myMap["apple"] = 3;
myMap["banana"] = 5;
myMap["orange"] = 2;

print(myMap);

print(myMap["banana"]);

print(myMap.containsKey("apple"));
print(myMap.containsKey("grape"));

myMap.remove("orange");
print(myMap);





}

//function for the bool of prime numbers
bool isPrime(int num) {
  for(int i = 2; i < num; i++){
    if(num % i == 0){
      return false;
    }
  }
  return true;
}

// Function to reverse a string
String reverseString(String str) {
  return str.split('').reversed.join('');
}