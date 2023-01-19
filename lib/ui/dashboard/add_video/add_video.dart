import 'package:crowdpad/dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import 'package:crowdpad/dependency/cubit/profile_cubit/profile_cubit.dart';
import 'package:crowdpad/helpers/global_assets.dart';
import 'package:crowdpad/helpers/helpers.dart';
import 'package:crowdpad/helpers/text_styles.dart';
import 'package:crowdpad/ui/dashboard/add_video/confirm_video_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../../../index_exports.dart';

class AddVideoPage extends StatefulWidget {
  const AddVideoPage({Key? key}) : super(key: key);

  @override
  State<AddVideoPage> createState() => _AddVideoPageState();
}

class _AddVideoPageState extends State<AddVideoPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
      return Scaffold(
        body: state.videoPath != null
            ? CrowdPadVideoPlayer(videoPath: state.videoPath!)
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.heightAdjusted),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 20.heightAdjusted),
                    InkWell(
                        onTap: () => context.read<DashboardCubit>().pickVideo(),
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 20.heightAdjusted,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.heightAdjusted,
                                    vertical: 4.heightAdjusted),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: GlobalColors.textFieldStroke),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    Image.asset(GlobalAssets.gallery),
                                    SizedBox(width: 4.heightAdjusted),
                                    Text('Tap to upload media',
                                        style: GlobalTextStyles.medium(
                                            fontSize: 20)),
                                  ],
                                ),
                              ),
                              if (state.isLoading)
                                CupertinoActivityIndicator(
                                    color: GlobalColors.primary),
                            ])),
                    SizedBox(height: 20.heightAdjusted),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Lottie.network(
                          'https://assets10.lottiefiles.com/packages/lf20_ssaHB0.json'),
                      //
                      // Image.asset(GlobalAssets.uploadBro)
                    )
                  ],
                ),
              ),
      );
    });
  }
}
