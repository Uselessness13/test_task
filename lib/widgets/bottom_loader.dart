import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}
