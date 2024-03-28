import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PhilosophyScreen extends StatelessWidget {
  final bool isMobile;

  const PhilosophyScreen({
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
          title: 'Philosophy',
          image: Assets.imagesHomebgfive,
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

  // List<Widget> _buildMobileVisionColumns(BuildContext context) {
  //   return [
  //     _buildVisionColumn(context, Assets.imagesPhilosophy2,
  //         'Fundamental principles', AppLocalizations.of(context)!.adhereToPrinciples),
  //     _buildVisionColumn(context, Assets.imagesPhilosophy3,
  //         'Transparency and ethics', AppLocalizations.of(context)!.commitmentToTransparency),
  //     _buildVisionColumn(context, Assets.imagesPhilosophy1, 'Value Creation',
  //         AppLocalizations.of(context)!.pursueMutualGrowth),
  //   ];
  // }

  // Widget _buildContent(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(
  //       horizontal: getProportionateScreenWidth(20),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: _buildMobileVisionColumns(context),
  //     ),
  //   );
  // }

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
          Assets.imagesPhilosophy2,
          'Fundamental principles',
          AppLocalizations.of(context)!.adhereToPrinciples),
      _buildVisionColumn(
          context,
          Assets.imagesPhilosophy3,
          'Transparency and ethics',
          AppLocalizations.of(context)!.commitmentToTransparency),
      _buildVisionColumn(context, Assets.imagesPhilosophy1, 'Value Creation',
          AppLocalizations.of(context)!.pursueMutualGrowth),
    ];
  }

  Widget _buildVisionMobileColumn(
    BuildContext context,
    String imageAsset,
    String title,
    String description,
  ) {
    return Column(
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
    );
  }

  Widget _buildMobileVisionColumns(BuildContext context) {
    return Column(
      children: [
        _buildVisionMobileColumn(
            context,
            Assets.imagesPhilosophy2,
            'Fundamental principles',
            AppLocalizations.of(context)!.adhereToPrinciples),
        _buildVisionMobileColumn(
            context,
            Assets.imagesPhilosophy3,
            'Transparency and ethics',
            AppLocalizations.of(context)!.commitmentToTransparency),
        _buildVisionMobileColumn(context, Assets.imagesPhilosophy1,
            'Value Creation', AppLocalizations.of(context)!.pursueMutualGrowth),
      ],
    );
  }
}
