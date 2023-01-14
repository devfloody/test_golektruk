import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/fonts/app_font.dart';
import '../widgets/calculate_form.dart';

final checkProvider = StateProvider<List<bool>>((ref) {
  return [false, false, false];
});

class CalculateTypeA extends HookConsumerWidget {
  const CalculateTypeA({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final isChecked = ref.watch(checkProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Tipe A"),
        titleTextStyle: AppFont.poppinsMedium.copyWith(
          fontSize: 16,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: 3,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            value: isChecked[index],
            title: CalculateForm(
              controller: controller,
            ),
            onChanged: (value) {
              ref.read(checkProvider.notifier).state[index] = value!;
            },
          );
        },
      ),
    );
  }
}
