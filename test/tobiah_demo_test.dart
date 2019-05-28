import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/demo/test/test_demo.dart';

// flutter test test/tobiah_demo_test.dart 进行测试
void main() {
  test('should return hello + something.', (){
    var string = TobiahTestDemo.greet('tobiah');
    expect(string, 'hello, tobiah ~~');
  });
}