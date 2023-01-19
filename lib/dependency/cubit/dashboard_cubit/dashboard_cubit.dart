import 'package:bloc/bloc.dart';

class DashboardState {
  bool isLoading;

  DashboardState({required this.isLoading});
}

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState(isLoading: false));

  void _emitState() async => emit(DashboardState(isLoading: state.isLoading));

  void _setLoading(bool isLoading) async =>
      emit(DashboardState(isLoading: isLoading));
}
