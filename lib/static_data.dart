import 'package:flutter/material.dart';
import 'package:mobilelegendguide/client/champion_client.dart';
import 'package:mobilelegendguide/client/emblem_client.dart';
import 'package:mobilelegendguide/client/item_client.dart';
import 'package:mobilelegendguide/client/lane_client.dart';
import 'package:mobilelegendguide/client/news_Client.dart';
import 'package:mobilelegendguide/client/spell_client.dart';
import 'package:mobilelegendguide/client/type_client.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/entity/emblem.dart';
import 'package:mobilelegendguide/entity/item.dart';
import 'package:mobilelegendguide/entity/lane.dart';
import 'package:mobilelegendguide/entity/news/news.dart';
import 'package:mobilelegendguide/entity/spell.dart';
import 'package:mobilelegendguide/entity/type.dart';

class StaticData {
  static List<Champion> champions = [];
  static List<Lane> lanes = [];
  static List<Type> types = [];
  static List<Emblem> emblems = [];
  static List<Item> items = [];
  static List<Spell> spells = [];
  static List<News> news = [];

  static loadData() async {
    await _loadLanes();
    await _loadTypes();
    await _loadSpeels();
    await _loadEmblems();
    await _loadItems();
    await _loadChampions();
    await getNews();
  }

  static _loadChampions() async {
    champions = await ChampionClient.fetchAll();
    for (Champion champ in champions) {
      await champ.setStrongAgainstFromStaticData();
      await champ.setWeakAgainstFromStaticData();
    }
  }

  static Future<List<News>> getNews() async {
    if (news.isEmpty) {
      await _loadNews();
    }
    return news;
  }

  static _loadNews() async {
    List<News> newss2 = await NewsClient.fetchNews();
    for (News patch in newss2) {
      await patch.changeThumnailUrl();
      await patch.changeUrl();
      news.add(patch);
    }

    
  }

  static _loadSpeels() async {
    spells = await SpellClient.fetchAll();
  }

  static _loadLanes() async {
    lanes = await LaneClient.fetchAll();
  }

  static _loadTypes() async {
    types = await TypeClient.fetchAll();
  }

  static _loadEmblems() async {
    emblems = await EmblemClient.fetchAll();
  }

  static _loadItems() async {
    items = await ItemClient.fetchAll();
  }

  //Style UI

  static Color get backgroundColor => const Color.fromRGBO(0, 71, 110, 1);
  static Color get cardColor => Colors.blue;
  static EdgeInsetsGeometry get cardsMargin => const EdgeInsets.all(10);

  static EdgeInsetsGeometry get cardsPadding => const EdgeInsets.all(10);

  static List<Image> get carrouselImages => [
        Image.network(news[0].thumnailDirectory),
        Image.network(news[1].thumnailDirectory),
        Image.network(news[2].thumnailDirectory),
      ];

  static TextStyle get selectTypeHero => const TextStyle(
        color: Colors.white,
        fontSize: 15,
      );

  static TextStyle get selectTypeHeroActive => const TextStyle(
        color: Colors.yellow,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.yellow,
            offset: Offset(0, 0),
          ),
        ],
      );

  static TextStyle get titleTextStyle => const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get menuTextStyle => const TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get priceTextStyle => const TextStyle(
        color: Colors.yellow,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get itemTitleStyle => const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w900,
      );

  static TextStyle get itemTypeTextStyle => const TextStyle(
        color: Colors.red,
        fontSize: 15,
        fontFamily: "Bungee",
        // shadows: [
        //   Shadow(
        //     blurRadius: 10.0,
        //     color: Colors.red,
        //     offset: Offset(0, 0),
        //   ),
        // ],
      );

  static TextStyle get sectionTitleTextStyle => const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get itemTipsTextStyle => const TextStyle(
        color: Colors.black,
        fontSize: 20,
      );

  static TextStyle get itemPassiveTitleTextStyle => const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontFamily: "Bungee",
      );
}
