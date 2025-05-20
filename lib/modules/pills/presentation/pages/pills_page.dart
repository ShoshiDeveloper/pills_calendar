import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills_calendar/modules/pills/domain/controller/pills_controller.dart';
import 'package:pills_calendar/modules/pills/domain/models/pill.dart';
import 'package:pills_calendar/modules/pills/presentation/widgets/pill_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Лекарства за ${DateTime.now().day}'),
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
                      onChanged: (v) => controller.onPillStateChanged(pill, v ?? pill.isDrunk),
                    );
                  },
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.addPill();
          },
          child: Icon(Icons.add_rounded),
        ),
      ),
    );
  }
}
