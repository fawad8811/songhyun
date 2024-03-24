import 'package:easy_localization/easy_localization.dart';
import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

class StrategyScreen extends StatelessWidget {
  final bool isMobile;

  const StrategyScreen({
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
          title: 'Strategy',
          image: Assets.imagesBgTopStrategy,
        ),
        SizedBox(height: getProportionateScreenHeight(50)),
        ..._buildwebStategyColumns(context),
        // else
        //   _buildContent(context),
        SizedBox(height: getProportionateScreenHeight(150)),
      ],
    );
  }

  List<Widget> _buildwebStategyColumns(BuildContext context) {
    return [
      _buildStategyColumn(context, Assets.imagesStrategy1,
          'Investment by stage', 'maximizeEnterpriseValue'.tr(),
          richtext: true),
      _buildStategyColumn(
        context,
        Assets.imagesStrategy2,
        'Focus on ICT / AI, Bio / Healthcare & Manufacturing',
        'distributeFundsByIndustry'.tr(),
      ),
      _buildStategyColumn(
          context,
          Assets.imagesStrategy3,
          'Vertical investments into value chains',
          'pursueInvestmentsIntoStrategicCompanies'.tr())
    ];
  }

  Widget _buildStategyColumn(BuildContext context, String imageAsset, String title, String description,
      {bool richtext = false}) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          isMobile ? const SizedBox.shrink() : Image.asset(imageAsset),
          SizedBox(width: getProportionateScreenWidth(20)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isMobile ? Image.asset(imageAsset) : const SizedBox.shrink(),
                _buildTitle(context, title),
                _buildDescription(context, description),
                if (richtext) ..._buildRichTexts(context),
                if (richtext) ..._buildAdditionalText(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: AppColors.kGreenTextColor,
        height: 2.0,
      ),
    );
  }

  Widget _buildDescription(BuildContext context, String description) {
    return Text(
      description,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: AppColors.kBlack,
        height: 1.5,
      ),
    );
  }

  List<Widget> _buildRichTexts(BuildContext context) {
    return [
      richText(context, 'Early : ',
          'entrepreneurWithCreativeTechnology'.tr()),
      richText(context, 'Growth : ', 'technologyOrientedGrowthEnterprise'.tr()),
      richText(context, 'PE : ', 'enterpriseWhichCanGenerateSynergy'.tr()),
    ];
  }

  Widget richText(BuildContext context, String text, String subtext) {
    return Text.rich(
      TextSpan(
        text: text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: const Color(0xff4c7b2b),
          height: 1.5,
          fontSize: 15,
        ),
        children: [
          TextSpan(
            text: subtext,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.kBlack,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAdditionalText(BuildContext context) {
    return [
      SizedBox(height: getProportionateScreenHeight(20)),
      Text(
        'Separate from investment by stage, SongHyun assists in trade sales of individual enterprise’s old shares through secondary fund, and also exit through transaction of fund of portfolio or the fund.',
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: AppColors.kBlack,
          height: 1.5,
          fontSize: 12,
        ),
      ),
    ];
  }
}
