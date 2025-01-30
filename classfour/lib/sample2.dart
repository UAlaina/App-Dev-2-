import 'sample.dart';

void main() {
  A a = new A();
  a.first = "New First";
  a.second = "New Second"; // The setter _ second is not defined for the class 'A'
  print('${a.first}: ${a.second}'); // The getter _second is not defined for the class 'A'

  Employee emp = new Employee();
  emp.empName = "Ala";
  emp.empAge = 22;
  emp.empSalary = 100000;
  print("Employee name is : ${emp.empName}");
  print("Employee Age is : ${emp.empAge}");
  print("Employee Salary is : ${emp.empSalary}");


}