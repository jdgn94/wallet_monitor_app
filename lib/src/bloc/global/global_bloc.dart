import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:wallet_monitor/src/storage/shared_preferences.storage.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final SharedPreferences pref;

  GlobalBloc({required this.pref})
      : super(GlobalInitial(
          darkMode: 0,
          lightMode: 0,
          lang: pref.getString('lang') ?? 'und',
          themeMode: pref.getString('themeMode') ?? 'system',
          primaryColor: pref.getInt('primaryColor') ?? 0,
        )) {
    on<GlobalEvent>((event, emit) async {
      if (event is ChangeTheme) {
        await pref.setString("themeMode", event.themeMode);

        emit(
          UpdateGlobalState(
            themeMode: event.themeMode,
            darkMode: 0,
            lightMode: 0,
            lang: pref.getString('lang') ?? 'und',
            primaryColor: pref.getInt('primaryColor') ?? 0,
          ),
        );
      }

      if (event is ChangeLanguage) {
        await pref.setString("lang", event.lang);

        emit(
          UpdateGlobalState(
            themeMode: pref.getString('themeMode') ?? 'system',
            darkMode: 0,
            lightMode: 0,
            lang: event.lang,
            primaryColor: pref.getInt('primaryColor') ?? 0,
          ),
        );
      }
    });
  }
}
