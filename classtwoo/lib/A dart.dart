class Student {
  var stdName;
  var stdAge;
  var stdRoll_nu;

  //defining class function
    showStdInfo() {
      print("the student name is:$stdName");
      print("the student Age is:$stdAge");
      print("the student Roll Number is:$stdRoll_nu");
    }
}

class Parent {
  parent() {
    print("This is the super class constructor");
  }
}

class Child extends Parent {
  Child():super() //Calling super class constructor
  {
    print("This is the sub class constructor");
  }
}

void main() {
  //creating object of sub class
  Child c = Child();
}