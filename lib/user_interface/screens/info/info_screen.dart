import 'package:flutter/material.dart';
import 'package:ukodus/user_interface/screens/info/info_landscape.dart';
import 'package:ukodus/user_interface/screens/info/info_portrait.dart';
import 'package:ukodus/user_interface/shared/screen_builder.dart';
import 'package:ukodus/user_interface/shared/ukodus_scaffold.dart';

class InfoScreen extends StatefulWidget {
  static const routeName = '/info-screen';

  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return const UkodusScaffold(
      title: 'Information',
      body: ScreenBuilder(
        portraitWidget: InfoPortrait(),
        landscapeWidget: InfoLandscape(),
      ),
    );
  }
}
