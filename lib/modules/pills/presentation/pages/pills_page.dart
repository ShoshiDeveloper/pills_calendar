import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills_calendar/core/extensions/datetime_ext.dart';
import 'package:pills_calendar/modules/pill_modal/presentation/modal/pill_modal.dart';
import 'package:pills_calendar/modules/pills/domain/controller/pills_controller.dart';
import 'package:pills_calendar/modules/pills/domain/models/pill.dart';
import 'package:pills_calendar/modules/pills/presentation/widgets/pill_widget.dart';
import 'package:shoko_ui/shoko_ui.dart';

class PillsPage extends StatefulWidget {
  const PillsPage({super.key});

  @override
  State<PillsPage> createState() => _PillsPageState();
}

class _PillsPageState extends State<PillsPage> {
  final controller = PillsController()..fetch();

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  void showCreateModal() => showMBS<Pill>(context, base: PillModal()).then((value) {
        if (value == null) return;
        controller.addPill(value);
      });
  void showEditModal(Pill pill) => showMBS<Pill>(context, base: PillModal(pill: pill)).then((value) {
        if (value == null) return;
        controller.editPill(value);
      });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Сегодня ${DateTime.now().readable}'),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: BlocBuilder<PillsController, List<Pill>?>(
              builder: (context, state) {
                if (state == null) return Center(child: CircularProgressIndicator());

                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 8),
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final pill = state[index];

                    return PillWidget(
                      pill: pill,
                      onTap: () => showEditModal(pill),
                      onChanged: (v) => controller.onPillStateChanged(pill, v ?? pill.isDrunk),
                      onDissmis: () => controller.remove(pill),
                    );
                  },
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showCreateModal,
          child: Icon(Icons.add_rounded),
        ),
      ),
    );
  }
}
