import 'package:hooks_riverpod/hooks_riverpod.dart';

class PriceController extends StateNotifier<int> {
  PriceController() : super(0);

  countPrice({required int numberOfDay}) {
    int pricePerDay = 10000;
    int pricePerWeek = 50000;
    int pricePerMonth = 180000;
    final afterMonth = numberOfDay % 30;
    final afterWeek = numberOfDay % 7;
    final numberOfMonth = numberOfDay ~/ 30;
    final numberOfWeek = numberOfDay ~/ 7;
    final numberOfWeekAfterMonth = afterMonth ~/ 7;

    if (numberOfDay >= 30 && numberOfDay <= 365) {
      if (afterMonth == 0) {
        if (numberOfMonth > 0) {
          state = pricePerMonth * numberOfMonth;
        }
      } else if (afterMonth > 0) {
        if (numberOfMonth > 0) {
          if (afterMonth % 7 == 0) {
            if (afterMonth ~/ 7 > 0) {
              state = pricePerMonth * numberOfMonth +
                  pricePerWeek * numberOfWeekAfterMonth;
            }
          } else if (afterMonth % 7 > 0) {
            if (afterMonth ~/ 7 > 0) {
              state = pricePerMonth * numberOfMonth +
                  pricePerWeek * numberOfWeekAfterMonth +
                  pricePerDay * (afterMonth % 7);
            } else {
              state = pricePerMonth * numberOfMonth +
                  pricePerWeek * numberOfWeekAfterMonth +
                  pricePerDay * (afterMonth % 7);
            }
          }
        }
      }
    } else if (numberOfDay >= 7) {
      if (afterWeek == 0) {
        if (numberOfWeek > 0) {
          state = pricePerWeek * numberOfWeek;
        }
      } else if (afterWeek > 0) {
        if (numberOfWeek > 0) {
          state = pricePerWeek * numberOfWeek + pricePerDay * afterWeek;
        }
      }
    } else {
      state = pricePerDay * numberOfDay;
    }
  }
}

final priceControllerProvider =
    StateNotifierProvider.autoDispose<PriceController, int>((ref) {
  return PriceController();
});
