// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Pill {
  int get id;
  String get name;
  DateTime get time;
  List<DateTime> get drinkingDates;

  /// Create a copy of Pill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PillCopyWith<Pill> get copyWith =>
      _$PillCopyWithImpl<Pill>(this as Pill, _$identity);

  /// Serializes this Pill to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Pill &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality()
                .equals(other.drinkingDates, drinkingDates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, time,
      const DeepCollectionEquality().hash(drinkingDates));

  @override
  String toString() {
    return 'Pill(id: $id, name: $name, time: $time, drinkingDates: $drinkingDates)';
  }
}

/// @nodoc
abstract mixin class $PillCopyWith<$Res> {
  factory $PillCopyWith(Pill value, $Res Function(Pill) _then) =
      _$PillCopyWithImpl;
  @useResult
  $Res call({int id, String name, DateTime time, List<DateTime> drinkingDates});
}

/// @nodoc
class _$PillCopyWithImpl<$Res> implements $PillCopyWith<$Res> {
  _$PillCopyWithImpl(this._self, this._then);

  final Pill _self;
  final $Res Function(Pill) _then;

  /// Create a copy of Pill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? time = null,
    Object? drinkingDates = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      drinkingDates: null == drinkingDates
          ? _self.drinkingDates
          : drinkingDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Pill implements Pill {
  const _Pill(
      {required this.id,
      required this.name,
      required this.time,
      final List<DateTime> drinkingDates = const []})
      : _drinkingDates = drinkingDates;
  factory _Pill.fromJson(Map<String, dynamic> json) => _$PillFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final DateTime time;
  final List<DateTime> _drinkingDates;
  @override
  @JsonKey()
  List<DateTime> get drinkingDates {
    if (_drinkingDates is EqualUnmodifiableListView) return _drinkingDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drinkingDates);
  }

  /// Create a copy of Pill
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PillCopyWith<_Pill> get copyWith =>
      __$PillCopyWithImpl<_Pill>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PillToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Pill &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality()
                .equals(other._drinkingDates, _drinkingDates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, time,
      const DeepCollectionEquality().hash(_drinkingDates));

  @override
  String toString() {
    return 'Pill(id: $id, name: $name, time: $time, drinkingDates: $drinkingDates)';
  }
}

/// @nodoc
abstract mixin class _$PillCopyWith<$Res> implements $PillCopyWith<$Res> {
  factory _$PillCopyWith(_Pill value, $Res Function(_Pill) _then) =
      __$PillCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, DateTime time, List<DateTime> drinkingDates});
}

/// @nodoc
class __$PillCopyWithImpl<$Res> implements _$PillCopyWith<$Res> {
  __$PillCopyWithImpl(this._self, this._then);

  final _Pill _self;
  final $Res Function(_Pill) _then;

  /// Create a copy of Pill
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? time = null,
    Object? drinkingDates = null,
  }) {
    return _then(_Pill(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      drinkingDates: null == drinkingDates
          ? _self._drinkingDates
          : drinkingDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

// dart format on
