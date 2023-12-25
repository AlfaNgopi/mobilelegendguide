import 'package:mobilelegendguide/client/item_client.dart';
import 'package:mobilelegendguide/entity/item.dart';
import 'package:mobilelegendguide/static_data.dart';

class Build {
  String name;

  String description;
  late Item item1;
  late Item item2;
  late Item item3;
  late Item item4;
  late Item item5;
  late Item item6;

  String? _itemName1;
  String? _itemName2;
  String? _itemName3;
  String? _itemName4;
  String? _itemName5;
  String? _itemName6;

  Build({
    required this.name,
    required this.description,
    required String itemName1,
    required String itemName2,
    required String itemName3,
    required String itemName4,
    required String itemName5,
    required String itemName6,
  }) {
    _itemName1 = itemName1;
    _itemName2 = itemName2;
    _itemName3 = itemName3;
    _itemName4 = itemName4;
    _itemName5 = itemName5;
    _itemName6 = itemName6;

    setItemsFromStaticData(
        itemName1, itemName2, itemName3, itemName4, itemName5, itemName6);
  }

  setItems(String itemName1, String itemName2, String itemName3,
      String itemName4, String itemName5, String itemName6) async {
    item1 = await ItemClient.fetchItem(itemName1);
    item2 = await ItemClient.fetchItem(itemName2);
    item3 = await ItemClient.fetchItem(itemName3);
    item4 = await ItemClient.fetchItem(itemName4);
    item5 = await ItemClient.fetchItem(itemName5);
    item6 = await ItemClient.fetchItem(itemName6);
  }

  setItemsFromStaticData(String itemName1, String itemName2, String itemName3,
      String itemName4, String itemName5, String itemName6) {
    item1 = StaticData.items.firstWhere((item) => item.name == itemName1);
    item2 = StaticData.items.firstWhere((item) => item.name == itemName2);
    item3 = StaticData.items.firstWhere((item) => item.name == itemName3);
    item4 = StaticData.items.firstWhere((item) => item.name == itemName4);
    item5 = StaticData.items.firstWhere((item) => item.name == itemName5);
    item6 = StaticData.items.firstWhere((item) => item.name == itemName6);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'desc': description,
        'item1': _itemName1,
        'item2': _itemName2,
        'item3': _itemName3,
        'item4': _itemName4,
        'item5': _itemName5,
        'item6': _itemName6,
      };

  static Build fromJson(Map<String, dynamic> json) => Build(
        name: json['name'],
        description: json['desc'],
        itemName1: json['item1'],
        itemName2: json['item2'],
        itemName3: json['item3'],
        itemName4: json['item4'],
        itemName5: json['item5'],
        itemName6: json['item6'],
      );
}
