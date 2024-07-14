import 'package:flutter/material.dart';

class LastTimeAction extends StatelessWidget {
  const LastTimeAction({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        debugPrint('check');
      },
      icon: const Icon(Icons.check_circle_outline),
      iconSize: 30,
      color: Colors.blue,
    );
  }
}
