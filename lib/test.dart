import 'dart:io';

void main() {
  print("Enter two numbers");
  var n1 = stdin.readLineSync()!;
  var n2 = stdin.readLineSync()!; // String

  int num1 = int.parse(n1);
  int num2 = int.parse(n2);

//   + , - , *  , / , %

  int result = num1 % num2;

  print(result);
}
