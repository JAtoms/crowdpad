import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'colors.dart';
import 'size_config.dart';

void showLoaderDialog(BuildContext context) {
  var alert = Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.heightAdjusted)),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 6.heightAdjusted, vertical: 6.heightAdjusted),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CupertinoActivityIndicator(),
          SizedBox(width: 10),
          Text('Loading...')
        ],
      ),
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () async => false, child: Container(child: alert));
    },
  );
}

void globalToast(String message) => Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 15);

void globaLog(String topic, message) => log('$topic $message');

void globalExceptionPrint(String message) =>
    debugPrint('Finance exception $message');

bool isValidEmail(String email) {
  bool emailValid = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\'
          r's@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.'
          r'[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.'
          r')+[a-zA-Z]{2,}))$')
      .hasMatch(email);
  if (emailValid) {
    return true;
  } else {
    return false;
  }
}

CachedNetworkImage buildCachedNetworkImage(
    {required image, required double height, required double width}) {
  return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.cover,
      width: SizeConfig.heightAdjusted(width),
      errorWidget: (context, url, error) => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: GlobalColors.primary.withAlpha(100),
              borderRadius:
                  BorderRadius.circular(SizeConfig.heightAdjusted(3)))),
      placeholder: (context, url) => const FadeShimmer(
            highlightColor: Color(0xffF9F9FB),
            baseColor: Color(0xffE6E8EB),
            height: 100,
            width: 60,
          ),
      height: SizeConfig.heightAdjusted(height));
}

extension FormValidator on GlobalKey<FormState> {
  bool get validate => formValidator(this);
}

bool formValidator(GlobalKey<FormState> globalKey) {
  return globalKey.currentState!.validate();
}

Future<XFile?> imagePicker() async {
  XFile? imageFile;
  try {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  } catch (_) {}
  return imageFile;
}
