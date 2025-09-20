part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class SettingModeInit extends SettingEvent {
  @override
  List<Object> get props => [];
}

class SettingChangeModeEvent extends SettingEvent {
  @override
  List<Object> get props => [];
}
