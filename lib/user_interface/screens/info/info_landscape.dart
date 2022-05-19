import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/info/info_base.dart';

class InfoLandscape extends InfoBase {
  const InfoLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = UkodusDimentions.getWidth(context) / 3;
    final marginWidth = width / 3;

    return Center(
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(marginWidth),
          1: FixedColumnWidth(width),
          2: FixedColumnWidth(marginWidth),
          3: FixedColumnWidth(width),
          4: FixedColumnWidth(marginWidth),
        },
        children: [
          TableRow(
            children: _getRow1(context),
          ),
          TableRow(
            children: _getRow2(context),
          ),
          TableRow(
            children: _getRow3(context),
          )
        ],
      ),
    );
  }

  List<Widget> _getRow1(BuildContext context) {
    return [
      Container(),
      getInfo(
        context,
        InfoBase.developer,
        InfoBase.name,
      ),
      Container(),
      getInfo(
        context,
        InfoBase.version,
        InfoBase.versionNumber,
      ),
      Container(),
    ];
  }

  List<Widget> _getRow2(BuildContext context) {
    return const [
      SizedBox(height: UkodusDimentions.paddingBig),
      SizedBox(height: UkodusDimentions.paddingBig),
      SizedBox(height: UkodusDimentions.paddingBig),
      SizedBox(height: UkodusDimentions.paddingBig),
      SizedBox(height: UkodusDimentions.paddingBig),
    ];
  }

  List<Widget> _getRow3(BuildContext context) {
    return [
      Container(),
      getInfo(
        context,
        InfoBase.contact,
        InfoBase.emailAddress,
        getEmailButton(context),
      ),
      Container(),
      getInfo(
        context,
        InfoBase.designShort,
        InfoBase.fifa,
        getLinkButton(context),
      ),
      Container(),
    ];
  }
}
