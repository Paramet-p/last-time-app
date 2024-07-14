//import 'package:lasttime_app/items/model.dart';

sealed class LastTimeEvent {}

class LoadEvent extends LastTimeEvent {}

class AddItemEvent extends LastTimeEvent {}

class RemoveEvent extends LastTimeEvent {
  int index;

  RemoveEvent(this.index);
}

class SearchEvent extends LastTimeEvent {
  String search;

  SearchEvent(this.search);
}

class LastTimeActionEvent extends LastTimeEvent {
  final int id;
  final DateTime lastTimeAction;

  LastTimeActionEvent(this.id, this.lastTimeAction);
}