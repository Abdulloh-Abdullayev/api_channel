import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {

  static String apiKeyForNews = dotenv.env['API_KEY_FOR_NEWS']!;

  static String kIpAdres = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKeyForNews";

  static Color kPrimaryColor = const Color(0XFF252154);

  MaterialColor color = MaterialColor(0XFF693EFF, {});

  static ThemeData lightTheme = ThemeData(
    brightness:  Brightness.light,
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color:  Colors.white),
    )
  );

  static ThemeData darkTheme = ThemeData(
      brightness:  Brightness.dark,
      primarySwatch: Colors.blue,
      textTheme: const TextTheme(
        bodyText1: TextStyle(color:  Colors.white),
      )
  );

}