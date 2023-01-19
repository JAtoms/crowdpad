import 'dart:io';

import 'package:crowdpad/data_models/user.dart';
import 'package:crowdpad/helpers/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MetricSymbols { kg, lb, ft, inch }

class ProfileState {
  bool isUploading;

  ProfileState({required this.isUploading});
}

class ProfileCubit extends Cubit<ProfileState> {
  // FirebaseAuth firebaseAuth;
  // FirebaseStorage firebaseStorage;
  // FirebaseFirestore firebaseFirestore;

  ProfileCubit() : super(ProfileState(isUploading: false));

  void setLoading(bool isLoading) {
    emit(ProfileState(isUploading: isLoading));
  }

  void _emitState() => emit(ProfileState(isUploading: state.isUploading));

  // Future<String> _uploadToStorage(File image) async {
  //   String downloadUrl = '';
  //   Reference ref = firebaseStorage
  //       .ref()
  //       .child('profilePics')
  //       .child(firebaseAuth.currentUser!.uid);
  //
  //   UploadTask uploadTask = ref.putFile(image);
  //   await uploadTask.then((value) async {
  //     downloadUrl = await value.ref.getDownloadURL();
  //   });
  //
  //   return downloadUrl;
  // }

  void _uploadProfilePhoto(File image) async {
    var image = await imagePicker();
  }
}
