import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pill.freezed.dart';
part 'pill.g.dart';

@freezed
abstract class Pill with _$Pill {
  const factory Pill({
    required int id,
    required String name,
    required DateTime time,
    @Default([]) List<DateTime> drinkingDates,
  }) = _Pill;

  factory Pill.fromJson(Map<String, Object?> json) => _$PillFromJson(json);
}

extension PillX on Pill {
  bool get isDrunk {
    final now = DateTime.now();
    final reuslt = drinkingDates.firstWhereOrNull((e) => e.day == now.day && e.month == now.month);

    return reuslt != null;
  }
}
