import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:test_golektruk/features/price/price_controller.dart';

import '../../../utils/fonts/app_font.dart';

class InterestTypeB extends HookConsumerWidget {
  const InterestTypeB({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final principalCtrl = useTextEditingController();
    // final priceController = ref.watch(priceControllerProvider);

    // final priceInRupiah =
    //     NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp ')
    //         .format(priceController);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sewa Kos"),
        titleTextStyle: AppFont.poppinsMedium.copyWith(
          fontSize: 16,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Belum Dikerjakan"),
      ),
    );
  }
}
