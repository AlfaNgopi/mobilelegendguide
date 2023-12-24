import 'package:flutter/material.dart';
import 'package:mobilelegendguide/client/champion_client.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/view/heroPages/champion_page.dart';

class ChampionSelectPage extends StatefulWidget {
  const ChampionSelectPage({super.key, required this.title});

  final String title;

  @override
  State<ChampionSelectPage> createState() => _ChampionSelectPageState();
}

class _ChampionSelectPageState extends State<ChampionSelectPage> {
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
        body: champCount == 0
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: champCount,
                itemBuilder: (context, index) {
                  return buildChampionList(champions[index]);
                }));
  }

  Widget buildChampionList(Champion champ) => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: ListTile(
          onTap: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChampionPage(
                          champion: champ,
                        )));
          },
          title: Text(champ.name),
          subtitle: Text(champ.type.name),
        ),
      );
}
