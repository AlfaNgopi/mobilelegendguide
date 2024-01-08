// ignore_for_file: avoid_print
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobilelegendguide/debuggingneeds.dart';
import 'package:mobilelegendguide/static_data.dart';
import 'package:mobilelegendguide/view/components/analyticsPages/analytics_page.dart';
import 'package:mobilelegendguide/view/emblemPages/emblem_page.dart';
import 'package:mobilelegendguide/view/heroPages/championselect_page.dart';
import 'package:mobilelegendguide/view/itemPages/itemselect_page.dart';
import 'package:mobilelegendguide/view/mainPages/home_page.dart';
import 'package:mobilelegendguide/view/tierPages/tierlist_page.dart';
import 'package:mobilelegendguide/view/winratePages/winrate_Page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  StaticData.loadData().then((value) {
    print("Data loaded");
    // addDummyChampion();
    // addDummyEmblem();
    // uploadDataWinrate();
    // uploadDataChampion();
    // uploadDataItem();

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
        "/home": (context) => const HomePage(),
        "/champions": (context) => const ChampionSelectPage(),
        "/items": (context) => const ItemSelectPage(),
        "/emblems": (context) => const EmblemPage(),
        "/analytics": (context) => const AnalyticsPage(),
        "/tierlist": (context) => const TierListPage(),
        "/winrate": (context) => const WinratePage(),
      },
    );
  }
}
