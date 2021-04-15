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
    print("${answer.getName()} file: $imageUrl");
    List<Country> countries = [];
    Random rand = Random();

    while (countries.length < 3) {
      Country country =
          Country.values.elementAt(rand.nextInt(Country.values.length));
      print("country for add: ${country.getName()}, answer: ${answer.getName()}");
      print("$countries");
      if (country == answer || countries.contains(country)) {
        print("continue");
        continue;
      }
      countries.add(country);
      print("${country.getName()} was added");
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
