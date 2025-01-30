abstract class Shape {
  double area();
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  double area() {
    return 3.1415926535 * radius * radius;
  }
}

class Square extends Shape {
  double side;

  Square(this.side);

  double area() {
    return side * side;
  }
}

void main() {
  Circle c = Circle(5);
  print("The area of this circle is: ${c.area()}");

  Square s = Square(5);
  print("The area of this Square is: ${s.area()}");
}