import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

// flutter driver --target=test_driver\app.dart
main() {

  group('APP', (){
    FlutterDriver driver;

    final actionChip = find.byValueKey('actionChip');
    final actionChipLabelText = find.byValueKey('actionChipLabelText');

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if(driver != null) {
        driver.close();
      }
    });

    test('start at 0', () async {
      expect(await driver.getText(actionChipLabelText), '0');
    });

    test('tap the chip', () async {
      await driver.tap(actionChip);
      expect(await driver.getText(actionChipLabelText), '1');
    });
  });
}