import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobilelegendguide/debuggingNeeds.dart';
import 'package:mobilelegendguide/static_data.dart';
import 'package:mobilelegendguide/view/heroPages/championselect_page.dart';
import 'package:mobilelegendguide/view/mainPages/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  StaticData.loadData().then((value) {
    print("Data loaded");
    // addDummyChampion();

    runApp(const MainApp());
  }).catchError((error) {
    print("Error loading data: $error");
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FireBase',
      home: const HomePage(),
      routes: {
        "/home": (context) => HomePage(),
        "/champions": (context) => ChampionSelectPage(),
      },
    );
  }
}
