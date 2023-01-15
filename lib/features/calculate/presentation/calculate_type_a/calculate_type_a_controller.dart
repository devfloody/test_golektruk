import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalculateTypeANotifier extends StateNotifier<double> {
  CalculateTypeANotifier() : super(0);

  add({double? field1, double? field2, double? field3}) {
    if (field1 != null && field2 != null && field3 != null) {
      state = field1 + field2 + field3;
      log("$state");
    } else if (field1 != null && field2 != null) {
      state = field1 + field2;
      log("$state");
    } else if (field3 != null && field2 != null) {
      state = field3 + field2;
      log("$state");
    } else if (field1 != null && field3 != null) {
      state = field1 + field3;
      log("$state");
    }
  }

  minus({double? field1, double? field2, double? field3}) {
    if (field1 != null && field2 != null && field3 != null) {
      state = field1 - field2 - field3;
      log("$state");
    } else if (field1 != null && field2 != null) {
      state = field1 - field2;
      log("$state");
    } else if (field3 != null && field2 != null) {
      state = field2 - field3;
      log("$state");
    } else if (field1 != null && field3 != null) {
      state = field1 - field3;
      log("$state");
    }
  }

  fold({double? field1, double? field2, double? field3}) {
    if (field1 != null && field2 != null && field3 != null) {
      state = field1 * field2 * field3;
      log("$state");
    } else if (field1 != null && field2 != null) {
      state = field1 * field2;
      log("$state");
    } else if (field3 != null && field2 != null) {
      state = field2 * field3;
      log("$state");
    } else if (field1 != null && field3 != null) {
      state = field1 * field3;
      log("$state");
    }
  }

  divide({double? field1, double? field2, double? field3}) {
    if (field1 != null && field1 != 0.0 && field2 != null && field2 != 0.0 && field3 != null && field3 != 0.0) {
      state = field1 / field2 / field3;
      log("$state");
    } else if (field1 != null && field1 != 0.0 && field2 != null && field2 != 0.0) {
      state = field1 / field2;
      log("$state");
    } else if (field3 != null && field3 != 0.0 && field2 != null && field2 != 0.0) {
      state = field2 / field3;
      log("$state");
    } else if (field1 != null && field1 != 0.0 && field3 != null && field3 != 0.0) {
      state = field1 / field3;
      log("$state");
    }
  }
}

final calculateControllerProvider = StateNotifierProvider<CalculateTypeANotifier, double>((ref) {
  return CalculateTypeANotifier();
});
