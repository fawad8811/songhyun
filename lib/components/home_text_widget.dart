import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:songhyun/utils/app_exports.dart';
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
    await Future.delayed(Duration.zero); // Ensure the widget is built

    _videoController = VideoPlayerController.asset(
        'assets/videos/choege_background_video.mp4');

    await _videoController.initialize();
    _videoController.setLooping(true); // Set video to loop playback
    _videoController.setVolume(0.0); // Mute the video
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
                return SizedBox(
                    child: FittedBox(
                  fit: BoxFit.fill,
                  child: SizedBox(
                    width: _videoController.value.size.width,
                    height: _videoController.value.size.height,
                    child: VideoPlayer(_videoController),
                  ),
                ));
                // Opacity(
                //   opacity: 0.3,
                //   child: Container(color: Colors.black),
                // ),
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: getProportionateScreenHeight(100),
            left: getProportionateScreenWidth(2),
            child: Text(
              AppLocalizations.of(context)!.companyNameOne,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.kWhite,
                    fontSize: widget.isMobile ? 18 : 60,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    height: 1.2,
                  ),
            ),
          ),
          Positioned(
            bottom: getProportionateScreenHeight(100),
            right: getProportionateScreenWidth(5),
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
                      height: widget.isMobile
                          ? getProportionateScreenHeight(50)
                          : getProportionateScreenHeight(70),
                      width: widget.isMobile
                          ? getProportionateScreenHeight(50)
                          : getProportionateScreenWidth(60),
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
            ),
          ),
        ],
      ),
    );
  }

  void _launchKakaoTalkOrWebsite() async {
    launch('http://qr.kakao.com/talk/fVc4CFqYH8_tqzGbMD_9C26tvmg-');
  }
}
