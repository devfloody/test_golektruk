import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_golektruk/utils/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouterConfig = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'Test PT.Golektruk',
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: goRouterConfig,
    );
  }
}
