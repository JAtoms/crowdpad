import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_flutter/dependency/cubit/upload_cubit/upload_cubit.dart';
import 'package:tiktok_flutter/helpers/helpers.dart';
import 'package:video_compress/video_compress.dart';

import '../../dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import '../../dependency/navigation/navigator_routes.dart';
import '../dependency/navigation/global_router_exports.dart';

abstract class FireService {
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

  Stream<QuerySnapshot> getVideos();

  Future<String> uploadMedia({required File image});

  Future<void> uploadVideo(
      {required BuildContext context,
      required File videoFile,
      required String title,
      required String description});
}

class FireServiceImp extends FireService {
  FirebaseAuth firebaseAuth;
  FirebaseStorage firebaseStorage;
  FirebaseFirestore firebaseFirestore;

  FireServiceImp(
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
      globalReplaceWith(route: Routes.domain);
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

      // UserModel user = UserModel(
      //     name: name, email: email, uid: cred.user!.uid, profilePhoto: '');

      // await firebaseFirestore
      //     .collection('users')
      //     .doc(cred.user!.uid)
      //     .set(user.toJson());

      globalToast('You have been registered $name');
      globalPop(context: context);
      globalReplaceWith(route: Routes.domain);
    } catch (_) {
      globalPop(context: context);
      globalToast('Unable to complete registration');
      globaLog('Registration exception', _.toString());
    }
  }

  @override
  Future<void> signOut() async => await firebaseAuth.signOut();

  @override
  Stream<QuerySnapshot> getVideos() {
    return FirebaseFirestore.instance.collection('videos').snapshots();
  }

  @override
  Future<String> uploadMedia({required File image}) async {
    String downloadUrl = '';

    try {
      Reference ref = firebaseStorage
          .ref()
          .child('media')
          .child(firebaseAuth.currentUser!.uid);

      UploadTask uploadTask = ref.putFile(image);
      await uploadTask.then((value) async {
        downloadUrl = await value.ref.getDownloadURL();
        globalToast('Media uploaded successfully');
      });
    } catch (_) {
      globalToast('Unable to upload');
      globaLog('Media upload exception', _.toString());
    }
    return downloadUrl;
  }

  _getThumbnail(File videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath.path);
    return thumbnail;
  }

  Future<String> _uploadImageToStorage(String id, File videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _compressVideo(File videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(videoPath.path,
        quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }

  Future<String> _uploadVideoToStorage(String id, File videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);

    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  @override
  Future<void> uploadVideo(
      {required BuildContext context,
      required File videoFile,
      required String title,
      required String description}) async {
    try {
      // String uid = firebaseAuth.currentUser!.uid;
      // DocumentSnapshot userDoc =
      //     await firebaseFirestore.collection('users').doc(uid).get();

      // get id
      var allDocs = await firebaseFirestore.collection('videos').get();

      int len = allDocs.docs.length;
      String videoUrl = await _uploadVideoToStorage("Video $len", videoFile);
      String thumbnail = await _uploadImageToStorage("Video $len", videoFile);

      // VideoModel video = VideoModel(
      //   username: (userDoc.data()! as Map<String, dynamic>)['name'],
      //   uid: uid,
      //   id: "Video $len",
      //   likes: [],
      //   commentCount: 0,
      //   shareCount: 0,
      //   title: title,
      //   description: description,
      //   videoUrl: videoUrl,
      //   profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
      //   thumbnail: thumbnail,
      // );
      //
      // await firebaseFirestore
      //     .collection('videos')
      //     .doc('Video $len')
      //     .set(video.toJson());

      await firebaseFirestore.collection('videos').add({
        "id": "2",
        "video_title": title,
        "url": videoUrl,
        "comments": "143",
        "likes": "3223",
        "song_name": description,
        "user": "Crowdpad user",
        "user_pic":
            "https://i.pinimg.com/originals/5e/eb/8d/5eeb8d615bea040425f9937699392751.jpg"
      });

      globalToast('Video uploaded');
      globalPop(context: context);
      context.read<UploadVideoCubit>().resetState();
      context.read<DashboardCubit>().getVideos();
    } catch (e) {
      print('Error $e');
      globalToast('Error Uploading Video');
    }
  }
}
