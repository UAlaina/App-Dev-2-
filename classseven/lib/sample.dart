import 'dart:async';

void main() {
  list();
  listDart();

  //list
  List<int> list = [10,21,30, 40,50];
  var douledList = list.map((n) => n * 2);

  print((douledList));
}


void ex1() {
  print('start fetching recipes');

  Future.delayed(Duration(seconds: 5), () {
    print('recipes fetched');
  }). then((_) {
    print('after fetching recipes');
  });

  String computation = 'a random computation';
  print(computation);
}

void ex2() {
  print('start the program');

  //creating a future
  Future.delayed(Duration(seconds: 2), () {
    return 'Future complete after 2 seconds';
  }).then((result) {
    print(result);
  });

  print('End of the program');
}

void ex3() {
  print('start fetching recipes');

  Future.delayed(Duration(seconds: 2), () {
    print('recipes fetched');
  }). then((_) {
    print('after fetching recipes');
  });

  String computation1 = 'a random computation';
  print(computation1);
}

void Asyncy() async{
  print('start fetching recipes');

  Future.delayed(Duration(seconds: 1), () {
    print('recipes fetched');
  });

    print('after fetching recipes');

  String computation1 = 'a random computation';
  print(computation1);
}

void twoFeature() {
  Future.delayed(Duration(seconds: 1), () {
    print('inside delayed 1');
  }).then((_) async {
    print('inside then 1');

    await Future.delayed(Duration(seconds: 1), (){
      print('inside delayed 2');
    });

    print('inside then 2');
  });

  print('after delayed');
}

void FetchUserDemo() {
  print('start');
  fetchUserData().then((user) {
    print('Received user: $user');
  }).catchError((error) {
    print('Error: $error');
  });
  print('End');
}

Future<String> fetchUserData() async {
  await Future.delayed(Duration(seconds: 2)); //simulating a network request
  return 'Ala';
}

void FetchUserDemo2() async {
  print('start');
  try {
    final user = await fetchUserData();
    print('Received user: $user');
  } catch(error) {
    print('Error: $error');
  }
  print('End');
}

void stream() {
  final stream = countStream(5);
  stream.listen((data) {
    print('Data: $data');
  });
}

Stream<int> countStream(int max) async* {
  for(int i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield 1;
  }
}

void spreadOperater() {
  //creating lists
  List list1 = ['Mango', 'Apple'];
  List list2 = ['Orange', 'Avocado', "grape"];
  List list3 = ['Lemon'];

  //combining lists
  var combinedList = [...list1, ...list2,...list3];

  //printing combined list
  print(combinedList);

  //extending newList using spread operator
  List newList = ['One', ...list1];

  //display result
  print(newList);
}

void list() {
  bool sad = false;
  var cart = ['milk', 'ghee', if(sad)'Beer'];
  print(cart);
}

void listDart() {
  List<int> number = [2,4,6,8,10,11,12,13,14];

  List<int> even = number.where((number)=> number.isEven).toList();
  print(even);
}