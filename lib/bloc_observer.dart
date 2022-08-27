import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Create [BlocBuilderObserver] untuk memantau
/// bloc yang sedang dibuat saat ini

class BlocBuilderObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print('${bloc.runtimeType} created');
    }
  }
}
