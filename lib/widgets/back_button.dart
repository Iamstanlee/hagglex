import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hagglex/utils/helpers.dart';
import 'package:hagglex/utils/res.dart';
import 'package:hagglex/utils/spacing.dart';

class BackBtn extends StatelessWidget {
  final VoidCallback onTap;
  BackBtn({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap ?? pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: R.Colors.primaryColorLight,
            borderRadius: BorderRadiusDirectional.horizontal(
                start: Radius.circular(20), end: Radius.circular(20))),
        padding: EdgeInsets.symmetric(
            vertical: VSpacing.sm.height, horizontal: HSpacing.md.width - 4),
        child: Icon(CupertinoIcons.chevron_left, color: Colors.white),
      ),
    );
  }
}
