import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobilelegendguide/client/champion_client.dart';
import 'package:mobilelegendguide/entity/champion.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FireBase',
      home: HomePage(title: "FireBase"),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Champion> champions = [];
  late int champCount = 0;

  void refresh() async {
    var championsFromDatabase = await ChampionClient.fetchAll();
    setState(() {
      champions = championsFromDatabase;
      champCount = champions.length;
    });
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            IconButton(
              onPressed: () async {
                refresh();
              },
              icon: const Icon(Icons.replay_rounded),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: champCount,
            itemBuilder: (context, index) {
              return buildEmployee(champions[index]);
            }));
  }

  Widget buildEmployee(Champion champ) => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: ListTile(
          title: Text(champ.name),
          subtitle: Text(champ.type),
        ),
      );
}
