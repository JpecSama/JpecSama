import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jpec_sama/pages/home/home_tab.dart';

part 'custom_nav_bar_event.dart';
part 'custom_nav_bar_state.dart';
part 'custom_nav_bar_bloc.freezed.dart';

class CustomNavBarBloc extends Bloc<CustomNavBarEvent, CustomNavBarState> {
  CustomNavBarBloc()
      : super(const CustomNavBarState(currentRoute: HomeTab.tabName)) {
    on<_Navigate>(_onNavigate);
  }

  _onNavigate(_Navigate event, Emitter<CustomNavBarState> emit) {
    //navigate
    print('_onNavigate');
    emit(state.copyWith(currentRoute: event.routeName));
  }
}
