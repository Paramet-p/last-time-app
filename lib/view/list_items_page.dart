import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime_app/bloc/last_time_barrel.dart';
import 'package:lasttime_app/view/add_item_list.dart';
import 'package:lasttime_app/view/list_items.dart';

class ListItemsPage extends StatelessWidget {
  const ListItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastTimeBloc, LastTimeState>(
      builder: (context, state) {
        return state is LoadingState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const Column(
                children: [
                  AddItemList(),
                  Expanded(child: ListItems()),
                ],
              );
      },
    );
  }
}
