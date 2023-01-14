import 'package:flutter/material.dart';

import 'package:test_golektruk/features/user/user_model.dart';

import '../../utils/fonts/app_font.dart';

class UserSuccess extends StatelessWidget {
  const UserSuccess({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Success"),
        titleTextStyle: AppFont.poppinsMedium.copyWith(
          fontSize: 16,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: user != null
            ? Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nama : ${user!.name}",
                    style: AppFont.poppinsMedium.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Email : ${user!.email}",
                    style: AppFont.poppinsMedium.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Gender : ${user!.gender}",
                    style: AppFont.poppinsMedium.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Umur : ${user!.age}",
                    style: AppFont.poppinsMedium.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "No Telepon : ${user!.phone}",
                    style: AppFont.poppinsMedium.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Pendidikan : ${user!.education ?? '-'}",
                    style: AppFont.poppinsMedium.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            : Text(
                "Data User Kosong",
                style: AppFont.poppinsMedium.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
      ),
    );
  }
}
