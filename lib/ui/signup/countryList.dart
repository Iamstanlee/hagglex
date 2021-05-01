import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hagglex/models/country.dart';
import 'package:hagglex/ui/signup/signupViewModel.dart';
import 'package:hagglex/utils/api.dart';
import 'package:hagglex/utils/helpers.dart';
import 'package:hagglex/utils/res.dart';
import 'package:hagglex/utils/spacing.dart';
import 'package:hagglex/widgets/busy.dart';
import 'package:hagglex/widgets/elevatedButton.dart';
import 'package:hagglex/utils/extensions.dart';
import 'package:provider/provider.dart';

class CountryListPage extends StatefulWidget {
  @override
  _CountryListPageState createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  List<Country> searchResult = [];
  @override
  void initState() {
    super.initState();
    if (context.read<SignupViewModel>().selectedCountry == null)
      Future.microtask(
          () => context.read<SignupViewModel>().getActiveCountries(context));
  }

  @override
  Widget build(BuildContext context) {
    SignupViewModel signupViewModel = context.watch<SignupViewModel>();
    final countries = signupViewModel.countriesResponse.data ?? [];

    return Busy(
      busy: signupViewModel.countriesResponse.status == Status.LOADING,
      msg: "Fetching supported countries...",
      child: Scaffold(
        backgroundColor: R.Colors.primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: HSpacing.lg.width),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 10),
                child: searchTextField(context, (query) {
                  setState(() {
                    searchResult = context
                        .read<SignupViewModel>()
                        .countriesResponse
                        .data
                        .where((country) => (country.name
                                .toLowerCase()
                                .contains(query.toLowerCase()) ||
                            country.callingCode.contains(query)))
                        .toList();
                  });
                }),
              ),
              Divider(color: R.Colors.primaryColorLight),
              if (signupViewModel.countriesResponse.status == Status.ERROR)
                Container(
                    margin: EdgeInsets.only(top: context.getHeight() / 3),
                    child: Elevatedbtn('RETRY', onTap: () {
                      signupViewModel.getActiveCountries(context);
                    })),
              if (searchResult.isEmpty) ...[
                for (var i = 0; i < countries.length; i++)
                  countryListItem(context, countries[i], onSelect: () {
                    signupViewModel.selectedCountry = countries[i];
                    pop(context);
                  }),
              ] else ...[
                for (var i = 0; i < searchResult.length; i++)
                  countryListItem(context, searchResult[i], onSelect: () {
                    signupViewModel.selectedCountry = searchResult[i];
                    pop(context);
                  })
              ]
            ],
          ),
        ),
      ),
    );
  }
}

Widget countryListItem(BuildContext context, Country country,
    {VoidCallback onSelect}) {
  return ListTile(
    title: Text(
      "(+${country?.callingCode ?? ""}) ${country?.name ?? ""})",
      style:
          Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),
    ),
    onTap: onSelect,
    horizontalTitleGap: 4,
    leading: SvgPicture.network(country?.flag, height: 14,
        placeholderBuilder: (context) {
      return ImageIcon(
        AssetImage(R.Icons.icRefresh),
        color: Colors.white,
        size: 14,
      );
    }),
  );
}

TextField searchTextField(BuildContext context, [Function(String) onChanged]) {
  return TextField(
    onChanged: onChanged,
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
