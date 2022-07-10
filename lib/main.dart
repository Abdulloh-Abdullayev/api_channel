import 'package:api_channel/constants/constants.dart';
import 'package:api_channel/models/news_model.dart';
import 'package:api_channel/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  /// flutter packages pub run build_runner build
  await Hive.initFlutter();
  Hive.registerAdapter(NewsModelAdapter());
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(SourceAdapter());
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home:  MyHomePage(),
    );
  }
}
