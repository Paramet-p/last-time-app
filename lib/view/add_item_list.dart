import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime_app/bloc/last_time_barrel.dart';
import 'package:lasttime_app/items/mock.dart';
import 'package:lasttime_app/items/model.dart';

class AddItemList extends StatelessWidget {
  const AddItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final cycleController = TextEditingController();
    final searchController = TextEditingController();
    //var items = context.select((LastTimeBloc bloc) => bloc.state.items);
    int localId = 3;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'ค้นหารายการสิ่งที่ต้องทำ',
                prefixIcon: Icon(Icons.search),
              ),
            onChanged: (String item) {
              debugPrint(item);
              context.read<LastTimeBloc>().add(SearchEvent(item));
            },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'ชื่อสิ่งที่ต้องทำ',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              controller: cycleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'รอบวันที่ต้องทำ',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            child: ElevatedButton(
                onPressed: () {
                  LastTimeMockRepo.addItem(LastTimeItem(
                      localId + 1,
                      nameController.text,
                      int.parse(cycleController.text)));
                  localId++;
                  debugPrint('${LastTimeMockRepo.items}');
                  context.read<LastTimeBloc>().add(LoadEvent());
                },
                child: const Text('เพิ่มสิ่งที่ต้องทำ')),
          ),
        ],
      ),
    );
  }
}
