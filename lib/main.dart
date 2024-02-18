import 'package:cogniquiz_offline/app_data.dart';
import 'package:cogniquiz_offline/pages/nav_page.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppData()),
    ],
    child: MyApp(),
  ));
}
/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppData())
     //1) creates an instance of a ChangeNotifier (FoldersData() here). 
     //2) makes the ChangeNotifier available to all descendant widgets in the widget tree
    ],
    child: MyApp(),
  ));
}*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CogniQuiz",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: NavPage(),
    );
  }
}
