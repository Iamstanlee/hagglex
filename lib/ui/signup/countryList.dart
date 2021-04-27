import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hagglex/utils/res.dart';
import 'package:hagglex/utils/spacing.dart';

class CountryListPage extends StatefulWidget {
  @override
  _CountryListPageState createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.Colors.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: HSpacing.lg.width),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 10),
              child: searchTextField(context),
            ),
            Divider(color: R.Colors.primaryColorLight),
            for (var i = 0; i < 20; i++) countryListItem(context, i)
          ],
        ),
      ),
    );
  }
}

Widget countryListItem(BuildContext context, int i) {
  return ListTile(
    title: Text(
      "(+$i) Nigeria",
      style:
          Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),
    ),
    horizontalTitleGap: 4,
    leading: Image.asset(R.Images.imCheck, height: 24),
  );
}

TextField searchTextField(BuildContext context, [TextEditingController ctrl]) {
  return TextField(
    controller: ctrl,
    style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),
    decoration: new InputDecoration(
        filled: true,
        fillColor: R.Colors.primaryColorLight,
        hintText: "Search for country",
        hintStyle:
            Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        isDense: true,
        contentPadding: EdgeInsets.only(left: 20),
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 12.0),
          child:
              Icon(CupertinoIcons.search, color: R.Colors.lightGrey, size: 24),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(50), right: Radius.circular(50))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(50), right: Radius.circular(50)))),
  );
}
