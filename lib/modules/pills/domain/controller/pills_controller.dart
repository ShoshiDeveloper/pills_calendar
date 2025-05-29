import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills_calendar/modules/pills/domain/models/pill.dart';
import 'package:pills_calendar/modules/pills/domain/repository/pills_repository.dart';

class PillsController extends Cubit<List<Pill>?> {
  PillsController() : super(null);

  final _repository = PillsRepository();

  void fetch() async {
    emit(_repository.fetchAll());
  }

  void onPillStateChanged(Pill pill, bool isDrunk) {
    // final currentDate = DateTime.now();
    //Такое решение подойдёт, т.к. вряд ли пользователь будет отмечать одни и те же таблетки больше 5 лет
    // final currentDrinkingDate =
    //     pill.drinkingDates.firstWhereOrNull((el) => el.day == currentDate.day && el.month == currentDate.month && el.year == currentDate.year);

    late final Pill updatedPill;
    final now = DateTime.now();
    if (isDrunk) {
      final drinkingDates = pill.drinkingDates.toList()..add(DateTime.now());
      updatedPill = pill.copyWith(drinkingDates: drinkingDates);
    } else {
      final drinkingDates = pill.drinkingDates.toList();
      final reuslt = drinkingDates.firstWhereOrNull((e) => e.day == now.day && e.month == now.month);
      drinkingDates.remove(reuslt);

      updatedPill = pill.copyWith(drinkingDates: drinkingDates);
    }

    _repository.update(updatedPill);
    emit(_repository.fetchAll());
  }

  void editPill(Pill pill) async {
    await _repository.update(pill);
    emit(_repository.fetchAll());
  }

  //TODO: поправить частые обращения на получение
  void addPill(Pill pill) async {
    final pills = _repository.fetchAll();
    if (pills.isEmpty) {
      await _repository.add(pill.copyWith(id: 0));
    } else {
      await _repository.add(pill.copyWith(id: pills.last.id + 1));
    }
    emit(_repository.fetchAll());
  }

  void remove(Pill pill) async {
    await _repository.delete(pill);
    emit(_repository.fetchAll());
  }
}
