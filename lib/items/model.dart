import 'package:equatable/equatable.dart';

class LastTimeItem extends Equatable {
  final int id;
  final String name;
  final int cycle;
  DateTime? lastTimeAction;
  late int leftDay;

  LastTimeItem(this.id, this.name, this.cycle) {
    leftDay = cycle;
  }

  @override
  List<Object?> get props => [id, lastTimeAction];
}