import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills_calendar/modules/pills/domain/models/pill.dart';
import 'package:pills_calendar/modules/pills/domain/repository/pills_repository.dart';

class PillsController extends Cubit<List<Pill>?> {
  PillsController() : super(null);

  final _repository = PillsRepository();

  void fetch() async {
    await _repository.openBox();
    emit(_repository.fetchAll());
  }

  void onPillStateChanged(Pill pill, bool isDrunk) {
    // final currentDate = DateTime.now();
    //Такое решение подойдёт, т.к. вряд ли пользователь будет отмечать одни и те же таблетки больше 5 лет
    // final currentDrinkingDate =
    //     pill.drinkingDates.firstWhereOrNull((el) => el.day == currentDate.day && el.month == currentDate.month && el.year == currentDate.year);

    final updatedPill = pill.copyWith(isDrunk: isDrunk);
    _repository.update(updatedPill);
    emit(_repository.fetchAll());
  }

  void addPill() async {
    await _repository.add(Pill(id: 0, name: 'New pill', time: DateTime.now()));
    emit(_repository.fetchAll());
  }
}
