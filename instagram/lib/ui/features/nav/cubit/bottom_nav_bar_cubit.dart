import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/ui/features/nav/models/bottom_nav_item.dart';

part 'bottom_nav_bar_state.dart';
part 'bottom_nav_bar_cubit.freezed.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarState());

  void updateSelectedItem(BottomNavItem item) {
    if (item != state.selectedItem) {
      emit(state.copyWith(selectedItem: item));
    }
  }
}
