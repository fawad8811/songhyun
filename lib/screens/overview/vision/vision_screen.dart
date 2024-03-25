import 'package:flutter/material.dart';
import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VisionScreen extends StatelessWidget {
  final bool isMobile;

  const VisionScreen({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        const PageHead(
          title: 'Vision',
          image: Assets.imagesBgTopVision,
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: isMobile
              ? _buildMobileVisionColumns(context)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildWebVisionColumns(context),
                ),
        ),
        SizedBox(height: getProportionateScreenHeight(150)),
      ],
    );
  }

  Widget _buildVisionColumn(
    BuildContext context,
    String imageAsset,
    String title,
    String description,
  ) {
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
          SizedBox(height: getProportionateScreenHeight(10)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppColors.kBlack, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildWebVisionColumns(BuildContext context) {
    return [
      _buildVisionColumn(
        context,
        'assets/images/vision_1.png',
        AppLocalizations.of(context)!.principleBasedManagement,
        AppLocalizations.of(context)!.managementExperience,
      ),
      _buildVisionColumn(
        context,
        'assets/images/vision_2.png',
        AppLocalizations.of(context)!.mutualGrowth,
        AppLocalizations.of(context)!.ipoSuccess,
      ),
      _buildVisionColumn(
        context,
        'assets/images/vision_3.png',
        AppLocalizations.of(context)!.longTermPerspective,
        AppLocalizations.of(context)!.worldClassInvestment,
      ),
    ];
  }

  Widget _buildVisionMobileColumn(
    BuildContext context,
    String imageAsset,
    String titleKey,
    String descriptionKey,
  ) {
    return Column(
      children: [
        Image.asset(imageAsset),
        Text(
          titleKey,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: AppColors.kGreenTextColor, height: 2.0),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            descriptionKey,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.kBlack, height: 1.5),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileVisionColumns(BuildContext context) {
    return Column(
      children: [
        _buildVisionMobileColumn(
          context,
          Assets.imagesVision1,
         AppLocalizations.of(context)!.principleBasedManagement,
        AppLocalizations.of(context)!.managementExperience,
      ),
        _buildVisionMobileColumn(
          context,
          Assets.imagesVision2,
          AppLocalizations.of(context)!.mutualGrowth,
        AppLocalizations.of(context)!.ipoSuccess,
        ),
        _buildVisionMobileColumn(
          context,
          Assets.imagesVision3,
           AppLocalizations.of(context)!.longTermPerspective,
        AppLocalizations.of(context)!.worldClassInvestment,
        ),
      ],
    );
  }
}
