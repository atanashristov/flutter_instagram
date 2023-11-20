// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_nav_bar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BottomNavBarState {
  BottomNavItem? get selectedItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomNavBarStateCopyWith<BottomNavBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavBarStateCopyWith<$Res> {
  factory $BottomNavBarStateCopyWith(
          BottomNavBarState value, $Res Function(BottomNavBarState) then) =
      _$BottomNavBarStateCopyWithImpl<$Res, BottomNavBarState>;
  @useResult
  $Res call({BottomNavItem? selectedItem});
}

/// @nodoc
class _$BottomNavBarStateCopyWithImpl<$Res, $Val extends BottomNavBarState>
    implements $BottomNavBarStateCopyWith<$Res> {
  _$BottomNavBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItem = freezed,
  }) {
    return _then(_value.copyWith(
      selectedItem: freezed == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as BottomNavItem?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BottomNavBarStateImplCopyWith<$Res>
    implements $BottomNavBarStateCopyWith<$Res> {
  factory _$$BottomNavBarStateImplCopyWith(_$BottomNavBarStateImpl value,
          $Res Function(_$BottomNavBarStateImpl) then) =
      __$$BottomNavBarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BottomNavItem? selectedItem});
}

/// @nodoc
class __$$BottomNavBarStateImplCopyWithImpl<$Res>
    extends _$BottomNavBarStateCopyWithImpl<$Res, _$BottomNavBarStateImpl>
    implements _$$BottomNavBarStateImplCopyWith<$Res> {
  __$$BottomNavBarStateImplCopyWithImpl(_$BottomNavBarStateImpl _value,
      $Res Function(_$BottomNavBarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItem = freezed,
  }) {
    return _then(_$BottomNavBarStateImpl(
      selectedItem: freezed == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as BottomNavItem?,
    ));
  }
}

/// @nodoc

class _$BottomNavBarStateImpl implements _BottomNavBarState {
  const _$BottomNavBarStateImpl({this.selectedItem = null});

  @override
  @JsonKey()
  final BottomNavItem? selectedItem;

  @override
  String toString() {
    return 'BottomNavBarState(selectedItem: $selectedItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomNavBarStateImpl &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomNavBarStateImplCopyWith<_$BottomNavBarStateImpl> get copyWith =>
      __$$BottomNavBarStateImplCopyWithImpl<_$BottomNavBarStateImpl>(
          this, _$identity);
}

abstract class _BottomNavBarState implements BottomNavBarState {
  const factory _BottomNavBarState({final BottomNavItem? selectedItem}) =
      _$BottomNavBarStateImpl;

  @override
  BottomNavItem? get selectedItem;
  @override
  @JsonKey(ignore: true)
  _$$BottomNavBarStateImplCopyWith<_$BottomNavBarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
