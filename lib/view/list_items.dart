import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime_app/bloc/last_time_barrel.dart';
import 'package:lasttime_app/items/mock.dart';

class ListItems extends StatelessWidget {
  const ListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var items = context.select((LastTimeBloc bloc) => bloc.state.items);
    //final searchController = TextEditingController();

    return BlocBuilder<LastTimeBloc, LastTimeState>(
      builder: (context, state) {
        debugPrint('rebuild $state');
        return items.isEmpty
            ? const Center(
                child: Text(
                'ไม่มีรายการที่ต้องทำ',
                style: TextStyle(fontSize: 32),
              ))
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(items[index].name),
                    subtitle: Text(
                        'ต้องทำทุก ${items[index].cycle.toString()} วัน  เหลือเวลาอีก ${items[index].leftDay} วัน'),
                    leading: IconButton(
                      onPressed: () {
                        debugPrint(items[index].name);
                        LastTimeMockRepo.removeItem(index);
                        context.read<LastTimeBloc>().add(LoadEvent());
                      },
                      icon: const Icon(Icons.remove_circle_outline),
                      iconSize: 30,
                      color: Colors.red,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        items[index].lastTimeAction = DateTime.now();
                        for (var item in items) {
                          if(item.id != items[index].id){
                            item.leftDay = item.leftDay - items[index].cycle;
                          } else {
                            item.leftDay = item.cycle;
                          }
                        }
                        debugPrint('action: ${items[index].lastTimeAction}');
                        context.read<LastTimeBloc>().add(LoadEvent());
                      },
                      icon: const Icon(Icons.check_circle_outline),
                      iconSize: 30,
                      color: Colors.blue,
                    ),
                    tileColor: Colors.grey[350],
                  );
                },
              );
      },
    );
  }
}
