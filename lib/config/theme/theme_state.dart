part of 'theme_cubit.dart';

enum AppTheme { light, dark }

class ThemeState extends Equatable {
  final AppTheme theme;
  const ThemeState({required this.theme});

  factory ThemeState.initial() => const ThemeState(theme: AppTheme.light);

  @override
  List<Object> get props => [theme];

  ThemeState copyWith({AppTheme? theme}) {
    return ThemeState(theme: theme ?? this.theme);
  }

  @override
  String toString() => 'ThemeState(theme: $theme)';
  String enumToString() => theme.toString().split('.').last.split(')').first.toUpperCase();
}
