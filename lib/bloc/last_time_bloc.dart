import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime_app/bloc/last_time_event.dart';
import 'package:lasttime_app/bloc/last_time_state.dart';
import 'package:lasttime_app/items/repo.dart';

class LastTimeBloc extends Bloc<LastTimeEvent, LastTimeState> {
  LastTimeRepo repo;

  LastTimeBloc(this.repo): super(LoadingState()) {
    on<LoadEvent>(_onLoad);
    on<SearchEvent>(_onSearch);
    on<RemoveEvent>(_onRemove);
  }

  _onLoad(LoadEvent event, Emitter<LastTimeState> emit) async {
    var items = await repo.load();

    emit(LoadDoneState(items));
  }

  _onSearch(SearchEvent event, Emitter<LastTimeState> emit) async {
    var items = repo.searchItem(event.search);

    emit(LoadDoneState(items));
  }

  _onRemove(RemoveEvent event, Emitter<LastTimeState> emit) {
    
  }
}