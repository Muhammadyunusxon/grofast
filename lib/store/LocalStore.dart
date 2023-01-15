import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStore{
  LocalStore._();
  static setLikes(int id) async {
    SharedPreferences local= await SharedPreferences.getInstance();
    List<String> lst= await local.getStringList('likes') ?? [];
    lst.add(id.toString());
    local.setStringList('likes', lst);

  }

  static Future<List<int>> getLikes() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList('likes') ?? [];
    List<int> newList =list.map((element) => int.parse(element)).toList();
    return newList;
  }

  static removeLikes(int id) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList('likes') ?? [];
    list.removeWhere((element) => element==id.toString());
    store.setStringList('likes', list);
  }

}