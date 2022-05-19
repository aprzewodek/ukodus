import 'package:flutter/material.dart';
import 'package:ukodus/user_interface/screens/home/home_landscape.dart';
import 'package:ukodus/user_interface/screens/home/home_portrait.dart';
import 'package:ukodus/user_interface/shared/screen_builder.dart';
import 'package:ukodus/user_interface/shared/ukodus_scaffold.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const UkodusScaffold(
      body: ScreenBuilder(
        portraitWidget: HomePortrait(),
        landscapeWidget: HomeLandscape(),
      ),
    );
  }
}
