import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_flutter/dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import 'package:tiktok_flutter/dependency/cubit/upload_cubit/upload_cubit.dart';
import 'package:tiktok_flutter/helpers/colors.dart';
import 'package:tiktok_flutter/helpers/global_assets.dart';
import 'package:tiktok_flutter/helpers/size_config.dart';
import 'package:tiktok_flutter/helpers/text_styles.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({Key? key}) : super(key: key);

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
      return Positioned(
        bottom: 25.heightAdjusted,
        left: 0,
        right: 0,
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 6.heightAdjusted),
          padding: EdgeInsets.all(4.heightAdjusted),
          decoration: BoxDecoration(
              color: Color(0xff333333),
              borderRadius: BorderRadius.circular(10.heightAdjusted)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Lottie.asset('assets/image/20432-client-gallery.zip',
                  height: 40.heightAdjusted),
              Spacer(),
              InkWell(
                  onTap: () => context.read<UploadVideoCubit>().pickVideo(),
                  borderRadius: BorderRadius.circular(20),
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                    Container(
                      width: double.infinity,
                      height: 15.heightAdjusted,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.heightAdjusted,
                          vertical: 4.heightAdjusted),
                      margin:
                          EdgeInsets.symmetric(horizontal: 4.heightAdjusted),
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          border:
                              Border.all(color: GlobalColors.textFieldStroke),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Image.asset(GlobalAssets.gallery),
                          SizedBox(width: 4.heightAdjusted),
                          Text('Tap to upload video',
                              style: GlobalTextStyles.medium(
                                  fontSize: 16, color: Colors.white70)),
                        ],
                      ),
                    ),
                    if (state.isLoading)
                      CupertinoActivityIndicator(color: GlobalColors.primary),
                  ])),
              SizedBox(height: 10.heightAdjusted)
            ],
          ),
        ),
      );
    });
  }
}
