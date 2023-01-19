import 'package:crowdpad/api_service/auth/fire_api.dart';
import 'package:crowdpad/index_exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthState {
  bool isLoading;

  AuthState({required this.isLoading});
}

class AuthCubit extends Cubit<AuthState> {
  FireServiceImp fireServiceImp;

  AuthCubit({required this.fireServiceImp})
      : super(AuthState(isLoading: false));

  void setLoading(bool isLoading) {
    emit(AuthState(isLoading: isLoading));
  }

  void _emitState() => emit(AuthState(isLoading: state.isLoading));

  signUp(
      {required String email,
      required String name,
      required String password,
      required BuildContext context}) {
    fireServiceImp.signUp(
        email: email, name: name, password: password, context: context);
  }

  signIn(
      {required String email,
      required String password,
      required BuildContext context}) {
    fireServiceImp.signIn(email: email, password: password, context: context);
  }

  signOut() => fireServiceImp.signOut();
}
