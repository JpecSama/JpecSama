part of 'custom_nav_bar_bloc.dart';

@freezed
class CustomNavBarEvent with _$CustomNavBarEvent {
  const factory CustomNavBarEvent.started() = _Started;
  
  const factory CustomNavBarEvent.navigate({required String routeName}) =
      _Navigate;
}
