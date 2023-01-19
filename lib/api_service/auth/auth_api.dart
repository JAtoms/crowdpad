import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowdpad/data_models/user.dart';
import 'package:crowdpad/dependency/navigation/global_router_exports.dart';
import 'package:crowdpad/helpers/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../dependency/navigation/navigator_routes.dart';

abstract class AuthService {
  Future<void> signUp(
      {required String email,
      required String name,
      required String password,
      required BuildContext context});

  Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context});

  Future<void> signOut();
}

class AuthServiceImp extends AuthService {
  FirebaseAuth firebaseAuth;
  FirebaseStorage firebaseStorage;
  FirebaseFirestore firebaseFirestore;

  AuthServiceImp(
      {required this.firebaseAuth,
      required this.firebaseStorage,
      required this.firebaseFirestore});

  @override
  Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    showLoaderDialog(context);
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      globalToast('Welcome to Crowdpad');
      globalPop(context: context);
      globalReplaceWith(route: Routes.homePage);
    } catch (e) {
      globalToast('Unable to sign you in');
      globalPop(context: context);
    }
  }

  @override
  Future<void> signUp(
      {required String email,
      required String name,
      required String password,
      required BuildContext context}) async {
    showLoaderDialog(context);
    try {
      UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserModel user = UserModel(
          name: name, email: email, uid: cred.user!.uid, profilePhoto: '');
      await firebaseFirestore
          .collection('users')
          .doc(cred.user!.uid)
          .set(user.toJson());
      globalToast('You have been registered $name');
      globalPop(context: context);
      globalReplaceWith(route: Routes.homePage);
    } catch (_) {
      globalPop(context: context);
      globalToast('Unable to complete registration');
      globaLog('Registration exception', _.toString());
    }
  }

  @override
  Future<void> signOut() async => await firebaseAuth.signOut();
}
