// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pill _$PillFromJson(Map<String, dynamic> json) => _Pill(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      time: DateTime.parse(json['time'] as String),
      isDrunk: json['isDrunk'] as bool? ?? false,
      drinkingDates: (json['drinkingDates'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PillToJson(_Pill instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'time': instance.time.toIso8601String(),
      'isDrunk': instance.isDrunk,
      'drinkingDates':
          instance.drinkingDates.map((e) => e.toIso8601String()).toList(),
    };
