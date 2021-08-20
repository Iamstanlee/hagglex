import 'package:flutter/material.dart';
import 'package:hagglex/utils/extensions.dart';

class GradientBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  GradientBtn(this.label, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            elevation: 2.0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0)))),
        child: Container(
            width: context.getWidth(),
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                gradient: LinearGradient(
                    colors: [Color(0xFF432B7B), Color(0xFF6A4BBC)])),
            child: Text('$label',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.white))));
  }
}
