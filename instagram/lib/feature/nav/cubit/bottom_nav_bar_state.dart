part of 'bottom_nav_bar_cubit.dart';

@freezed
class BottomNavBarState with _$BottomNavBarState {
  const factory BottomNavBarState({
    @Default(null) BottomNavItem? selectedItem,
  }) = _BottomNavBarState;
}
