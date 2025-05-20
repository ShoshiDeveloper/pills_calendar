import 'package:pills_calendar/modules/pills/domain/models/pill.dart';

abstract interface class IPillsRepository {
  List<Pill> fetchAll();
  Future<Pill?> add(Pill pill);
  Future<bool> update(Pill pill);
  Future<bool> delete(Pill pill);
}
