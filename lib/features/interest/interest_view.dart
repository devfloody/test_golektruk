import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/fonts/app_font.dart';
import '../../utils/router/app_router.dart';
import '../../utils/widgets/menu_item.dart';

class InterestView extends HookConsumerWidget {
  const InterestView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hitung Bunga"),
        titleTextStyle: AppFont.poppinsMedium.copyWith(
          fontSize: 16,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: const EdgeInsets.all(50),
          children: [
            MenuButtonItem(
              color: Colors.deepOrange,
              title: "Hitung Bunga",
              questionNumber: "A",
              onPressed: () => context.pushNamed(RouteName.interestTypeA),
            ),
            MenuButtonItem(
              color: Colors.deepPurple,
              title: "Hitung Bunga",
              questionNumber: "B",
              onPressed: () => context.pushNamed(RouteName.interestTypeB),
            ),
          ],
        ),
      ),
    );
  }
}
