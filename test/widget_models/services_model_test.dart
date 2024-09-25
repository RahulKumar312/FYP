import 'package:flutter_test/flutter_test.dart';
import 'package:servant_industry_hiring/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ServicesModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}