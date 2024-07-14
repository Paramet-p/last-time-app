import 'package:lasttime_app/items/model.dart';
import 'package:lasttime_app/items/repo.dart';

class LastTimeMockRepo extends LastTimeRepo {
  static List<LastTimeItem> items = [
    LastTimeItem(1, 'ซักผ้า', 3),
    LastTimeItem(2, 'ล้างห้องน้ำ', 7),
    LastTimeItem(3, 'เปลี่ยนทรายแมว', 30),
  ];

  static List<LastTimeItem> searchItems = [];

  static void addItem(LastTimeItem newItem) {
    items.add(newItem);
  }

  static void removeItem(int index) {
    items.removeAt(index);
  }

  @override
  List<LastTimeItem> searchItem(String search) {
    return items.where((item) => item.name.contains(search)).toList();
  }

  @override
  Future<List<LastTimeItem>> load() async {
    //await Future.delayed(const Duration(seconds: 1));
    items.sort((a, b) => a.leftDay.compareTo(b.leftDay));

    return items;
  }

  
}