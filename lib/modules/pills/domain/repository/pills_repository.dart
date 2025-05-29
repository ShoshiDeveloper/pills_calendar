import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:pills_calendar/modules/pills/data/repository/pills_repository.dart';
import 'package:pills_calendar/modules/pills/domain/models/pill.dart';

class PillsRepository implements IPillsRepository {
  //TODO: extract to cache_service
  Box<Map> get _box => Hive.box<Map>('pills');

  //TODO: extract to cache_service
  static Future openBox() async {
    await Hive.openBox<Map>('pills');
  }

  @override
  Future<Pill?> add(Pill pill) async {
    try {
      if (_box.values.isNotEmpty) {
        final last = Pill.fromJson(_box.values.last.cast<String, dynamic>());
        pill = pill.copyWith(id: last.id + 1);
      }

      await _box.put(pill.id, pill.toJson());
      return pill;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<bool> delete(Pill pill) async {
    try {
      await _box.delete(pill.id);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  List<Pill> fetchAll() {
    final result = _box.values.toList();

    final pills = result.map((e) => Pill.fromJson(e.cast<String, dynamic>()));

    return pills.toList();
  }

  @override
  Future<bool> update(Pill pill) async {
    try {
      await _box.put(pill.id, pill.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
