class MyClass {
  // method
  static bool isEven(int number) {
    return number % 2 == 0;
  }
}

class Person {
  String name;
  int? age;
  
  Person(this.name, {this.age});
  
  void greeting() {
    print('안녕하세요 저는 $name입니다');
  }
}

/*
(number) {
  return number % 2 == 0;
};*/

// (number) => number % 2 == 0;

// 선택적 매개변수
void something({String? name, int? age}) {}
void something2(String name, {int age = 10}) {}

// switch case
enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

void main() {
  print(MyClass.isEven(10));
  
  Person person = Person("ojs", age: 39);
  person.greeting();
  
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
  
}

