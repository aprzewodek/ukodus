import 'package:flutter/material.dart';
import 'package:ukodus/app_router.dart';
import 'package:ukodus/user_interface/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ukodus',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
      home: const HomeScreen(),
    );
  }
}
