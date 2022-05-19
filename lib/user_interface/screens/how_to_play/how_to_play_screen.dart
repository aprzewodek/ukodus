import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page01.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page02.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page03.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page03a.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page03b.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page03c.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page04.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page05.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page06.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page07.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page08.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page09.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page10.dart';
import 'package:ukodus/user_interface/shared/ukodus_scaffold.dart';

class HowToPlayScreen extends StatefulWidget {
  static const routeName = '/how-to-play';

  const HowToPlayScreen({Key? key}) : super(key: key);

  @override
  State<HowToPlayScreen> createState() => _HowToPlayScreenState();
}

class _HowToPlayScreenState extends State<HowToPlayScreen> {
  final _controller = LiquidController();

  int _numberOfPages = 0;

  @override
  Widget build(BuildContext context) {
    return UkodusScaffold(
      title: 'How to play',
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Stack(
      children: [
        _getHelpWidget(),
        _getNavigation(),
      ],
    );
  }

  Widget _getHelpWidget() {
    return LiquidSwipe(
      pages: _getPages(),
      enableSideReveal: true,
      slideIconWidget: _getSlideIcon(),
      liquidController: _controller,
      onPageChangeCallback: (index) {
        setState(() {});
      },
    );
  }

  Widget _getSlideIcon() {
    return const Icon(
      Icons.arrow_back,
      color: Colors.white,
    );
  }

  Widget _getNavigation() {
    return Positioned(
      bottom: UkodusDimentions.padding,
      left: UkodusDimentions.paddingBig,
      right: UkodusDimentions.paddingBig * 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getTextButton('Skip', _skip, false),
          _getPageIndicator(),
          _getTextButton('Next', _next, true),
        ],
      ),
    );
  }

  Widget _getTextButton(String text, VoidCallback onTap, bool blockLast) {
    final enabled = _controller.currentPage != _numberOfPages - 1 || !blockLast;

    return TextButton(
      onPressed: enabled ? onTap : null,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: enabled ? UkodusColors.font : UkodusColors.fontDescription,
        ),
      ),
    );
  }

  Widget _getPageIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: _controller.currentPage,
      count: _numberOfPages,
      effect: const WormEffect(
        dotColor: UkodusColors.font,
        activeDotColor: UkodusColors.fontGame,
      ),
      onDotClicked: _goToPage,
    );
  }

  List<Widget> _getPages() {
    const pages = [
      Page01(),
      Page02(),
      Page03(),
      Page03a(),
      Page03b(),
      Page03c(),
      Page04(),
      Page05(),
      Page06(),
      Page07(),
      Page08(),
      Page09(),
      Page10(),
    ];

    _numberOfPages = pages.length;

    return pages;
  }

  void _skip() {
    Navigator.of(context).pop();
  }

  void _next() {
    final page = _controller.currentPage + 1;
    final lastPage = _numberOfPages - 1;
    _controller.animateToPage(page: page > lastPage ? 0 : page);
  }

  void _goToPage(int pageIndex) {
    _controller.animateToPage(
      page: pageIndex,
      duration: 300,
    );
  }
}
