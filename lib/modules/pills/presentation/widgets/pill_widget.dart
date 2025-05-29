import 'package:flutter/material.dart';
import 'package:pills_calendar/core/extensions/datetime_ext.dart';
import 'package:pills_calendar/modules/pills/domain/models/pill.dart';

class PillWidget extends StatelessWidget {
  const PillWidget({super.key, required this.pill, required this.onChanged, required this.onTap, required this.onDissmis});

  final Pill pill;
  final Function(bool? value) onChanged;
  final VoidCallback onTap;
  final VoidCallback onDissmis;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: GlobalKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onDissmis(),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pill.name),
                  Text(pill.time.readableTime),
                ],
              ),
              Checkbox(
                value: pill.isDrunk,
                onChanged: onChanged,
              )
            ],
          ),
        ),
      ),
    );
  }
}
