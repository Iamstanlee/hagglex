import 'package:flutter/material.dart';

class Elevatedbtn extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  Elevatedbtn(this.label, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, child: Text("$label"));
  }
}
