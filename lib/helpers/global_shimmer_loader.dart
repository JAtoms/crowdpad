import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

import 'size_config.dart';

class GlobalShimmerLoader extends StatelessWidget {
  const GlobalShimmerLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightAdjusted(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.heightAdjusted(10)),
            const FadeShimmer(
              height: 8,
              width: double.infinity,
              highlightColor: Color(0xffF9F9FB),
              baseColor: Color(0xffE6E8EB),
            ),
            SizedBox(height: SizeConfig.heightAdjusted(2)),
            const FadeShimmer(
              height: 8,
              millisecondsDelay: 40,
              width: double.infinity,
              highlightColor: Color(0xffF9F9FB),
              baseColor: Color(0xffE6E8EB),
            ),
            SizedBox(height: SizeConfig.heightAdjusted(2)),
            const FadeShimmer(
              height: 8,
              millisecondsDelay: 40,
              width: double.infinity,
              highlightColor: Color(0xffF9F9FB),
              baseColor: Color(0xffE6E8EB),
            ),
            Column(
              children: [
                SizedBox(height: SizeConfig.heightAdjusted(5)),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FadeShimmer(
                      height: 60,
                      width: 60,
                      highlightColor: Color(0xffF9F9FB),
                      baseColor: Color(0xffE6E8EB),
                    ),
                    SizedBox(width: SizeConfig.widthAdjusted(2)),
                    Expanded(
                      child: Column(
                        children: [
                          const FadeShimmer(
                            height: 8,
                            width: double.infinity,
                            highlightColor: Color(0xffF9F9FB),
                            baseColor: Color(0xffE6E8EB),
                          ),
                          SizedBox(height: SizeConfig.heightAdjusted(2)),
                          const FadeShimmer(
                            height: 8,
                            millisecondsDelay: 40,
                            width: double.infinity,
                            highlightColor: Color(0xffF9F9FB),
                            baseColor: Color(0xffE6E8EB),
                          ),
                          SizedBox(height: SizeConfig.heightAdjusted(2)),
                          const FadeShimmer(
                            height: 8,
                            millisecondsDelay: 40,
                            width: double.infinity,
                            highlightColor: Color(0xffF9F9FB),
                            baseColor: Color(0xffE6E8EB),
                          ),
                          SizedBox(height: SizeConfig.heightAdjusted(2)),
                          const FadeShimmer(
                            height: 8,
                            millisecondsDelay: 40,
                            width: double.infinity,
                            highlightColor: Color(0xffF9F9FB),
                            baseColor: Color(0xffE6E8EB),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.heightAdjusted(5)),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FadeShimmer(
                      height: 60,
                      width: 60,
                      highlightColor: Color(0xffF9F9FB),
                      baseColor: Color(0xffE6E8EB),
                    ),
                    SizedBox(width: SizeConfig.widthAdjusted(2)),
                    Expanded(
                      child: Column(
                        children: [
                          const FadeShimmer(
                            height: 8,
                            width: double.infinity,
                            highlightColor: Color(0xffF9F9FB),
                            baseColor: Color(0xffE6E8EB),
                          ),
                          SizedBox(height: SizeConfig.heightAdjusted(2)),
                          const FadeShimmer(
                            height: 8,
                            millisecondsDelay: 40,
                            width: double.infinity,
                            highlightColor: Color(0xffF9F9FB),
                            baseColor: Color(0xffE6E8EB),
                          ),
                          SizedBox(height: SizeConfig.heightAdjusted(2)),
                          const FadeShimmer(
                            height: 8,
                            millisecondsDelay: 40,
                            width: double.infinity,
                            highlightColor: Color(0xffF9F9FB),
                            baseColor: Color(0xffE6E8EB),
                          ),
                          SizedBox(height: SizeConfig.heightAdjusted(2)),
                          const FadeShimmer(
                            height: 8,
                            millisecondsDelay: 40,
                            width: double.infinity,
                            highlightColor: Color(0xffF9F9FB),
                            baseColor: Color(0xffE6E8EB),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.heightAdjusted(5)),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FadeShimmer(
                      height: 60,
                      width: 60,
                      highlightColor: Color(0xffF9F9FB),
                      baseColor: Color(0xffE6E8EB),
                    ),
                    SizedBox(width: SizeConfig.widthAdjusted(2)),
                    Expanded(
                      child: Column(
                        children: [
                          const FadeShimmer(
                            height: 8,
                            width: double.infinity,
                            highlightColor: Color(0xffF9F9FB),
                            baseColor: Color(0xffE6E8EB),
                          ),
                          SizedBox(height: SizeConfig.heightAdjusted(2)),
                          const FadeShimmer(
                            height: 8,
                            millisecondsDelay: 40,
                            width: double.infinity,
                            highlightColor: Color(0xffF9F9FB),
                            baseColor: Color(0xffE6E8EB),
                          ),
                          SizedBox(height: SizeConfig.heightAdjusted(2)),
                          const FadeShimmer(
                            height: 8,
                            millisecondsDelay: 40,
                            width: double.infinity,
                            highlightColor: Color(0xffF9F9FB),
                            baseColor: Color(0xffE6E8EB),
                          ),
                          SizedBox(height: SizeConfig.heightAdjusted(2)),
                          const FadeShimmer(
                            height: 8,
                            millisecondsDelay: 40,
                            width: double.infinity,
                            highlightColor: Color(0xffF9F9FB),
                            baseColor: Color(0xffE6E8EB),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: SizeConfig.heightAdjusted(5)),
            const FadeShimmer(
              height: 150,
              millisecondsDelay: 40,
              width: double.infinity,
              highlightColor: Color(0xffF9F9FB),
              baseColor: Color(0xffE6E8EB),
            ),
            SizedBox(height: SizeConfig.heightAdjusted(5)),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FadeShimmer(
                  height: 60,
                  width: 60,
                  highlightColor: Color(0xffF9F9FB),
                  baseColor: Color(0xffE6E8EB),
                ),
                SizedBox(width: SizeConfig.widthAdjusted(2)),
                Expanded(
                  child: Column(
                    children: [
                      const FadeShimmer(
                        height: 8,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.heightAdjusted(5)),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FadeShimmer(
                  height: 60,
                  width: 60,
                  highlightColor: Color(0xffF9F9FB),
                  baseColor: Color(0xffE6E8EB),
                ),
                SizedBox(width: SizeConfig.widthAdjusted(2)),
                Expanded(
                  child: Column(
                    children: [
                      const FadeShimmer(
                        height: 8,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.heightAdjusted(5)),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FadeShimmer(
                  height: 60,
                  width: 60,
                  highlightColor: Color(0xffF9F9FB),
                  baseColor: Color(0xffE6E8EB),
                ),
                SizedBox(width: SizeConfig.widthAdjusted(2)),
                Expanded(
                  child: Column(
                    children: [
                      const FadeShimmer(
                        height: 8,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.heightAdjusted(5)),
            const FadeShimmer(
              height: 150,
              millisecondsDelay: 40,
              width: double.infinity,
              highlightColor: Color(0xffF9F9FB),
              baseColor: Color(0xffE6E8EB),
            ),
            SizedBox(height: SizeConfig.heightAdjusted(5)),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FadeShimmer(
                  height: 60,
                  width: 60,
                  highlightColor: Color(0xffF9F9FB),
                  baseColor: Color(0xffE6E8EB),
                ),
                SizedBox(width: SizeConfig.widthAdjusted(2)),
                Expanded(
                  child: Column(
                    children: [
                      const FadeShimmer(
                        height: 8,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.heightAdjusted(5)),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FadeShimmer(
                  height: 60,
                  width: 60,
                  highlightColor: Color(0xffF9F9FB),
                  baseColor: Color(0xffE6E8EB),
                ),
                SizedBox(width: SizeConfig.widthAdjusted(2)),
                Expanded(
                  child: Column(
                    children: [
                      const FadeShimmer(
                        height: 8,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.heightAdjusted(5)),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FadeShimmer(
                  height: 60,
                  width: 60,
                  highlightColor: Color(0xffF9F9FB),
                  baseColor: Color(0xffE6E8EB),
                ),
                SizedBox(width: SizeConfig.widthAdjusted(2)),
                Expanded(
                  child: Column(
                    children: [
                      const FadeShimmer(
                        height: 8,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(2)),
                      const FadeShimmer(
                        height: 8,
                        millisecondsDelay: 40,
                        width: double.infinity,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
