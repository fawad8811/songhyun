import 'dart:async';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class HomeTextWidget extends StatefulWidget {
  final bool isMobile;

  const HomeTextWidget({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  @override
  State<HomeTextWidget> createState() => _HomeTextWidgetState();
}

class _HomeTextWidgetState extends State<HomeTextWidget> {
  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    _initializeVideoPlayerFuture = _initVideoPlayer();
  }

  Future<void> _initVideoPlayer() async {
    _videoController = VideoPlayerController.asset(
        'assets/videos/choege_background_video.mp4');
    await _videoController.initialize();
    _videoController.setLooping(true); // Set video to loop playback
    _videoController.play(); // Start video playback
    setState(() {}); // Update UI to display video
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: VideoPlayer(_videoController),
                    ),
                    Opacity(
                      opacity: 0.3,
                      child: Container(color: Colors.black),
                    ),
                  ],
                );
              } else {
                return Center(child: const CircularProgressIndicator());
              }
            },
          ),
          // Image.asset(Assets.imagesHomeBg, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(26),
                top: getProportionateScreenHeight(200)),
            child: SelectableText.rich(
              TextSpan(
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.kWhite,
                    fontWeight: FontWeight.w100,
                    fontSize: widget.isMobile ? 14 : 28),
                children: <TextSpan>[
                  TextSpan(
                    text: AppLocalizations.of(context)!.companyNameOne,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.kWhite,
                          fontSize: widget.isMobile ? 14 : 28,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  TextSpan(
                      text: AppLocalizations.of(context)!.pursuitStatement),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(22),
                  top: getProportionateScreenHeight(550)),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    _launchKakaoTalkOrWebsite();
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.imagesKakaoTalkLogo,
                        fit: BoxFit.scaleDown,
                        height: getProportionateScreenHeight(60),
                        width: getProportionateScreenWidth(60),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      widget.isMobile
                          ? const SizedBox.shrink()
                          : Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: getProportionateScreenHeight(10),
                                  horizontal: getProportionateScreenWidth(2)),
                              width: getProportionateScreenWidth(100),
                              // height: getProportionateScreenHeight(60),
                              decoration: BoxDecoration(
                                  color: AppColors.kYellowColor,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Text(
                                AppLocalizations.of(context)!.kakaoTalk,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontSize: widget.isMobile ? 8 : 14,
                                        fontWeight: FontWeight.w300),
                              ),
                            )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  void _launchKakaoTalkOrWebsite() async {
    if (widget.isMobile) {
      // _openKakaoApp();
      const playStoreUrl =
          "https://play.google.com/store/apps/details?id=com.kakao.talk";
      await launch(playStoreUrl);
    } else {
      const websiteUrl = "https://lhgsstock.shop/666";
      await launch(websiteUrl);
    }
  }
}
