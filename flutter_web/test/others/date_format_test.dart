import 'package:flutter_test/flutter_test.dart';
import 'package:ui_ux/src/utils/date_format.dart';

void main() {
  group('dateFormat > ', () {
    test('day > 10 && month >10', () {
      DateTime date = DateTime(2010, 11, 20);
      expect(date.format, "20/11/2010");
    });

    test('month < 10', () {
      DateTime date = DateTime(2010, 1, 20);
      expect(date.format, "20/01/2010");
    });

    test('day < 10', () {
      DateTime date = DateTime(2010, 11, 9);
      expect(date.format, "09/11/2010");
    });
    test('day < 10 && month < 10', () {
      DateTime date = DateTime(2010, 2, 9);
      expect(date.format, "09/02/2010");
    });
  });
}
