import 'package:flutter/material.dart';
import 'package:pills_calendar/modules/pills/domain/models/pill.dart';

class PillWidget extends StatelessWidget {
  const PillWidget({super.key, required this.pill, required this.onChanged});

  final Pill pill;
  final Function(bool? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(pill.name),
          Checkbox(
            value: pill.isDrunk,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
