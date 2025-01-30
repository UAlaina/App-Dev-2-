void main() {
  var macbook = MacBook(name : "MacBook Pro", color: "kaki");
}

class Laptop {
  //constructor
  Laptop({var name, var color}) {
    print("Laptop constructor");
    print("name: $name");
    print("color: $color");
  }
}

class MacBook extends Laptop {
  //constructor
  MacBook({var name, var color}) : super(name: name, color: color) {
    print("MacBook constructor");
  }
}