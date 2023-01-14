import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:test_golektruk/features/interest/interest_controller.dart';

import '../../../utils/fonts/app_font.dart';

class InterestTypeA extends HookConsumerWidget {
  const InterestTypeA({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final principalCtrl = useTextEditingController();
    const months = 6;
    final principal = ref.watch(interestNotifierProvider);
    final formKey = GlobalKey<FormState>();

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
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                controller: principalCtrl,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Jumlah tabungan harus diisi";
                  }
                  return null;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Masukkan Jumlah Tabungan",
                  hintStyle: AppFont.poppinsRegular.copyWith(fontSize: 14),
                  labelText: "Jumlah Tabungan",
                  labelStyle: AppFont.poppinsMedium,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    formKey.currentState!.validate();
                    if (principalCtrl.text.isNotEmpty) {
                      if (double.parse(principalCtrl.text) >= 100000.0) {
                        ref.read(interestNotifierProvider.notifier).hitungBunga(
                              principal: double.parse(principalCtrl.text),
                              months: months,
                            );
                        log(principal.toString());
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              contentPadding: const EdgeInsets.all(20),
                              title: const Text(
                                "Bunga selama 6 bulan",
                                textAlign: TextAlign.center,
                              ),
                              titleTextStyle: AppFont.poppinsMedium.copyWith(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              children: [
                                SizedBox(
                                  height: 140,
                                  child: ListView.builder(
                                    itemCount: principal.length,
                                    itemBuilder: (context, index) {
                                      final investPerMonth = principal[index];
                                      final idrFormat = NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp. ',
                                          decimalDigits: 2);
                                      final investInIdr =
                                          idrFormat.format(investPerMonth);
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Bulan ke ${index + 1} : "),
                                          Text(investInIdr),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
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
      ),
    );
  }
}
