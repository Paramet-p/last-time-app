import 'package:lasttime_app/items/model.dart';

const List<LastTimeItem> empty = [];

sealed class LastTimeState {
  List<LastTimeItem> items;

  LastTimeState(this.items);
}

class LoadingState extends LastTimeState {
  LoadingState(): super(empty);
}

class LoadDoneState extends LastTimeState {
  LoadDoneState(super.items);
}

class SearchItemState extends LastTimeState {
  SearchItemState(super.items);
}