import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:equatable/equatable.dart';

part 'setting_event.dart';
part 'setting_state.dart';

@injectable
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc(this.prefs) : super(SettingModeState(nightMode: true)) {
    on<SettingModeInit>(_init);
    on<SettingChangeModeEvent>(_changeMode);
  }

  final SharedPreferences prefs;
  bool nightMode = true;

  Future<void> _init(SettingModeInit event, Emitter<SettingState> emit) async {
    nightMode = prefs.getBool('is_dark_theme') ?? true;
    emit(SettingModeState(nightMode: nightMode));
  }

  Future<void> _changeMode(
      SettingChangeModeEvent event, Emitter<SettingState> emit) async {
    prefs.setBool('is_dark_theme', !nightMode);
    nightMode = !nightMode;
    emit(SettingModeState(nightMode: nightMode));
  }
}
