import 'package:lasttime_app/items/model.dart';

abstract class LastTimeRepo {
  List<LastTimeItem> searchItem(String search);
  Future<List<LastTimeItem>> load();
}