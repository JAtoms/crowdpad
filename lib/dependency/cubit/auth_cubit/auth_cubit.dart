import 'package:flutter_bloc/flutter_bloc.dart';

class AuthState {
  bool isLoading;

  AuthState({required this.isLoading});
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(isLoading: false));

  void setLoading(bool isLoading) {
    emit(AuthState(isLoading: isLoading));
  }

  void _emitState() => emit(AuthState(isLoading: state.isLoading));
}
