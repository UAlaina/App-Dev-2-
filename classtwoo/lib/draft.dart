void main() {
  void number(int n) {
    //check the given number is even or odd
    if(n%2 == 0) {
      print("The given number is even");
    }
    else {
      print("The given number is odd");
    }
  }



  var list = ["James", "Patrick", "Mathew", "Tom"];
  print("Example anonymous function");
  list.forEach((item) {
    print('${list.indexOf(item)}: $item');
  });



  var muliply = (int a, int b) {
    return a * b;
  };

  var result = muliply(5,3);
  print(result);



  number(20);
  var list1 = [10,20,30,40,50];
  for(var i in list1) {
    print(i);
  }
}