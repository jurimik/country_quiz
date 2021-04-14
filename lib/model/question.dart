import 'dart:math';

import 'package:flutter/cupertino.dart';

class Question {
  final String imageUrl;
  final Country answer;
  String title;
  List<Country> additionCountries;
  Widget image;

  Question({this.imageUrl, this.answer}) {
    this.title = generateTitle();
    this.additionCountries = getAdditionalCountries();
    this.image = Image.asset('assets/images/' + imageUrl);
  }

  List<Country> getAdditionalCountries() {
    List<Country> countries = [];
    Random rand = Random();

    while (countries.length < 3) {
      Country country =
          Country.values.elementAt(rand.nextInt(Country.values.length));
      if (country == answer || countries.contains(country)) {
        continue;
      }
      countries.add(country);
    }

    return countries;
  }

  generateTitle() {
    return "Де це?";
  }
}

enum Country {
  Albania,
  Austria,
  Bosnia,
  Bulgaria,
  Croatia,
  Greece,
  Latvia,
  Lithuania,
  Macedonia,
  Montenegro,
  Poland,
  Ukraine
}

extension CountryExtension on Country {
  String getName() {
    switch (this) {
      case Country.Albania:
        return "Албанія";
      case Country.Austria:
        return "Австрія";
      case Country.Bosnia:
        return "Боснія і Герцеговина";
      case Country.Bulgaria:
        return "Болгарія";
      case Country.Croatia:
        return "Хорватія";
      case Country.Greece:
        return "Греція";
      case Country.Latvia:
        return "Латвія";
      case Country.Lithuania:
        return "Литва";
      case Country.Macedonia:
        return "Північна Македонія";
      case Country.Montenegro:
        return "Чорногорія";
      case Country.Poland:
        return "Польща";
      case Country.Ukraine:
        return "Україна";
    }

    return toString();
  }
}
