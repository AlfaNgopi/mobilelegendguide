import 'package:mobilelegendguide/client/champion_client.dart';
import 'package:mobilelegendguide/client/emblem_client.dart';
import 'package:mobilelegendguide/client/item_client.dart';
import 'package:mobilelegendguide/client/lane_client.dart';
import 'package:mobilelegendguide/client/type_client.dart';
import 'package:mobilelegendguide/entity/champion.dart';
import 'package:mobilelegendguide/entity/emblem.dart';
import 'package:mobilelegendguide/entity/item.dart';
import 'package:mobilelegendguide/entity/lane.dart';
import 'package:mobilelegendguide/entity/type.dart';

class StaticData {
  static List<Champion> champions = [];
  static List<Lane> lanes = [];
  static List<Type> types = [];
  static List<Emblem> emblems = [];
  static List<Item> items = [];

  static loadData() async {
    await _loadLanes();
    await _loadTypes();
    await _loadEmblems();
    await _loadItems();
    await _loadChampions();
  }

  static _loadChampions() async {
    champions = await ChampionClient.fetchAll();
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
}
