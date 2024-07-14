import 'package:flutter/material.dart';

class RemoveItem extends StatelessWidget {
  const RemoveItem({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        debugPrint('remove');
        
      },
      icon: const Icon(Icons.remove_circle_outline),
      iconSize: 30,
      color: Colors.red,
    );
  }
}