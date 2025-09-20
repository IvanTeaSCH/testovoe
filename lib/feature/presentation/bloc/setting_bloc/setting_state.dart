part of 'setting_bloc.dart';

abstract class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

class SettingModeState extends SettingState {
  final bool nightMode;

  const SettingModeState({required this.nightMode});

  @override
  List<Object> get props => [nightMode];
}
