import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test', () {
    var testVar = 857.28 * 100;
    expect(testVar.toInt(), 85728);
  });
}
