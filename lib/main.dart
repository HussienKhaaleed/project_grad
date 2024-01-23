import 'package:flutter/material.dart';
import 'package:project_test/core/routers/app_router.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        // scaffoldBackgroundColor: const Color.fromARGB(240, 242, 255, 255),
      ),
    );
  }
}
