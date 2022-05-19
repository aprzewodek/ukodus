import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/info/info_base.dart';

class InfoPortrait extends InfoBase {
  const InfoPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: UkodusDimentions.getWidth(context) * 0.9,
        child: Column(
          children: _getContent(context),
        ),
      ),
    );
  }

  List<Widget> _getContent(BuildContext context) {
    return [
      const Spacer(),
      getInfo(
        context,
        InfoBase.developer,
        InfoBase.name,
      ),
      const Spacer(),
      getInfo(
        context,
        InfoBase.contact,
        InfoBase.emailAddress,
        getEmailButton(context),
      ),
      const Spacer(),
      getInfo(
        context,
        InfoBase.design,
        InfoBase.fifa,
        getLinkButton(context),
      ),
      const Spacer(),
      getInfo(
        context,
        InfoBase.version,
        InfoBase.versionNumber,
      ),
      const Spacer(),
    ];
  }
}
