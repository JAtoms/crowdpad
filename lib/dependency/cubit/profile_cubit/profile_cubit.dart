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
  FirebaseAuth firebaseAuth;
  FirebaseStorage firebaseStorage;
  FirebaseFirestore firebaseFirestore;

  ProfileCubit(
      {required this.firebaseAuth,
      required this.firebaseStorage,
      required this.firebaseFirestore})
      : super(ProfileState(isUploading: false));

  void setLoading(bool isLoading) {
    emit(ProfileState(isUploading: isLoading));
  }

  void _emitState() => emit(ProfileState(isUploading: state.isUploading));

  // registering the user
  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // save out user to our ath and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadToStorage(image);
        UserModel user = UserModel(
            name: username,
            email: email,
            uid: cred.user!.uid,
            profilePhoto: downloadUrl);
        await firebaseFirestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        globaLog('Registration error',
            'Error Creating Account Please enter all the fields');
      }
    } catch (_) {
      globaLog('Registration exception', _.toString());
    }
  }

  Future<String> _uploadToStorage(File image) async {
    String downloadUrl = '';
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    await uploadTask.then((value) async {
      downloadUrl = await value.ref.getDownloadURL();
    });

    return downloadUrl;
  }

  void _uploadProfilePhoto(File image) async {
    var image = await imagePicker();
  }

  void uploadVideo({required BuildContext context}) async {
    var image = await imagePicker();
    var imageFile = File(image!.path);

    state.isUploading = true;
    _emitState();

    // Response? response =
    //     await UploadFileApi().uploadFileApi(context: context, image: image!);
    // state.isUploading = false;
    // if (response?.data != null) getProfile(context: context);

    _emitState();
  }
}
