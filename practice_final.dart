import 'dart:math'; // reduce 예제를 위한 import

class MyClass {
  // method
  static bool isEven(int number) {
    return number % 2 == 0;
  }
}

class Person {
  String name;
  int _age;
  
  // Person({this.name, this.age});
  
  int get age => _age;
  
  void greeting() {
    print('안녕하세요 저는 $name입니다');
  }
  
  // addOneYear()
  /*
  void addOneYear() {
    age++;
  }*/
}

// getter setter Example 
class Rectangle {
  num left, top, width, height;
  
  Rectangle(this.left, this.top, this.width, this.height);
  
  num get right => left + width; // right getter
  set right(num value) => left = value - width; // right setter
  num get bottom => top + height; // bottom getter
  set bottom(num value) => top = value - height; // bottom setter
}

// Inheritance examples
class Hero {
  String name = '영웅';
  
  void run() {}
}

class SuperHero extends Hero {
  
  @override
  void run() {
    super.run();
    this.fly();
  }
  
  void fly() {}
}

// Abstract Class
abstract class Monster {
  void attack();
}

class Goblin implements Monster {
  @override
  void attack() {
    print('고블린 어택');
  }
}

/*
class Bat implements Monster {
  @override
  void attack() {
    print('할퀴기!');
  }
}*/

abstract class Flyable {
  void fly();
}

class Bat implements Monster, Flyable {
  @override
  void attack() {
    print('할퀴기!');
  }
  
  @override
  void fly() {
    print('펄럭펄럭');
  }
}

// Mixin -> override 없이 상속처럼 기능 사용 가능
class DarkGoblin extends Goblin with Hero {
    
}

// Collection - List
List<String> items = ['짜장', '라면', '볶음밥'];

// Collection도 타입 추론이 가능하여 아래와 같이 사용 가능
var items2 = ['짜장', '라면', '볶음밥'];

// dynamic generics
List<dynamic> list = [1, 2, 4, 'hello'];

// spread operators
var items3 = ['떡볶이', ...items, '순대'];

/*
(number) {
  return number % 2 == 0;
};*/

// (number) => number % 2 == 0;

// 선택적 매개변수
void something({String name, int age}) {}
void something2(String name, {int age = 10}) {}

// switch case
enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

// 일급 함수
void something3(Function(int i) f) {
  f(10);
}

void myPrintFunction(int i) {
  print('내가 만든 함수에서 출력한 $i');
}

void main() {
  print(MyClass.isEven(10));
  
  //Person person = Person("ojs", age: 39);
  //person.greeting();
  
  // Something
  something(name: '홍길동', age: 10);
  something(name: '홍길동');
  something2('홍길동', age: 10);
  something2('홍길동');
  //something(age: 10); // ERROR
  //something(); // ERROR 2
  
  var status = Status.Authenticated;
  
  switch (status) {
    case Status.Authenticated:
      print('인증됨');
      break;
    case Status.Authenticating:
      print('인증 처리 중');
      break;
    case Status.Unauthenticated:
      print('미인증');
      break;
    case Status.Uninitialized:
      print('초기화됨');
      break;
  }
  
  // items
  var items = ['짜장', '라면', '볶음밥'];
  
  for (var i = 0; i < items.length; i++) {
    print(items[i]);
  }
  
  // Person practice
  /*
  var person = Person();
  person.age = 10;
  person.addOneYear();
  print(person.age);*/
  
  /*
  var person = Person();
  var person2 = Person(name: '홍길동', age: 20);*/
  
  var person = Person();
  print(person.age); // _age
  
  // Inheritance using examples
  var hero = SuperHero();
  hero.run();
  hero.fly();
  print(hero.name);
  
  // Collections - Map
  var cityMap = {
    '한국': '부산',
    '일본': '도쿄',
    '중국': '북경'
  };
  
  cityMap['한국'] = '서울';
  
  print(cityMap.length);
  print(cityMap['중국']);
  print(cityMap['미국']);
  
  cityMap['미국'] = '워싱턴';
  print(cityMap['미국']);
  
  // Collections - Set
  var citySet = {'서울', '수원', '오산', '부산'};
  
  citySet.add('안양');
  citySet.remove('수원');
  
  print(citySet.contains('서울'));
  print(citySet.contains('도쿄'));
  
  var mySet = <String>{}; // Set<String>
  var mySet2 = {}; // Map<dynamic, dynamic>
  
  // 일급함수 사용
  something3((value) {
    print(value);
  });
  
  // 일급함수 사용2
  something3(myPrintFunction);
  something3((i) => myPrintFunction(i));
  something3((i) => print(i));
  something3(print);
  
  // forEach
  final items4 = [1, 2, 3, 4, 5];
  
  for (var i = 0; i < items4.length; i++) {
    print(items4[i]);
  }
  
  items4.forEach(print);
  
  /*
   * 
   * items.forEach((e) {
      print(e);
   });
     items.forEach((e) => print(e));
   */
  
  // where : 조건을 필터링
  items4.where((e) => e % 2 == 0).forEach(print);
  
  // map : 반복되는 값을 다른 형태로 변환하는 방법
  for (var i = 0; i < items4.length; i++) {
    if (items4[i] % 2 == 0) {
      print('숫자 ${items4[i]}');
    }
  }
  
  // where로 map을 적용
  items4.where((e) => e % 2 == 0).map((e) => '숫자 $e').forEach(print);
  
  // toList : 결과를 리스트의 형태로 저장
  final result = items4.where((e) => e % 2 == 0).toList();
  
  // toSet : 중복을 제거한 리스트의 형태로 결과 얻기
  final items5 = [1, 2, 2, 3, 3, 4, 5];
  
  final result2 = items5.where((e) => e % 2 == 0).toSet().toList(); // 2, 4
  
  // any : 리스트에 특정 조건을 충족하는 요소가 있는지 없는지 검사할 때 사용
  print(items5.any((e) => e % 2 == 0));
  
  // reduce : 반복 요소를 줄여가면서 결과를 만들 때 사용하는 함수
  final items6 = [1, 2, 3, 4, 5];
  
  // 풀어 쓴 원본예제
  var maxResult = items6[0];
  for (var i = 1; i < items6.length; i++) {
    maxResult = max(items6[i], maxResult);
  }
  
  print('maxResult Origin');
  print(maxResult); // 5
  
  // reduce 적용 예제
  print('Using reduce');
  print(items6.reduce((e, v) => max(e, v))); // 5
  
  // 계단식 표기법 .. 연산자
  print('cascade notation');
  print(items6
       ..add(6)
       ..remove(2));
  
  // collection if
  bool promoActive = true;
  
  print('collection if');
  print([1, 2, 3, 4, 5, if (promoActive) 6]); // [1, 2, 3, 4, 5, 6]
  
  // collection for
  var listOfInts = [1, 2, 3];
  var listOfStrings = [
    '#0',
    for (var i in listOfInts) '#$i'
  ];
  
  print('collection for');
  listOfStrings.forEach(print); // #0, #1, #2, #3
  
  // null 처리에 관한 기능 ?, ?? 연산자 활용
  String name = null;
  print('null 처리 방법');
  print(name?.length);
  
  print('null 처리 방법 2');
  print(name?.length ?? 0);
  
}
