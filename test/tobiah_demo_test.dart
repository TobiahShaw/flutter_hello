import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/demo/test/test_demo.dart';

// flutter test test/tobiah_demo_test.dart 进行测试
void main() {
  test('should return hello + something.', () {
    var string = TobiahTestDemo.greet('tobiah');
    expect(string, 'hello, tobiah ~~');
  });

  testWidgets('widget testing demo', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TestDemo(),
    ));

    // 测试是否找到含有hello的小部件
    final labelText = find.text('hello');
    expect(labelText, findsNWidgets(1));

    final actionChipLabelText = find.text('0');
    expect(actionChipLabelText, findsOneWidget);

    final actionChip = find.byType(ActionChip);
    await tester.tap(actionChip);
    // 重建一下小部件
    await tester.pump();

    final actionChipLabelTextAfterTap = find.text('1');
    expect(actionChipLabelTextAfterTap, findsOneWidget);
    expect(actionChipLabelText, findsNothing);
  });
}
