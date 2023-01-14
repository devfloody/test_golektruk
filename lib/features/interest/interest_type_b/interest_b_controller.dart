import 'package:hooks_riverpod/hooks_riverpod.dart';

class InterestTypeBNotifier extends StateNotifier<double> {
  InterestTypeBNotifier() : super(0);

  hitungBunga({required double principal}) {
    const months = 6;
    double rate;
    double admin;
    double interest;
    for (int i = 1; i <= months; i++) {
      if (principal >= 100000 && principal <= 500000) {
        rate = 0.02;
        admin = 1500;
        interest = (principal * rate);
        principal = principal + interest - admin;
        print("Month $i: Total savings = $principal");
      } else if (principal > 500000 && principal <= 10000000) {
        rate = 0.03;
        admin = 2000;
        interest = (principal * rate);
        principal = principal + interest - admin;
        print("Month $i: Total savings = $principal");
      } else if (principal > 10000000 && principal <= 50000000) {
        rate = 0.04;
        admin = 2500;
        interest = (principal * rate);
        principal = principal + interest - admin;
        print("Month $i: Total savings = $principal");
      } else if (principal > 50000000) {
        rate = 0.05;
        admin = 5000;
        interest = (principal * rate);
        principal = principal + interest - admin;
        print("Month $i: Total savings = $principal");
      }
    }
  }
}
