import 'package:easy_localization/easy_localization.dart';
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
          image: Assets.imagesBgTopVision,
        ),
        if (isMobile)
          ..._buildMobileVisionColumns(context)
        else
          _buildContent(context),
        SizedBox(height: getProportionateScreenHeight(150)),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildMobileVisionColumns(context)
            .map((widget) => Flexible(child: widget))
            .toList(),
      ),
    );
  }

  List<Widget> _buildMobileVisionColumns(BuildContext context) {
    return [
      _buildVisionColumn(
        context,
        'assets/images/vision_1.png',
        'principleBasedManagement',
        'managementExperience',
      ),
      _buildVisionColumn(
        context,
        'assets/images/vision_2.png',
        'mutualGrowth',
        'ipoSuccess',
      ),
      _buildVisionColumn(
        context,
        'assets/images/vision_3.png',
        'longTermPerspective',
        'worldClassInvestment',
      ),
    ];
  }

  Widget _buildVisionColumn(
    BuildContext context,
    String imageAsset,
    String titleKey,
    String descriptionKey,
  ) {
    return Column(
      children: [
        Image.asset(imageAsset),
        Text(
          titleKey.tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: AppColors.kGreenTextColor, height: 2.0),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            descriptionKey.tr(),
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
}
