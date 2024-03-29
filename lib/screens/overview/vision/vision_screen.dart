import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

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
          image: Assets.imagesHomebgtwo,
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
      child: Padding(
        padding: EdgeInsets.only(
          top: getProportionateScreenHeight(50)
        ),
        child: Column(
          children: [
            Image.asset(
              imageAsset,
              fit: BoxFit.scaleDown,
              width: getProportionateScreenWidth(150),
              height: getProportionateScreenHeight(150),
            ),
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
      ),
    );
  }

  List<Widget> _buildWebVisionColumns(BuildContext context) {
    return [
      _buildVisionColumn(
        context,
        Assets.imagesMoney,
        AppLocalizations.of(context)!.principleBasedManagement,
        AppLocalizations.of(context)!.managementExperience,
      ),
      _buildVisionColumn(
        context,
        Assets.imagesMutualGrowth,
        AppLocalizations.of(context)!.mutualGrowth,
        AppLocalizations.of(context)!.ipoSuccess,
      ),
      _buildVisionColumn(
        context,
        Assets.imagesMoreMoney,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: getProportionateScreenHeight(100),
            width: getProportionateScreenWidth(100),
            child: Image.asset(
                fit: BoxFit.cover,
                imageAsset),
          ),
        ),
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
          Assets.imagesMoney,
         AppLocalizations.of(context)!.principleBasedManagement,
        AppLocalizations.of(context)!.managementExperience,
      ),
        _buildVisionMobileColumn(
          context,
          Assets.imagesMutualGrowth,
          AppLocalizations.of(context)!.mutualGrowth,
          AppLocalizations.of(context)!.ipoSuccess,
        ),
        _buildVisionMobileColumn(
          context,
          Assets.imagesMoreMoney,
           AppLocalizations.of(context)!.longTermPerspective,
        AppLocalizations.of(context)!.worldClassInvestment,
        ),
      ],
    );
  }
}
