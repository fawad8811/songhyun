import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

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
          image: Assets.imagesBgTopPhilosophy,
        ),
        if (isMobile)
          ..._buildMobileVisionColumns(context)
        else
          _buildContent(context),
        SizedBox(height: getProportionateScreenHeight(150)),
      ],
    );
  }

  List<Widget> _buildMobileVisionColumns(BuildContext context) {
    return [
      _buildVisionColumn(
          context,
          Assets.imagesPhilosophy2,
          'Fundamental principles',
          'Adhere to enduring principles that have guided investment decision and processes including due diligence from our inception.'),
      _buildVisionColumn(
        context,
        Assets.imagesPhilosophy3,
        'Transparency and ethics',
        'Commitment to transparent decision making and high ethical standards.',
      ),
      _buildVisionColumn(context, Assets.imagesVision1, 'Value Creation',
          'Pursue mutual growth with portfolio companies through value creation.'),
    ];
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildMobileVisionColumns(context),
      ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
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
}
