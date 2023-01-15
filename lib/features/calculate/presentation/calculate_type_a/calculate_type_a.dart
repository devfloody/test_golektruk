import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_golektruk/features/calculate/presentation/calculate_type_a/calculate_type_a_controller.dart';

import '../../../../utils/fonts/app_font.dart';
import '../widgets/calculate_form.dart';

final check1Provider = StateProvider<bool>((ref) {
  return false;
});
final check2Provider = StateProvider<bool>((ref) {
  return false;
});
final check3Provider = StateProvider<bool>((ref) {
  return false;
});

class CalculateTypeA extends HookConsumerWidget {
  const CalculateTypeA({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculateA = ref.watch(calculateControllerProvider);
    final isChecked1 = ref.watch(check1Provider);
    final isChecked2 = ref.watch(check2Provider);
    final isChecked3 = ref.watch(check3Provider);

    final field1Ctrl = useTextEditingController();
    final field2Ctrl = useTextEditingController();
    final field3Ctrl = useTextEditingController();

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Tipe A"),
        titleTextStyle: AppFont.poppinsMedium.copyWith(
          fontSize: 16,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          // padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          children: [
            CheckboxListTile(
              value: isChecked1,
              title: CalculateForm(
                controller: field1Ctrl,
                validator: (value) {
                  if (isChecked1 == true) {
                    if (value == null || value.isEmpty) {
                      return "Field Wajib diisi";
                    }
                  }
                  return null;
                },
              ),
              onChanged: (value) {
                ref.read(check1Provider.notifier).state = !ref.read(check1Provider.notifier).state;
              },
            ),
            CheckboxListTile(
              value: isChecked2,
              title: CalculateForm(
                controller: field2Ctrl,
                validator: (value) {
                  if (isChecked2 == true) {
                    if (value == null || value.isEmpty) {
                      return "Field Wajib diisi";
                    }
                  }
                  return null;
                },
              ),
              onChanged: (value) {
                ref.read(check2Provider.notifier).state = !ref.read(check2Provider.notifier).state;
              },
            ),
            CheckboxListTile(
              value: isChecked3,
              title: CalculateForm(
                controller: field3Ctrl,
                validator: (value) {
                  if (isChecked3 == true) {
                    if (value == null || value.isEmpty) {
                      return "Field Wajib diisi";
                    }
                  }
                  return null;
                },
              ),
              onChanged: (value) {
                ref.read(check3Provider.notifier).state = !ref.read(check3Provider.notifier).state;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (isChecked1 && isChecked2 && isChecked3) {
                          ref.read(calculateControllerProvider.notifier).add(
                              field1: double.tryParse(field1Ctrl.text),
                              field2: double.tryParse(field2Ctrl.text),
                              field3: double.tryParse(field3Ctrl.text));
                        } else if (isChecked1 && isChecked2) {
                          ref
                              .read(calculateControllerProvider.notifier)
                              .add(field1: double.tryParse(field1Ctrl.text), field2: double.tryParse(field2Ctrl.text));
                        } else if (isChecked1 && isChecked3) {
                          ref
                              .read(calculateControllerProvider.notifier)
                              .add(field1: double.tryParse(field1Ctrl.text), field3: double.tryParse(field3Ctrl.text));
                        } else if (isChecked2 && isChecked3) {
                          ref
                              .read(calculateControllerProvider.notifier)
                              .add(field3: double.tryParse(field3Ctrl.text), field2: double.tryParse(field2Ctrl.text));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Operasi penambahan tidak dapat dijalankan"),
                            ),
                          );
                        }
                      }
                    },
                    child: const Icon(Icons.add),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (isChecked1 && isChecked2 && isChecked3) {
                          ref.read(calculateControllerProvider.notifier).minus(
                              field1: double.tryParse(field1Ctrl.text),
                              field2: double.tryParse(field2Ctrl.text),
                              field3: double.tryParse(field3Ctrl.text));
                        } else if (isChecked1 && isChecked2) {
                          ref.read(calculateControllerProvider.notifier).minus(
                              field1: double.tryParse(field1Ctrl.text), field2: double.tryParse(field2Ctrl.text));
                        } else if (isChecked1 && isChecked3) {
                          ref.read(calculateControllerProvider.notifier).minus(
                              field1: double.tryParse(field1Ctrl.text), field3: double.tryParse(field3Ctrl.text));
                        } else if (isChecked2 && isChecked3) {
                          ref.read(calculateControllerProvider.notifier).minus(
                              field3: double.tryParse(field3Ctrl.text), field2: double.tryParse(field2Ctrl.text));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Operasi pengurangan tidak dapat dijalankan"),
                            ),
                          );
                        }
                      }
                    },
                    child: const Icon(Icons.remove),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (isChecked1 && isChecked2 && isChecked3) {
                          ref.read(calculateControllerProvider.notifier).fold(
                              field1: double.tryParse(field1Ctrl.text),
                              field2: double.tryParse(field2Ctrl.text),
                              field3: double.tryParse(field3Ctrl.text));
                        } else if (isChecked1 && isChecked2) {
                          ref
                              .read(calculateControllerProvider.notifier)
                              .fold(field1: double.tryParse(field1Ctrl.text), field2: double.tryParse(field2Ctrl.text));
                        } else if (isChecked1 && isChecked3) {
                          ref
                              .read(calculateControllerProvider.notifier)
                              .fold(field1: double.tryParse(field1Ctrl.text), field3: double.tryParse(field3Ctrl.text));
                        } else if (isChecked2 && isChecked3) {
                          ref
                              .read(calculateControllerProvider.notifier)
                              .fold(field3: double.tryParse(field3Ctrl.text), field2: double.tryParse(field2Ctrl.text));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Operasi perkalian tidak dapat dijalankan"),
                            ),
                          );
                        }
                      }
                    },
                    child: const Icon(Icons.close),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (isChecked1 && isChecked2 && isChecked3) {
                          ref.read(calculateControllerProvider.notifier).divide(
                              field1: double.tryParse(field1Ctrl.text),
                              field2: double.tryParse(field2Ctrl.text),
                              field3: double.tryParse(field3Ctrl.text));
                        } else if (isChecked1 && isChecked2) {
                          ref.read(calculateControllerProvider.notifier).divide(
                              field1: double.tryParse(field1Ctrl.text), field2: double.tryParse(field2Ctrl.text));
                        } else if (isChecked1 && isChecked3) {
                          ref.read(calculateControllerProvider.notifier).divide(
                              field1: double.tryParse(field1Ctrl.text), field3: double.tryParse(field3Ctrl.text));
                        } else if (isChecked2 && isChecked3) {
                          ref.read(calculateControllerProvider.notifier).divide(
                              field3: double.tryParse(field3Ctrl.text), field2: double.tryParse(field2Ctrl.text));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Operasi pembagian tidak dapat dijalankan"),
                            ),
                          );
                        }
                      }
                    },
                    child: Text(
                      '÷',
                      style: AppFont.poppinsRegular.copyWith(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
