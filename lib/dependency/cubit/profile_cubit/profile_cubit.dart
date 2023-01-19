import 'package:crowdpad/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MetricSymbols { kg, lb, ft, inch }

class ProfileState {
  bool isUploading;

  ProfileState({required this.isUploading});
}

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState(isUploading: false));

  void setLoading(bool isLoading) {
    emit(ProfileState(isUploading: isLoading));
  }

  void _emitState() => emit(ProfileState(isUploading: state.isUploading));

  void uploadVideo({required BuildContext context}) async {
    var image = await imagePicker();

    state.isUploading = true;
    _emitState();

    // Response? response =
    //     await UploadFileApi().uploadFileApi(context: context, image: image!);
    // state.isUploading = false;
    // if (response?.data != null) getProfile(context: context);

    _emitState();
  }
}
