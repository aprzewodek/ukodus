import 'package:flutter/material.dart';
import 'package:ukodus/business_logic/controllers/new_game_controller.dart';
import 'package:ukodus/data/enums/ukodus_type.dart';
import 'package:ukodus/data/models/level_model.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/new_game/new_game_landscape.dart';
import 'package:ukodus/user_interface/screens/new_game/new_game_portrait.dart';
import 'package:ukodus/user_interface/shared/screen_builder.dart';
import 'package:ukodus/user_interface/shared/ukodus_scaffold.dart';

class NewGameScreen extends StatefulWidget {
  static const routeName = '/new-game';

  const NewGameScreen({Key? key}) : super(key: key);

  @override
  State<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  bool _isLoaded = false;
  late List<LevelModel> _levels;
  late List<Tab> _tabs;
  final NewGameController _controller = NewGameController();

  @override
  void initState() {
    _loadLevels();

    _tabs = [
      Tab(child: _getTab('All')),
      Tab(child: _getTab('Classic')),
      Tab(child: _getTab('Diagonal')),
      Tab(child: _getTab('X')),
      Tab(child: _getTab('Hyper')),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: UkodusScaffold(
        title: 'New game',
        body: _getBody(),
        tabs: TabBar(tabs: _tabs),
      ),
    );
  }

  Widget _getBody() {
    if (!_isLoaded) {
      return const Center(child: CircularProgressIndicator());
    }

    return TabBarView(
      children: [
        _getTabBody(null),
        _getTabBody(UkodusType.classic),
        _getTabBody(UkodusType.diagonal),
        _getTabBody(UkodusType.x),
        _getTabBody(UkodusType.hyper),
      ],
    );
  }

  Widget _getTab(String text) {
    return Text(
      text,
      style: const TextStyle(color: UkodusColors.font),
    );
  }

  Widget _getTabBody(UkodusType? type) {
    final list = _levels
        .where((element) => element.type == type || type == null)
        .toList();

    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(UkodusDimentions.padding),
      itemBuilder: (context, index) {
        return ScreenBuilder(
          portraitWidget: NewGamePortrait(
            newGameController: _controller,
            model: list[index],
            onGameEnd: _reload,
          ),
          landscapeWidget: NewGameLandscape(
            newGameController: _controller,
            model: list[index],
            onGameEnd: _reload,
          ),
        );
      },
    );
  }

  Future<void> _loadLevels() async {
    _levels = await _controller.loadLevels();

    setState(() {
      _isLoaded = true;
    });
  }

  Future<void> _reload() async {
    setState(() {
      _isLoaded = false;
    });

    await _loadLevels();
  }
}
