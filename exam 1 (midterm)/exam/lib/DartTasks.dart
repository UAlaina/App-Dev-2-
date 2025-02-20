import 'dart:async';

void main() {
  //--------------------first one-------------------
  getUserData();

  //---------------------second one------------------
  //with
  print('with');
  scheduleMeeting('8:00 AM', '6:00 PM', 'D-244', subject: 'creating a website', organizer: 'Ala');

  //without
  print('without');
  scheduleMeeting('10:00 AM', '2:00 PM', 'D-243');

  //---------------------third one------------------
  Set<int> setA = {1,2,3,4,5};
  Set<int> setB = {3,4,5,6,7};

  Set<int> result = intersectSets(setA, setB);
  print('intersection of the two sets: $result');

  //---------------------fourth one------------------
  List<int> numbers = [1,2,3,4,5];

  applyCustomOper(numbers, (x) => x * x);
  applyCustomOper(numbers, (x) => x * x * x);

  //---------------------fifth one------------------
  List<String> fruits = ['apple', 'banana', 'cherry'];
  print(concatenateStrings(fruits));
}

//----------------------------------------------first one--------------------------------------------------
Future<Map<String, String>> fetchUserData() async{
  await Future.delayed(Duration(seconds: 2));

  return {
    'name':'Pranav Doe',
    'email': 'pra@email.com',
    'age':'30'
  };
}

void getUserData() async{
  Map<String, String> userData = await fetchUserData();
  print('User Data: $userData');
}

//----------------------------------------------second one--------------------------------------------------
void scheduleMeeting(String startTime, String endTime, String location, {String? subject, String? organizer}) {
  print('Meeting Scheduled');
  print('Start Time: $startTime');
  print('End Time: $endTime');
  print('Location: $location');

  if(subject != null) {
    print('Subject: $subject');
  }
  if(organizer != null) {
    print('Organizer: $organizer');
  }
}

//----------------------------------------------third one--------------------------------------------------
Set<int> intersectSets (Set<int> set1,Set<int> set2) {
  Set<int> intersection = {};
  for(var element in set1) {
    if(set2.contains(element)) {
      intersection.add(element);
    }
  }

  return intersection;
}

//----------------------------------------------fourth one--------------------------------------------------
void applyCustomOper(List<int> numbers, int Function(int) operation) {
  List<int> result = numbers.map((number) => operation(number)).toList();
  print('Process num: $result');
}

//----------------------------------------------fifth one--------------------------------------------------
String concatenateStrings(List<String> strings, {String separator = '', bool toUpperCase = false, }) {
  String result = strings.join(separator);
  return toUpperCase? result.toUpperCase(): result;
}