// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insight_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InsightState {
  List<InsightMedia> get items => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InsightStateCopyWith<InsightState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsightStateCopyWith<$Res> {
  factory $InsightStateCopyWith(
          InsightState value, $Res Function(InsightState) then) =
      _$InsightStateCopyWithImpl<$Res, InsightState>;
  @useResult
  $Res call({List<InsightMedia> items, int totalCount, bool hasNext});
}

/// @nodoc
class _$InsightStateCopyWithImpl<$Res, $Val extends InsightState>
    implements $InsightStateCopyWith<$Res> {
  _$InsightStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = null,
    Object? hasNext = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InsightMedia>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InsightStateCopyWith<$Res>
    implements $InsightStateCopyWith<$Res> {
  factory _$$_InsightStateCopyWith(
          _$_InsightState value, $Res Function(_$_InsightState) then) =
      __$$_InsightStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<InsightMedia> items, int totalCount, bool hasNext});
}

/// @nodoc
class __$$_InsightStateCopyWithImpl<$Res>
    extends _$InsightStateCopyWithImpl<$Res, _$_InsightState>
    implements _$$_InsightStateCopyWith<$Res> {
  __$$_InsightStateCopyWithImpl(
      _$_InsightState _value, $Res Function(_$_InsightState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = null,
    Object? hasNext = null,
  }) {
    return _then(_$_InsightState(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InsightMedia>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_InsightState with DiagnosticableTreeMixin implements _InsightState {
  const _$_InsightState(
      {final List<InsightMedia> items = const <InsightMedia>[],
      this.totalCount = 0,
      this.hasNext = false})
      : _items = items;

  final List<InsightMedia> _items;
  @override
  @JsonKey()
  List<InsightMedia> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final bool hasNext;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InsightState(items: $items, totalCount: $totalCount, hasNext: $hasNext)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InsightState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('totalCount', totalCount))
      ..add(DiagnosticsProperty('hasNext', hasNext));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InsightState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), totalCount, hasNext);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InsightStateCopyWith<_$_InsightState> get copyWith =>
      __$$_InsightStateCopyWithImpl<_$_InsightState>(this, _$identity);
}

abstract class _InsightState implements InsightState {
  const factory _InsightState(
      {final List<InsightMedia> items,
      final int totalCount,
      final bool hasNext}) = _$_InsightState;

  @override
  List<InsightMedia> get items;
  @override
  int get totalCount;
  @override
  bool get hasNext;
  @override
  @JsonKey(ignore: true)
  _$$_InsightStateCopyWith<_$_InsightState> get copyWith =>
      throw _privateConstructorUsedError;
}
