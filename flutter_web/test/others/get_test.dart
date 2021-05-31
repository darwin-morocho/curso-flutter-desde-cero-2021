import 'package:flutter_test/flutter_test.dart';
import 'package:ui_ux/src/data/models/user.dart';
import 'package:ui_ux/src/helpers/get.dart';

void main() {
  setUpAll(() {
    print("JAJAJAJJAJAJA  setUpAll");
  });
  tearDownAll(() {
    print("JAJAJAJJAJAJA tearDownAll");
  });
  group('Get > ', () {
    // setUp(() {});
    tearDown(() {
      print("removed data::: ${Get.i.clear()}");
      print("removed lazy:::  ${Get.i.lazyClear()}");
      print("❌");
    });
    test('isAssertionError', () {
      bool catchCalled = false;
      try {
        Get.i.find<String>(tag: "apiKey");
      } catch (e) {
        if (e is AssertionError) {
          catchCalled = true;
        }
      }
      expect(catchCalled, true);
      catchCalled = false;

      try {
        Get.i.find<String>();
      } catch (e) {
        if (e is AssertionError) {
          catchCalled = true;
        }
      }

      expect(catchCalled, true);
      catchCalled = false;

      try {
        Get.i.find<User>(lazy: true);
      } catch (e) {
        if (e is AssertionError) {
          catchCalled = true;
        }
      }

      expect(catchCalled, true);
      catchCalled = false;

      try {
        Get.i.find<User>(lazy: true, tag: 'user');
      } catch (e) {
        if (e is AssertionError) {
          catchCalled = true;
        }
      }
      expect(catchCalled, true);
    });

    test('put, find and remove', () {
      addTearDown(() {
        print("🤢 After put, find and remove");
      });
      Get.i.put<String>("API_KEY", tag: "apiKey");
      Get.i.put<String>("GOOGLE_MAPS_API_KEY");
      final apiKey = Get.i.find<String>(tag: "apiKey");
      expect(apiKey, "API_KEY");
      final googleMapsApiKey = Get.i.find<String>();
      expect(googleMapsApiKey, "GOOGLE_MAPS_API_KEY");
      expect(Get.i.remove<String>(), true);
      expect(Get.i.remove<String>(tag: "apiKey"), true);
      Get.i.put<String>("GOOGLE_MAPS_API_KEY");
    });

    test('lazyPut, lazy find', () {
      int counter = 0;
      Get.i.lazyPut<User>(
        () {
          counter++;
          return User(
            id: "1234567897",
            email: "test@test.com",
            name: "Test",
            lastname: "Meedu",
            birthday: DateTime(1993, 12, 1),
          );
        },
      );
      int counter2 = 0;
      Get.i.lazyPut<User>(() {
        counter2++;
        return User(
          id: "1234567890",
          email: "test@test.com",
          name: "Test",
          lastname: "Meedu",
          birthday: DateTime(1993, 12, 1),
        );
      }, tag: 'user2');
      Get.i.find<User>(lazy: true);
      expect(counter, 1);
      final user1 = Get.i.find<User>(lazy: true);
      expect(counter, 1);

      final user2 = Get.i.find<User>(lazy: true, tag: 'user2');
      expect(counter2, 1);
      expect(user1.id != user2.id, true);
      expect(Get.i.remove<User>(), true);
      expect(Get.i.remove<User>(tag: 'user2'), true);
      Get.i.find<User>(lazy: true);
      Get.i.find<User>(lazy: true, tag: 'user2');
      expect(counter, 2);
      expect(counter2, 2);
      Get.i.find<User>(lazy: true);
      Get.i.find<User>(lazy: true, tag: 'user2');
      expect(counter, 2);
      expect(counter2, 2);
      print("fin");
    });
  });

  group('Get clear && lazyClear', () {
    tearDown(() {
      Get.i.clear();
      Get.i.lazyClear();
    });
    test('clear', () {
      expect(Get.i.clear(), 0);
      Get.i.put<String>("GOOGLE_MAPS_API_KEY");
      expect(Get.i.clear(), 1);
    });
    test('lazy clear', () {
      expect(Get.i.lazyClear(), 0);
      Get.i.lazyPut<String>(
        () {
          return DateTime.now().toString();
        },
      );
      expect(Get.i.lazyClear(), 1);
    });
  });
}
