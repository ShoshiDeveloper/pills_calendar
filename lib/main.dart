import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:pills_calendar/modules/pills/domain/repository/pills_repository.dart';
import 'package:pills_calendar/modules/pills/presentation/pages/pills_page.dart';
import 'package:shoko_ui/shoko_ui.dart';

void main() async {
  await Hive.initFlutter();
  await PillsRepository.openBox();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SThemeWidget(
      shokoUITheme: STheme(
        colors: SThemeColors(
          background: SBackgroundColors.basic(primary: Colors.white),
        ),
      ),
      child: const MaterialApp(
        home: PillsPage(),
      ),
    );
  }
}
