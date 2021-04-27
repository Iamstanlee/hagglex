import 'package:flutter/material.dart';
import 'package:hagglex/ui/dashboard/dashboard.dart';
import 'package:hagglex/utils/helpers.dart';
import 'package:hagglex/utils/res.dart';
import 'package:hagglex/utils/extensions.dart';
import 'package:hagglex/utils/spacing.dart';
import 'package:hagglex/widgets/elevatedButton.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData t = Theme.of(context);

    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(R.Images.imBackground),
          fit: BoxFit.cover,
        )),
        height: context.getHeight(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(R.Images.imCheck, height: 64),
                Padding(
                    padding: EdgeInsets.only(top: VSpacing.md.height),
                    child: Text('Setup Complete',
                        style: t.textTheme.bodyText1
                            .copyWith(color: Colors.white))),
                Padding(
                    padding: EdgeInsets.only(top: VSpacing.sm.height),
                    child: Text('Thank you for setting up your HaggleX account',
                        style:
                            t.textTheme.caption.copyWith(color: Colors.white))),
              ],
            ),
            PositionedDirectional(
                bottom: VSpacing.xxl.height + 8,
                start: 0,
                end: 0,
                child: Elevatedbtn('START EXPLORING', onTap: () {
                  push(context, route: DashboardPage(), popPrev: true);
                }))
          ],
        ),
      ),
    );
  }
}
