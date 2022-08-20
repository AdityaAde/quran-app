part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final String theme;
  const ThemeState({required this.theme});

  factory ThemeState.initial() => const ThemeState(theme: 'light');

  @override
  List<Object> get props => [theme];

  ThemeState copyWith({String? theme}) {
    return ThemeState(theme: theme ?? this.theme);
  }
}
