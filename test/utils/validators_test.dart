import 'package:hagglex/utils/validators.dart';
import 'package:test/test.dart';

void main() {
  group('Validators', () {
    List<String> weakPasswords = ["00000000", "abcdefgh", "passsword"];
    List<String> averagePasswords = ["hello12345", "AVERAGE123"];
    List<String> strongPasswords = [
      "@hello1230s0s0",
      "helloworld123",
      "@STRONG12345",
    ];

    test('Password should be weak', () {
      for (var password in weakPasswords) {
        expect(isPasswordStrong(password), PASSWORDSTRENGTH.WEAK);
      }
    });
    test('Password should be average', () {
      for (var password in averagePasswords) {
        expect(isPasswordStrong(password), PASSWORDSTRENGTH.AVERAGE);
      }
    });
    test('Password should be strong', () {
      for (var password in strongPasswords) {
        expect(isPasswordStrong(password), PASSWORDSTRENGTH.STRONG);
      }
    });
  });
}
