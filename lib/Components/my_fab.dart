// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  final Function()? onPressed;

  const MyFloatingActionButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor:Theme.of(context).colorScheme.secondary,
      child: const Icon(Icons.add),
    );
  }
}