import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_golektruk/features/interest/interest_type_a/interest_a_controller.dart';
import 'package:intl/intl.dart';

import '../../../utils/fonts/app_font.dart';

class InterestTypeA extends HookConsumerWidget {
  const InterestTypeA({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final principalCtrl = useTextEditingController();
    const months = 6;
    final principal = ref.watch(interestTypeAProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hitung Bunga Tipe A"),
        titleTextStyle: AppFont.poppinsMedium.copyWith(
          fontSize: 16,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextFormField(
              controller: principalCtrl,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Masukkan Jumlah Tabungan",
                hintStyle: AppFont.poppinsRegular.copyWith(fontSize: 14),
                labelText: "Jumlah Tabungan",
                labelStyle: AppFont.poppinsMedium,
              ),
            ),
            ListView.builder(
              itemCount: months,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final priceInRupiah = NumberFormat.currency(
                        locale: 'id', decimalDigits: 2, symbol: 'Rp ')
                    .format(principal);
                return Text("Bulan ke $index = $priceInRupiah");
              },
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  if (principalCtrl.text.isNotEmpty) {
                    if (double.parse(principalCtrl.text) >= 100000.0) {
                      ref.read(interestTypeAProvider.notifier).hitungBunga(
                            principal: double.parse(principalCtrl.text),
                            months: months,
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Jumlah Tabungan dibawah ketentuan"),
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  "Hitung Bunga",
                  style: AppFont.poppinsSemiBold.copyWith(fontSize: 14),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
