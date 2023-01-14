import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_golektruk/utils/fonts/app_font.dart';

import '../../utils/router/app_router.dart';
import '../../utils/widgets/menu_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test PT.Golektruk"),
        titleTextStyle: AppFont.poppinsMedium.copyWith(
          fontSize: 16,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(50),
        children: [
          MenuButtonItem(
            color: Colors.deepOrange,
            title: "Sewa Kos",
            questionNumber: "1",
            onPressed: () => context.pushNamed(RouteName.formPrice),
          ),
          MenuButtonItem(
            color: Colors.deepPurple,
            title: "Hitung Bunga",
            questionNumber: "2",
            onPressed: () => context.pushNamed(RouteName.formInterest),
          ),
          MenuButtonItem(
            color: Colors.deepPurple,
            title: "Kalkulator",
            questionNumber: "3",
            onPressed: () => context.pushNamed(RouteName.formCalculator),
          ),
          MenuButtonItem(
            color: Colors.deepOrange,
            title: "User Data",
            questionNumber: "4",
            onPressed: () => context.pushNamed(RouteName.formUser),
          ),
        ],
      ),
    );
  }
}
