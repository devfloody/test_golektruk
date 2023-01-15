import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:test_golektruk/features/price/price_controller.dart';

import '../../utils/fonts/app_font.dart';

class PriceView extends HookConsumerWidget {
  const PriceView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rentalDayCtrl = useTextEditingController();
    final priceController = ref.watch(priceControllerProvider);
    final formKey = GlobalKey<FormState>();

    final priceInRupiah = NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp ').format(priceController);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sewa Kos"),
        titleTextStyle: AppFont.poppinsMedium.copyWith(
          fontSize: 16,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: rentalDayCtrl,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Lama sewa harus diisi terlebih dahulu";
                  }
                  return null;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Masukkan Lama Sewa Kos (hari)",
                  hintStyle: AppFont.poppinsRegular.copyWith(fontSize: 14),
                  labelText: "Lama Sewa Kos",
                  labelStyle: AppFont.poppinsMedium,
                ),
              ),
              Text("Harga Kos = $priceInRupiah"),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (int.parse(rentalDayCtrl.text) <= 365) {
                        ref.read(priceControllerProvider.notifier).countPrice(
                              numberOfDay: int.parse(rentalDayCtrl.text),
                            );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Jumlah hari melebihi batas ketentuan"),
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    "Cek Harga Kos",
                    style: AppFont.poppinsSemiBold.copyWith(fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
