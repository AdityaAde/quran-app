import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void switchTheme(bool isChanged) {
    state.copyWith(
      theme: isChanged ? AppTheme.dark : AppTheme.light,
    );
  }
}
