import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pills_calendar/modules/pills/domain/models/pill.dart';
import 'package:shoko_ui/shoko_ui.dart';

class PillModal extends StatefulWidget {
  const PillModal({super.key, this.pill});

  final Pill? pill;

  @override
  State<PillModal> createState() => _PillModalState();
}

class _PillModalState extends State<PillModal> {
  late final controller = TextEditingController(text: editablePill.name);

  late Pill editablePill = widget.pill?.copyWith() ?? Pill(id: 0, name: '', time: DateTime.now().copyWith(hour: 12, minute: 0));

  @override
  Widget build(BuildContext context) {
    return MBSBase(
      label: 'Информация о препарате',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          STextField(
            controller: controller,
            label: 'Название препарата',
            onChanged: (value) => editablePill = editablePill.copyWith(name: value),
          ),
          Text('Время приёма', style: context.theme.contentStyles.title2()),
          CupertinoTimerPicker(
            alignment: Alignment.center,
            initialTimerDuration: Duration(hours: editablePill.time.hour, minutes: editablePill.time.minute),
            mode: CupertinoTimerPickerMode.hm,
            onTimerDurationChanged: (value) {
              final hours = value.inHours;
              final minutes = value.inMinutes - (value.inHours * 60);
              editablePill = editablePill.copyWith(time: editablePill.time.copyWith(hour: hours, minute: minutes));
            },
          ),
          SButton.expanded(
            onTap: () => Navigator.pop(context, editablePill),
            child: SButtonContent.text('Сохранить'),
          )
        ],
      ),
    );
  }
}
