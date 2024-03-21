import 'package:flutter/material.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/theme/app_colors.dart';

class VisionScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool isMobile;

  const VisionScreen(
      {Key? key, required this.scaffoldKey, this.isMobile = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        const PageHead(title: 'Vision',image: Assets.imagesBgTopVision,),
        _buildContent(context),
        SizedBox(height: getProportionateScreenHeight(150)),
      ],
    );
  }

  

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(40),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildVisionColumn(
            context,
            Assets.imagesVision1,
            'Principle-based management',
            'SongHyun was built on over 50 years of transparent management philosophy of Hanglas Group and over 40 years of investment experience.',
          ),
          _buildVisionColumn(
            context,
            Assets.imagesVision2,
            'Mutual Growth',
            'Management team of SongHyun has helped over 40 portfolio companies to have a successful IPO and achieved strong growth with its managed funds; Through this, the management of Songhyun has been able to return profits to all concerned parties.',
          ),
          _buildVisionColumn(
            context,
            Assets.imagesVision3,
            'Long-term perspective Horizon',
            'SongHyun aims to become a world-class investment firm which is committed to a long term investment horizon while strengthening its current growth foundation',
          ),
        ],
      ),
    );
  }

  Widget _buildVisionColumn(BuildContext context, String imageAsset,
      String title, String description) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(imageAsset),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: AppColors.kGreenTextColor, height: 2.0),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.kBlack, height: 1.5),
          ),
        ],
      ),
    );
  }
}
