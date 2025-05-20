import 'package:freezed_annotation/freezed_annotation.dart';

part 'pill.freezed.dart';
part 'pill.g.dart';

@freezed
abstract class Pill with _$Pill {
  const factory Pill({
    required int id,
    required String name,
    required DateTime time,
    @Default(false) bool isDrunk,
    @Default([]) List<DateTime> drinkingDates,
  }) = _Pill;

  factory Pill.fromJson(Map<String, Object?> json) => _$PillFromJson(json);
}
