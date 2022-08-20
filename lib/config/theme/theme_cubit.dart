import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/provider/theme_save/theme_repository.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeRepository themeRepository = ThemeRepository();
  ThemeCubit() : super(ThemeState.initial());

  void switchTheme(bool isChanged) async {
    String currentTheme;
    emit(
      state.copyWith(
        theme: isChanged ? currentTheme = 'dark' : currentTheme = 'light',
      ),
    );
    await themeRepository.addTheme(currentTheme);
  }

  void getCurrentTheme() async {
    var currentTheme = await themeRepository.getTheme();
    emit(state.copyWith(
      theme: currentTheme.last['theme_current'],
    ));
  }
}
