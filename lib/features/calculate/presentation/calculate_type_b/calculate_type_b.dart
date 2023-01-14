import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/fonts/app_font.dart';

class CalculateTypeB extends HookConsumerWidget {
  const CalculateTypeB({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Tipe B"),
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
