import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ioc.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/shared/ukodus_button.dart';
import 'package:ukodus/user_interface/shared/ukodus_panel.dart';

class InfoBase extends StatelessWidget {
  const InfoBase({Key? key}) : super(key: key);

  static const developer = 'Developer';
  static const name = 'Andrzej Przewodek';
  static const contact = 'Contact';
  static const emailAddress = 'a_przewodek@o2.pl';
  static const design = 'Design inspired by';
  static const designShort = 'Inspired by';
  static const fifa = 'FIFA World Cup Jersey App';
  static const version = 'Version';
  static const versionNumber = '1.0';

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget getInfo(BuildContext context, String header, String value,
      [Widget? buttons]) {
    return UkodusPanel(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getHeadder(context, header),
          _getValue(context, value),
        ],
      ),
      buttons: buttons,
    );
  }

  Widget _getHeadder(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(UkodusDimentions.padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.arrow_right,
            color: UkodusColors.fontDescription,
            size: UkodusDimentions.iconSize,
          ),
          Text(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: UkodusColors.fontDescription,
                ),
          ),
          const Icon(
            Icons.arrow_left,
            color: UkodusColors.fontDescription,
            size: UkodusDimentions.iconSize,
          ),
        ],
      ),
    );
  }

  Widget _getValue(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(UkodusDimentions.padding),
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: UkodusColors.font,
            ),
      ),
    );
  }

  Widget getEmailButton(BuildContext context) {
    return UkodusButton(
      icon: Icons.email,
      onTap: () {
        _sendEmail(context);
      },
    );
  }

  Widget getLinkButton(BuildContext context) {
    return UkodusButton(
      icon: Icons.web,
      onTap: () {
        _goToPage(context);
      },
    );
  }

  SnackBar _getSnackBar(String message) {
    return SnackBar(
      content: Text(message),
    );
  }

  Future<void> _sendEmail(BuildContext context) async {
    final result = await IoC().urlLauncher.goToEmailApp(emailAddress);

    if (!result) {
      final snackBar = _getSnackBar('Could not oped email application!');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> _goToPage(BuildContext context) async {
    final result = await IoC().urlLauncher.goToWebSite(
        'https://dribbble.com/shots/18155309-FIFA-World-Cup-Jersey-Store');

    if (!result) {
      final snackBar = _getSnackBar('Could not oped web browser!');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
