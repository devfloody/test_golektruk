import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_golektruk/utils/router/app_router.dart';
import 'package:test_golektruk/features/user/user_controller.dart';
import 'package:test_golektruk/features/user/user_form.dart';
import 'package:test_golektruk/features/user/user_model.dart';

import '../../utils/fonts/app_font.dart';

class UserView extends HookConsumerWidget {
  const UserView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameCtrl = useTextEditingController();
    final emailCtrl = useTextEditingController();
    final genderCtrl = useTextEditingController();
    final ageCtrl = useTextEditingController();
    final phoneCtrl = useTextEditingController();
    final educationCtrl = useTextEditingController();

    final formkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Form User"),
        titleTextStyle: AppFont.poppinsMedium.copyWith(
          fontSize: 16,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          children: [
            UserForm(
              controller: nameCtrl,
              placeholder: "Nama",
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Nama Tidak Boleh Kosong";
                } else if (value.length < 5) {
                  return "Jumlah Karakter minimal 5 karakter";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            UserForm(
              controller: emailCtrl,
              placeholder: "Email",
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email Tidak Boleh Kosong';
                } else if (!RegExp(
                        r'^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,63})$')
                    .hasMatch(value)) {
                  return 'Email Tidak Valid';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            UserForm(
              controller: genderCtrl,
              placeholder: "Jenis Kelamin",
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Jenis Kelamin Tidak Boleh Kosong';
                } else if (!value.toLowerCase().contains('pria') &&
                    !value.toLowerCase().contains('wanita')) {
                  return 'Jenis Kelamin hanya bisa diisi dengan Pria atau Wanita';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            UserForm(
              controller: ageCtrl,
              placeholder: "Umur",
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Umur Tidak Boleh Kosong";
                } else if (int.parse(value) < 10 || int.parse(value) > 100) {
                  return "Umur Tidak Sesuai Ketentuan";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            UserForm(
              controller: phoneCtrl,
              placeholder: "No Telepon",
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nomor Telepon Tidak Boleh Kosong';
                } else if (!value.startsWith('0') ||
                    value.length < 9 ||
                    value.length > 14) {
                  return 'Format nomor tidak sesuai';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            UserForm(
              controller: educationCtrl,
              placeholder: "Pendidikan",
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                } else if (value.length < 5) {
                  return 'Jumlah Karakter minimal 5 karakter';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  formkey.currentState!.validate();
                  if (nameCtrl.text.isNotEmpty &&
                          emailCtrl.text.isNotEmpty &&
                          genderCtrl.text.isNotEmpty &&
                          ageCtrl.text.isNotEmpty &&
                          phoneCtrl.text.isNotEmpty ||
                      educationCtrl.text.isNotEmpty) {
                    final user = UserModel.fromMap({
                      'name': nameCtrl.text,
                      'email': emailCtrl.text,
                      'gender': genderCtrl.text,
                      'age': ageCtrl.text,
                      'phone': phoneCtrl.text,
                      'education': educationCtrl.text,
                    });
                    ref
                        .read(userControllerProvider.notifier)
                        .submitUserData(user: user);
                    context.pushNamed(RouteName.formUserSuccess, extra: user);
                  }
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
