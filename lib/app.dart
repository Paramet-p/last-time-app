import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime_app/bloc/last_time_barrel.dart';
import 'package:lasttime_app/items/mock.dart';
import 'package:lasttime_app/view/list_items_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LastTimeBloc>(create: (context) {
          var bloc = LastTimeBloc(LastTimeMockRepo());
          bloc.add(LoadEvent());

          return bloc;
        },)
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Last Time', style: TextStyle(color: Colors.white),), backgroundColor: Colors.black, ),
          body: const ListItemsPage(),
        ),
      ),
    );
  }
}
