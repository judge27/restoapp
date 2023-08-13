import 'package:hive/hive.dart';

import 'boxes.dart';

class HiveHelper {

  static List<String> infoList = ["Home","Office"];

  static void addToList(String title) async {
    infoList.add(title);
    await Hive.box(infoBox).put(infoBox, infoList);
  }

  static void removeFromList(int index) async {
    infoList.removeAt(index);
    await Hive.box(infoBox).put(infoBox, infoList);
  }

  static Future getInfo() async {
   await Future.delayed(Duration(seconds: 3)).then((value) {
      infoList =  Hive.box(infoBox).get(infoBox);
    });
  }
}